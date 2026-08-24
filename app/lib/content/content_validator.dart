import 'content_models.dart';

final class ContentValidationIssue {
  const ContentValidationIssue(this.code, this.detail, {this.recordId});

  final String code;
  final String detail;
  final ContentId? recordId;
}

final class ContentValidationResult {
  const ContentValidationResult(this.issues);

  final List<ContentValidationIssue> issues;
  bool get isValid => issues.isEmpty;
}

/// Cryptographic operations are supplied by the application boundary so the
/// content model does not select or silently trust keys from an imported pack.
abstract interface class BundleIntegrityVerifier {
  Future<String> sha256(List<int> bytes);

  Future<bool> verifySignature({
    required String canonicalPayload,
    required BundleSignature signature,
  });
}

final class ContentBundleValidator {
  const ContentBundleValidator(this.integrityVerifier);

  final BundleIntegrityVerifier integrityVerifier;

  Future<ContentValidationResult> validate({
    required ManifestRecord manifest,
    required List<ContentRecord> records,
    required Map<String, List<int>> files,
  }) async {
    final issues = <ContentValidationIssue>[];
    void add(String code, String detail, [ContentId? id]) =>
        issues.add(ContentValidationIssue(code, detail, recordId: id));

    for (final detail in ManifestContract.validateStructure(manifest)) {
      add('manifest.structure', detail, manifest.id);
    }

    final byId = <ContentId, ContentRecord>{};
    for (final record in [...records, manifest]) {
      if (byId.containsKey(record.id)) {
        add(
          'id.duplicate',
          'Duplicate stable ID ${record.id.value}',
          record.id,
        );
      } else {
        byId[record.id] = record;
      }
    }

    final gardinerCodes = <String, ContentId>{};
    final expectedRecordIds = <ContentId>{};
    final expectedAssetIds = <ContentId>{};
    for (final record in records) {
      if (record is AssetRecord) {
        expectedAssetIds.add(record.id);
      } else {
        expectedRecordIds.add(record.id);
      }
      if (record is GlyphRecord) {
        final code = record.gardinerCode;
        if (code != null && gardinerCodes.containsKey(code)) {
          add(
            'glyph.gardiner_duplicate',
            'Duplicate Gardiner code $code',
            record.id,
          );
        } else if (code != null) {
          gardinerCodes[code] = record.id;
        }
        final scalar = record.unicodeScalar;
        if (scalar != null && !_isUnicodeScalar(scalar)) {
          add(
            'glyph.unicode_invalid',
            'Invalid Unicode scalar $scalar',
            record.id,
          );
        }
      }
    }

    _compareIds(
      actual: manifest.recordIds,
      expected: expectedRecordIds,
      code: 'manifest.records',
      add: add,
      manifestId: manifest.id,
    );
    _compareIds(
      actual: manifest.assetIds,
      expected: expectedAssetIds,
      code: 'manifest.assets',
      add: add,
      manifestId: manifest.id,
    );

    void requireRef(ContentId owner, ContentId target, String field) {
      if (!byId.containsKey(target)) {
        add(
          'reference.missing',
          '$field references missing ${target.value}',
          owner,
        );
      }
    }

    void requireRefs(
      ContentId owner,
      Iterable<ContentId> targets,
      String field,
    ) {
      for (final target in targets) {
        requireRef(owner, target, field);
      }
    }

    for (final record in records) {
      switch (record) {
        case CourseRecord():
          requireRefs(record.id, record.unitIds, 'unitIds');
          requireRef(record.id, record.titleKey, 'titleKey');
        case UnitRecord():
          requireRefs(record.id, record.lessonIds, 'lessonIds');
          requireRefs(record.id, record.prerequisiteIds, 'prerequisiteIds');
        case LessonRecord():
          requireRefs(record.id, record.exerciseIds, 'exerciseIds');
          requireRef(record.id, record.objectiveKey, 'objectiveKey');
        case GlyphRecord():
          requireRef(record.id, record.assetId, 'assetId');
          requireRef(record.id, record.constructionId, 'constructionId');
          requireRefs(record.id, record.sourceIds, 'sourceIds');
          requireRef(record.id, record.reviewId, 'reviewId');
          requireRef(record.id, record.accessibilityKey, 'accessibilityKey');
          _requirePublicationEvidence(record, manifest, byId, add);
        case LexemeRecord():
          requireRefs(record.id, record.glyphIds, 'glyphIds');
          requireRefs(record.id, record.sourceIds, 'sourceIds');
          requireRef(record.id, record.glossKey, 'glossKey');
          requireRef(record.id, record.reviewId, 'reviewId');
          requireRef(record.id, record.accessibilityKey, 'accessibilityKey');
          _requirePublicationEvidence(record, manifest, byId, add);
        case ReadingRecord():
          requireRefs(record.id, record.glyphIds, 'glyphIds');
          requireRefs(record.id, record.sourceIds, 'sourceIds');
          requireRef(record.id, record.translationKey, 'translationKey');
          requireRef(record.id, record.reviewId, 'reviewId');
          requireRef(record.id, record.accessibilityKey, 'accessibilityKey');
          _requirePublicationEvidence(record, manifest, byId, add);
        case ExerciseRecord():
          requireRef(record.id, record.promptKey, 'promptKey');
          requireRef(
            record.id,
            record.accessibilityAlternativeKey,
            'accessibilityAlternativeKey',
          );
          requireRefs(record.id, record.answerIds, 'answerIds');
          requireRefs(record.id, record.distractorIds, 'distractorIds');
          if (record.answerIds.isEmpty) {
            add(
              'exercise.answers_empty',
              'Exercise requires an answer',
              record.id,
            );
          }
          if (record.answerPolicy == AnswerPolicy.single &&
              record.answerIds.length != 1) {
            add(
              'exercise.answer_policy',
              'Single-answer policy requires exactly one answer',
              record.id,
            );
          }
          final overlap = record.answerIds.toSet().intersection(
            record.distractorIds.toSet(),
          );
          if (overlap.isNotEmpty) {
            add(
              'exercise.distractor_is_answer',
              'Distractors overlap answers: ${overlap.map((id) => id.value).join(', ')}',
              record.id,
            );
          }
        case AssetRecord():
          requireRef(record.id, record.sourceId, 'sourceId');
          if (!_isSafeRelativePath(record.path)) {
            add(
              'asset.path_unsafe',
              'Unsafe asset path ${record.path}',
              record.id,
            );
          }
          final expected = manifest.checksums[record.path];
          if (expected == null || expected != record.sha256) {
            add(
              'asset.checksum_manifest',
              'Manifest checksum does not match ${record.path}',
              record.id,
            );
          }
        case ConstructionRecord():
          requireRefs(record.id, record.segmentAssetIds, 'segmentAssetIds');
          requireRef(record.id, record.toleranceId, 'toleranceId');
          requireRefs(record.id, record.feedbackIds, 'feedbackIds');
          if (record.acceptedSequences.isEmpty ||
              record.acceptedSequences.any((sequence) => sequence.isEmpty)) {
            add(
              'construction.sequence_empty',
              'At least one non-empty accepted sequence is required',
              record.id,
            );
          }
        case FeedbackRecord():
          requireRef(record.id, record.messageKey, 'messageKey');
        case LocalizationRecord():
          if (!record.values.containsKey('en') ||
              record.values['en']!.trim().isEmpty) {
            add(
              'localization.english_missing',
              'English localization value is required',
              record.id,
            );
          }
        case SourceRecord() || ReviewRecord() || ToleranceRecord():
          break;
        case ManifestRecord():
          add(
            'manifest.nested',
            'Manifest must be supplied separately',
            record.id,
          );
      }
    }

    for (final approvalId in manifest.approvalIds) {
      final approval = byId[approvalId];
      if (approval is! ReviewRecord || approval.state != ReviewState.approved) {
        add(
          'approval.invalid',
          'Approval ${approvalId.value} is not approved',
          manifest.id,
        );
      }
    }

    for (final entry in manifest.checksums.entries) {
      final bytes = files[entry.key];
      if (bytes == null) {
        add(
          'bundle.file_missing',
          'Missing checksummed file ${entry.key}',
          manifest.id,
        );
      } else if (await integrityVerifier.sha256(bytes) != entry.value) {
        add(
          'bundle.checksum_invalid',
          'Checksum mismatch for ${entry.key}',
          manifest.id,
        );
      }
    }

    final signatureValid = await integrityVerifier.verifySignature(
      canonicalPayload: manifest.canonicalSigningPayload(),
      signature: manifest.signature,
    );
    if (!signatureValid) {
      add(
        'signature.invalid',
        'Bundle signature verification failed',
        manifest.id,
      );
    }

    return ContentValidationResult(List.unmodifiable(issues));
  }
}

typedef _IssueAdder = void Function(
  String code,
  String detail, [
  ContentId? id,
]);

void _compareIds({
  required List<ContentId> actual,
  required Set<ContentId> expected,
  required String code,
  required _IssueAdder add,
  required ContentId manifestId,
}) {
  if (actual.length != actual.toSet().length ||
      actual.toSet().difference(expected).isNotEmpty ||
      expected.difference(actual.toSet()).isNotEmpty) {
    add(
      code,
      'Manifest inventory does not exactly match bundle records',
      manifestId,
    );
  }
}

void _requirePublicationEvidence(
  ContentRecord record,
  ManifestRecord manifest,
  Map<ContentId, ContentRecord> byId,
  _IssueAdder add,
) {
  if (manifest.channel != BundleChannel.production) return;
  final (sources, reviewId) = switch (record) {
    GlyphRecord() => (record.sourceIds, record.reviewId),
    LexemeRecord() => (record.sourceIds, record.reviewId),
    ReadingRecord() => (record.sourceIds, record.reviewId),
    _ => (<ContentId>[], ContentId('review.unreachable')),
  };
  if (sources.isEmpty) {
    add(
      'publication.sources_missing',
      'Published scholarly record requires a source',
      record.id,
    );
  }
  final review = byId[reviewId];
  if (review is! ReviewRecord || review.state != ReviewState.approved) {
    add(
      'publication.review_missing',
      'Published scholarly record requires approved review',
      record.id,
    );
  }
}

bool _isUnicodeScalar(int value) =>
    value >= 0 && value <= 0x10ffff && !(value >= 0xd800 && value <= 0xdfff);

bool _isSafeRelativePath(String path) =>
    path.isNotEmpty &&
    !path.startsWith('/') &&
    !path.contains('\\') &&
    !path.split('/').contains('..');
