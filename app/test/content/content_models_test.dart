import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:kheper/content/content_models.dart';

void main() {
  const version = '1.0.0';

  final fixtures = <Map<String, Object?>>[
    {
      'type': 'course',
      'id': 'course.fixture',
      'version': version,
      'unitIds': <String>[],
      'titleKey': 'localization.course_title',
    },
    {
      'type': 'unit',
      'id': 'unit.fixture',
      'version': version,
      'lessonIds': <String>[],
      'prerequisiteIds': <String>[],
    },
    {
      'type': 'lesson',
      'id': 'lesson.fixture',
      'version': version,
      'exerciseIds': <String>[],
      'objectiveKey': 'localization.lesson_objective',
    },
    {
      'type': 'glyph',
      'id': 'glyph.fixture',
      'version': version,
      'assetId': 'asset.fixture',
      'constructionId': 'construction.fixture',
      'sourceIds': <String>[],
      'reviewId': 'review.fixture',
      'accessibilityKey': 'localization.glyph_description',
    },
    {
      'type': 'lexeme',
      'id': 'lexeme.fixture',
      'version': version,
      'glyphIds': <String>[],
      'transliteration': 'fixture-only',
      'glossKey': 'localization.lexeme_gloss',
      'sourceIds': <String>[],
      'reviewId': 'review.fixture',
      'accessibilityKey': 'localization.lexeme_description',
    },
    {
      'type': 'reading',
      'id': 'reading.fixture',
      'version': version,
      'glyphIds': <String>[],
      'direction': 'rightToLeft',
      'translationKey': 'localization.reading_translation',
      'sourceIds': <String>[],
      'reviewId': 'review.fixture',
      'accessibilityKey': 'localization.reading_description',
    },
    {
      'type': 'exercise',
      'id': 'exercise.fixture',
      'version': version,
      'kind': 'recognition',
      'promptKey': 'localization.exercise_prompt',
      'answerIds': <String>[],
      'distractorIds': <String>[],
      'answerPolicy': 'single',
      'masteryDimensions': <String>['recognition'],
      'accessibilityAlternativeKey': 'localization.exercise_alternative',
    },
    {
      'type': 'source',
      'id': 'source.fixture',
      'version': version,
      'citation': 'Structural fixture; not a scholarly source.',
      'license': 'CC-BY-SA-4.0',
    },
    {
      'type': 'asset',
      'id': 'asset.fixture',
      'version': version,
      'kind': 'vector',
      'path': 'fixtures/placeholder.svg',
      'sha256':
          '0000000000000000000000000000000000000000000000000000000000000000',
      'sourceId': 'source.fixture',
    },
    {
      'type': 'review',
      'id': 'review.fixture',
      'version': version,
      'state': 'draft',
      'roles': <String>[],
    },
    {
      'type': 'construction',
      'id': 'construction.fixture',
      'version': version,
      'segmentAssetIds': <String>[],
      'acceptedSequences': <List<String>>[<String>[]],
      'toleranceId': 'tolerance.fixture',
      'feedbackIds': <String>[],
    },
    {
      'type': 'tolerance',
      'id': 'tolerance.fixture',
      'version': version,
      'shape': 0.4,
      'proportion': 0.2,
      'placement': 0.15,
      'topology': 0.15,
      'sequence': 0.1,
    },
    {
      'type': 'feedback',
      'id': 'feedback.fixture',
      'version': version,
      'issueCode': 'fixture',
      'messageKey': 'localization.feedback_fixture',
    },
    {
      'type': 'localization',
      'id': 'localization.fixture',
      'version': version,
      'values': <String, String>{'en': 'Structural fixture'},
    },
    {
      'type': 'manifest',
      'id': 'manifest.fixture',
      'version': version,
      'schemaVersion': contentSchemaVersion,
      'curriculumVersion': '0.0.0-fixture',
      'recordIds': <String>[],
      'assetIds': <String>[],
      'checksums': <String, String>{
        'records.json':
            '0000000000000000000000000000000000000000000000000000000000000000',
      },
      'approvalIds': <String>[],
      'channel': 'staging',
      'minimumAppVersion': '1.0.0',
      'signature': <String, String>{
        'algorithm': 'ed25519',
        'keyId': 'key.fixture',
        'value': 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==',
      },
    },
  ];

  test('every KHEPER-044 record type decodes and round-trips', () {
    expect(fixtures, hasLength(15));
    for (final fixture in fixtures) {
      final record = contentRecordFromJson(fixture);
      final decoded =
          jsonDecode(encodeContentRecord(record)) as Map<String, Object?>;
      expect(
        decoded,
        fixture,
        reason: 'round-trip failed for ${fixture['type']}',
      );
    }
  });

  test('stable IDs require a namespace and expected prefix', () {
    expect(() => ContentId.parse('fixture'), throwsFormatException);
    expect(
      () => ContentId.parse('unit.fixture', prefix: 'course'),
      throwsFormatException,
    );
    expect(
      ContentId.parse('course.fixture', prefix: 'course').value,
      'course.fixture',
    );
  });

  test('unknown record types fail closed', () {
    expect(
      () => contentRecordFromJson({'type': 'unknown'}),
      throwsFormatException,
    );
  });

  test('valid staging manifest passes structural checks', () {
    final manifest = ManifestRecord.fromJson(fixtures.last);
    expect(ManifestContract.validateStructure(manifest), isEmpty);
  });

  test('production manifest fails closed without approvals', () {
    final invalid = <String, Object?>{
      ...fixtures.last,
      'channel': 'production',
      'checksums': <String, String>{'../escape': 'not-a-sha'},
      'signature': <String, String>{
        'algorithm': 'ed25519',
        'keyId': 'invalid',
        'value': 'not-base64',
      },
    };
    final issues = ManifestContract.validateStructure(
      ManifestRecord.fromJson(invalid),
    );

    expect(issues, contains('production bundles require approval references'));
    expect(issues, contains('checksum path must stay relative: ../escape'));
    expect(issues, contains('checksum must be lowercase SHA-256: ../escape'));
    expect(issues, contains('signature value must be valid base64'));
    expect(
      issues,
      contains('signature key ID must be a stable key.* identifier'),
    );
  });

  test('canonical signing payload is stable and excludes signature bytes', () {
    final first = ManifestRecord.fromJson(fixtures.last);
    final reordered = Map<String, Object?>.fromEntries(
      fixtures.last.entries.toList().reversed,
    );
    final second = ManifestRecord.fromJson(reordered);

    expect(first.canonicalSigningPayload(), second.canonicalSigningPayload());
    expect(first.canonicalSigningPayload(), isNot(contains('signature')));
  });
}
