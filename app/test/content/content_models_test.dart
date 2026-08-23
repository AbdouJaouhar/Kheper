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
    },
    {
      'type': 'reading',
      'id': 'reading.fixture',
      'version': version,
      'glyphIds': <String>[],
      'direction': 'rightToLeft',
      'translationKey': 'localization.reading_translation',
      'sourceIds': <String>[],
    },
    {
      'type': 'exercise',
      'id': 'exercise.fixture',
      'version': version,
      'kind': 'recognition',
      'promptKey': 'localization.exercise_prompt',
      'answerIds': <String>[],
      'masteryDimensions': <String>['recognition'],
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
      'checksums': <String, String>{},
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
}
