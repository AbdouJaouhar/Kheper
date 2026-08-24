import 'package:flutter_test/flutter_test.dart';
import 'package:kheper/content/content_models.dart';
import 'package:kheper/content/content_validator.dart';

const _version = '1.0.0';
const _sha = '0000000000000000000000000000000000000000000000000000000000000000';
const _signature =
    'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==';

final class _FakeIntegrityVerifier implements BundleIntegrityVerifier {
  const _FakeIntegrityVerifier({this.signatureValid = true});
  final bool signatureValid;

  @override
  Future<String> sha256(List<int> bytes) async => _sha;

  @override
  Future<bool> verifySignature({
    required String canonicalPayload,
    required BundleSignature signature,
  }) async => signatureValid;
}

ContentId _id(String value) => ContentId(value);

List<ContentRecord> _validRecords() {
  final localizationKeys = <String>[
    'localization.course_title',
    'localization.lesson_objective',
    'localization.glyph_description',
    'localization.lexeme_gloss',
    'localization.lexeme_description',
    'localization.reading_translation',
    'localization.reading_description',
    'localization.exercise_prompt',
    'localization.exercise_alternative',
    'localization.feedback_message',
  ];
  return <ContentRecord>[
    ...localizationKeys.map(
      (key) => LocalizationRecord(
        _id(key),
        _version,
        values: const {'en': 'Structural fixture'},
      ),
    ),
    SourceRecord(
      _id('source.fixture'),
      _version,
      citation: 'Structural fixture',
      license: 'CC-BY-SA-4.0',
    ),
    ReviewRecord(
      _id('review.approved'),
      _version,
      state: ReviewState.approved,
      roles: const ['linguistic', 'calligraphy'],
    ),
    AssetRecord(
      _id('asset.fixture'),
      _version,
      kind: AssetKind.vector,
      path: 'assets/fixture.svg',
      sha256: _sha,
      sourceId: _id('source.fixture'),
    ),
    ToleranceRecord(
      _id('tolerance.fixture'),
      _version,
      shape: 0.4,
      proportion: 0.2,
      placement: 0.15,
      topology: 0.15,
      sequence: 0.1,
    ),
    FeedbackRecord(
      _id('feedback.fixture'),
      _version,
      issueCode: 'fixture',
      messageKey: _id('localization.feedback_message'),
    ),
    ConstructionRecord(
      _id('construction.fixture'),
      _version,
      segmentAssetIds: [_id('asset.fixture')],
      acceptedSequences: const [
        ['segment-1'],
      ],
      toleranceId: _id('tolerance.fixture'),
      feedbackIds: [_id('feedback.fixture')],
    ),
    GlyphRecord(
      _id('glyph.fixture'),
      _version,
      gardinerCode: 'FIXTURE-1',
      unicodeScalar: 0x13000,
      assetId: _id('asset.fixture'),
      constructionId: _id('construction.fixture'),
      sourceIds: [_id('source.fixture')],
      reviewId: _id('review.approved'),
      accessibilityKey: _id('localization.glyph_description'),
    ),
    LexemeRecord(
      _id('lexeme.fixture'),
      _version,
      glyphIds: [_id('glyph.fixture')],
      transliteration: 'fixture-only',
      glossKey: _id('localization.lexeme_gloss'),
      sourceIds: [_id('source.fixture')],
      reviewId: _id('review.approved'),
      accessibilityKey: _id('localization.lexeme_description'),
    ),
    ReadingRecord(
      _id('reading.fixture'),
      _version,
      glyphIds: [_id('glyph.fixture')],
      direction: 'rightToLeft',
      translationKey: _id('localization.reading_translation'),
      sourceIds: [_id('source.fixture')],
      reviewId: _id('review.approved'),
      accessibilityKey: _id('localization.reading_description'),
    ),
    ExerciseRecord(
      _id('exercise.fixture'),
      _version,
      kind: ExerciseKind.recognition,
      promptKey: _id('localization.exercise_prompt'),
      answerIds: [_id('glyph.fixture')],
      distractorIds: const [],
      answerPolicy: AnswerPolicy.single,
      masteryDimensions: const ['recognition'],
      accessibilityAlternativeKey: _id('localization.exercise_alternative'),
    ),
    LessonRecord(
      _id('lesson.fixture'),
      _version,
      exerciseIds: [_id('exercise.fixture')],
      objectiveKey: _id('localization.lesson_objective'),
    ),
    UnitRecord(
      _id('unit.fixture'),
      _version,
      lessonIds: [_id('lesson.fixture')],
    ),
    CourseRecord(
      _id('course.fixture'),
      _version,
      unitIds: [_id('unit.fixture')],
      titleKey: _id('localization.course_title'),
    ),
  ];
}

ManifestRecord _manifest(List<ContentRecord> records) => ManifestRecord(
  _id('manifest.fixture'),
  _version,
  schemaVersion: contentSchemaVersion,
  curriculumVersion: '0.0.0-fixture',
  recordIds: [
    for (final record in records)
      if (record is! AssetRecord) record.id,
  ],
  assetIds: [
    for (final record in records)
      if (record is AssetRecord) record.id,
  ],
  checksums: const {'assets/fixture.svg': _sha},
  approvalIds: [_id('review.approved')],
  channel: BundleChannel.production,
  minimumAppVersion: '1.0.0',
  signature: const BundleSignature(
    algorithm: SignatureAlgorithm.ed25519,
    keyId: 'key.fixture',
    value: _signature,
  ),
);

void main() {
  test('accepts a complete, internally consistent production bundle', () async {
    final records = _validRecords();
    final result = await const ContentBundleValidator(_FakeIntegrityVerifier())
        .validate(
          manifest: _manifest(records),
          records: records,
          files: const {
            'assets/fixture.svg': [1, 2, 3],
          },
        );
    expect(
      result.isValid,
      isTrue,
      reason: result.issues
          .map((issue) => '${issue.code}: ${issue.detail}')
          .join('\n'),
    );
  });

  test('invalid signature blocks an otherwise valid bundle', () async {
    final records = _validRecords();
    final result =
        await const ContentBundleValidator(
          _FakeIntegrityVerifier(signatureValid: false),
        ).validate(
          manifest: _manifest(records),
          records: records,
          files: const {
            'assets/fixture.svg': [1],
          },
        );
    expect(result.isValid, isFalse);
    expect(
      result.issues.map((issue) => issue.code),
      contains('signature.invalid'),
    );
  });

  test(
    'reports catalogue, exercise, reference and construction failures',
    () async {
      final records = _validRecords();
      records.addAll([
        GlyphRecord(
          _id('glyph.invalid'),
          _version,
          gardinerCode: 'FIXTURE-1',
          unicodeScalar: 0xd800,
          assetId: _id('asset.missing'),
          constructionId: _id('construction.missing'),
          sourceIds: const [],
          reviewId: _id('review.missing'),
          accessibilityKey: _id('localization.missing'),
        ),
        ExerciseRecord(
          _id('exercise.invalid'),
          _version,
          kind: ExerciseKind.recognition,
          promptKey: _id('localization.exercise_prompt'),
          answerIds: [_id('glyph.fixture')],
          distractorIds: [_id('glyph.fixture')],
          answerPolicy: AnswerPolicy.single,
          masteryDimensions: const ['recognition'],
          accessibilityAlternativeKey: _id('localization.exercise_alternative'),
        ),
        ConstructionRecord(
          _id('construction.invalid'),
          _version,
          segmentAssetIds: const [],
          acceptedSequences: const [[]],
          toleranceId: _id('tolerance.fixture'),
          feedbackIds: const [],
        ),
      ]);
      final result =
          await const ContentBundleValidator(_FakeIntegrityVerifier()).validate(
            manifest: _manifest(records),
            records: records,
            files: const {
              'assets/fixture.svg': [1],
            },
          );
      final codes = result.issues.map((issue) => issue.code).toSet();
      expect(
        codes,
        containsAll(<String>{
          'glyph.gardiner_duplicate',
          'glyph.unicode_invalid',
          'reference.missing',
          'publication.sources_missing',
          'publication.review_missing',
          'exercise.distractor_is_answer',
          'construction.sequence_empty',
        }),
      );
    },
  );

  test(
    'duplicate IDs, missing files and inventory drift block activation',
    () async {
      final records = _validRecords();
      records.add(records.first);
      final manifest = _manifest(records);
      final drifted = ManifestRecord(
        manifest.id,
        manifest.version,
        schemaVersion: manifest.schemaVersion,
        curriculumVersion: manifest.curriculumVersion,
        recordIds: manifest.recordIds
            .where((id) => id != _id('course.fixture'))
            .toList(),
        assetIds: manifest.assetIds,
        checksums: manifest.checksums,
        approvalIds: manifest.approvalIds,
        channel: manifest.channel,
        minimumAppVersion: manifest.minimumAppVersion,
        signature: manifest.signature,
      );
      final result = await const ContentBundleValidator(
        _FakeIntegrityVerifier(),
      ).validate(manifest: drifted, records: records, files: const {});
      final codes = result.issues.map((issue) => issue.code);
      expect(codes, contains('id.duplicate'));
      expect(codes, contains('manifest.records'));
      expect(codes, contains('bundle.file_missing'));
    },
  );
}
