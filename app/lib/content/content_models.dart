import 'dart:convert';

/// Version of the content contract understood by this application.
const contentSchemaVersion = '1.0.0';

final RegExp _stableIdPattern = RegExp(r'^[a-z][a-z0-9]*(?:[._-][a-z0-9]+)+$');

/// A durable, namespaced identifier such as `course.foundation`.
extension type const ContentId(String value) {
  factory ContentId.parse(Object? value, {String? prefix}) {
    if (value is! String ||
        !_stableIdPattern.hasMatch(value) ||
        (prefix != null && !value.startsWith('$prefix.'))) {
      throw FormatException('Invalid stable content ID: $value');
    }
    return ContentId(value);
  }
}

enum ReviewState { draft, inReview, approved, rejected }

enum AssetKind { vector, image, audio, data }

enum ExerciseKind {
  introduction,
  trace,
  copy,
  drawFromMemory,
  recognition,
  typedRecall,
  readingDirection,
  buildWord,
}

abstract interface class ContentRecord {
  ContentId get id;
  String get version;
  Map<String, Object?> toJson();
}

typedef JsonMap = Map<String, Object?>;

List<ContentId> _ids(Object? value) => (value as List<Object?>? ?? const [])
    .map(ContentId.parse)
    .toList(growable: false);

List<String> _strings(Object? value) =>
    (value as List<Object?>? ?? const []).cast<String>();

JsonMap _map(Object? value) =>
    (value as Map<Object?, Object?>).cast<String, Object?>();

abstract base class VersionedRecord implements ContentRecord {
  const VersionedRecord(this.id, this.version);

  @override
  final ContentId id;
  @override
  final String version;

  JsonMap baseJson(String type) => {
    'type': type,
    'id': id.value,
    'version': version,
  };
}

final class CourseRecord extends VersionedRecord {
  const CourseRecord(
    super.id,
    super.version, {
    required this.unitIds,
    required this.titleKey,
  });
  final List<ContentId> unitIds;
  final ContentId titleKey;

  factory CourseRecord.fromJson(JsonMap json) => CourseRecord(
    ContentId.parse(json['id'], prefix: 'course'),
    json['version'] as String,
    unitIds: _ids(json['unitIds']),
    titleKey: ContentId.parse(json['titleKey'], prefix: 'localization'),
  );

  @override
  JsonMap toJson() => {
    ...baseJson('course'),
    'unitIds': unitIds.map((id) => id.value).toList(),
    'titleKey': titleKey.value,
  };
}

final class UnitRecord extends VersionedRecord {
  const UnitRecord(
    super.id,
    super.version, {
    required this.lessonIds,
    this.prerequisiteIds = const [],
  });
  final List<ContentId> lessonIds;
  final List<ContentId> prerequisiteIds;

  factory UnitRecord.fromJson(JsonMap json) => UnitRecord(
    ContentId.parse(json['id'], prefix: 'unit'),
    json['version'] as String,
    lessonIds: _ids(json['lessonIds']),
    prerequisiteIds: _ids(json['prerequisiteIds']),
  );

  @override
  JsonMap toJson() => {
    ...baseJson('unit'),
    'lessonIds': lessonIds.map((id) => id.value).toList(),
    'prerequisiteIds': prerequisiteIds.map((id) => id.value).toList(),
  };
}

final class LessonRecord extends VersionedRecord {
  const LessonRecord(
    super.id,
    super.version, {
    required this.exerciseIds,
    required this.objectiveKey,
  });
  final List<ContentId> exerciseIds;
  final ContentId objectiveKey;

  factory LessonRecord.fromJson(JsonMap json) => LessonRecord(
    ContentId.parse(json['id'], prefix: 'lesson'),
    json['version'] as String,
    exerciseIds: _ids(json['exerciseIds']),
    objectiveKey: ContentId.parse(json['objectiveKey'], prefix: 'localization'),
  );

  @override
  JsonMap toJson() => {
    ...baseJson('lesson'),
    'exerciseIds': exerciseIds.map((id) => id.value).toList(),
    'objectiveKey': objectiveKey.value,
  };
}

final class GlyphRecord extends VersionedRecord {
  const GlyphRecord(
    super.id,
    super.version, {
    this.gardinerCode,
    this.unicodeScalar,
    required this.assetId,
    required this.constructionId,
    required this.sourceIds,
    required this.reviewId,
    required this.accessibilityKey,
  });
  final String? gardinerCode;
  final int? unicodeScalar;
  final ContentId assetId;
  final ContentId constructionId;
  final List<ContentId> sourceIds;
  final ContentId reviewId;
  final ContentId accessibilityKey;

  factory GlyphRecord.fromJson(JsonMap json) => GlyphRecord(
    ContentId.parse(json['id'], prefix: 'glyph'),
    json['version'] as String,
    gardinerCode: json['gardinerCode'] as String?,
    unicodeScalar: json['unicodeScalar'] as int?,
    assetId: ContentId.parse(json['assetId'], prefix: 'asset'),
    constructionId: ContentId.parse(
      json['constructionId'],
      prefix: 'construction',
    ),
    sourceIds: _ids(json['sourceIds']),
    reviewId: ContentId.parse(json['reviewId'], prefix: 'review'),
    accessibilityKey: ContentId.parse(
      json['accessibilityKey'],
      prefix: 'localization',
    ),
  );

  @override
  JsonMap toJson() => {
    ...baseJson('glyph'),
    if (gardinerCode != null) 'gardinerCode': gardinerCode,
    if (unicodeScalar != null) 'unicodeScalar': unicodeScalar,
    'assetId': assetId.value,
    'constructionId': constructionId.value,
    'sourceIds': sourceIds.map((id) => id.value).toList(),
    'reviewId': reviewId.value,
    'accessibilityKey': accessibilityKey.value,
  };
}

final class LexemeRecord extends VersionedRecord {
  const LexemeRecord(
    super.id,
    super.version, {
    required this.glyphIds,
    required this.transliteration,
    required this.glossKey,
    required this.sourceIds,
  });
  final List<ContentId> glyphIds;
  final String transliteration;
  final ContentId glossKey;
  final List<ContentId> sourceIds;

  factory LexemeRecord.fromJson(JsonMap json) => LexemeRecord(
    ContentId.parse(json['id'], prefix: 'lexeme'),
    json['version'] as String,
    glyphIds: _ids(json['glyphIds']),
    transliteration: json['transliteration'] as String,
    glossKey: ContentId.parse(json['glossKey'], prefix: 'localization'),
    sourceIds: _ids(json['sourceIds']),
  );
  @override
  JsonMap toJson() => {
    ...baseJson('lexeme'),
    'glyphIds': glyphIds.map((id) => id.value).toList(),
    'transliteration': transliteration,
    'glossKey': glossKey.value,
    'sourceIds': sourceIds.map((id) => id.value).toList(),
  };
}

final class ReadingRecord extends VersionedRecord {
  const ReadingRecord(
    super.id,
    super.version, {
    required this.glyphIds,
    required this.direction,
    required this.translationKey,
    required this.sourceIds,
  });
  final List<ContentId> glyphIds;
  final String direction;
  final ContentId translationKey;
  final List<ContentId> sourceIds;
  factory ReadingRecord.fromJson(JsonMap json) => ReadingRecord(
    ContentId.parse(json['id'], prefix: 'reading'),
    json['version'] as String,
    glyphIds: _ids(json['glyphIds']),
    direction: json['direction'] as String,
    translationKey: ContentId.parse(
      json['translationKey'],
      prefix: 'localization',
    ),
    sourceIds: _ids(json['sourceIds']),
  );
  @override
  JsonMap toJson() => {
    ...baseJson('reading'),
    'glyphIds': glyphIds.map((id) => id.value).toList(),
    'direction': direction,
    'translationKey': translationKey.value,
    'sourceIds': sourceIds.map((id) => id.value).toList(),
  };
}

final class ExerciseRecord extends VersionedRecord {
  const ExerciseRecord(
    super.id,
    super.version, {
    required this.kind,
    required this.promptKey,
    required this.answerIds,
    required this.masteryDimensions,
  });
  final ExerciseKind kind;
  final ContentId promptKey;
  final List<ContentId> answerIds;
  final List<String> masteryDimensions;
  factory ExerciseRecord.fromJson(JsonMap json) => ExerciseRecord(
    ContentId.parse(json['id'], prefix: 'exercise'),
    json['version'] as String,
    kind: ExerciseKind.values.byName(json['kind'] as String),
    promptKey: ContentId.parse(json['promptKey'], prefix: 'localization'),
    answerIds: _ids(json['answerIds']),
    masteryDimensions: _strings(json['masteryDimensions']),
  );
  @override
  JsonMap toJson() => {
    ...baseJson('exercise'),
    'kind': kind.name,
    'promptKey': promptKey.value,
    'answerIds': answerIds.map((id) => id.value).toList(),
    'masteryDimensions': masteryDimensions,
  };
}

final class SourceRecord extends VersionedRecord {
  const SourceRecord(
    super.id,
    super.version, {
    required this.citation,
    required this.license,
    this.uri,
  });
  final String citation;
  final String license;
  final String? uri;
  factory SourceRecord.fromJson(JsonMap json) => SourceRecord(
    ContentId.parse(json['id'], prefix: 'source'),
    json['version'] as String,
    citation: json['citation'] as String,
    license: json['license'] as String,
    uri: json['uri'] as String?,
  );
  @override
  JsonMap toJson() => {
    ...baseJson('source'),
    'citation': citation,
    'license': license,
    if (uri != null) 'uri': uri,
  };
}

final class AssetRecord extends VersionedRecord {
  const AssetRecord(
    super.id,
    super.version, {
    required this.kind,
    required this.path,
    required this.sha256,
    required this.sourceId,
  });
  final AssetKind kind;
  final String path;
  final String sha256;
  final ContentId sourceId;
  factory AssetRecord.fromJson(JsonMap json) => AssetRecord(
    ContentId.parse(json['id'], prefix: 'asset'),
    json['version'] as String,
    kind: AssetKind.values.byName(json['kind'] as String),
    path: json['path'] as String,
    sha256: json['sha256'] as String,
    sourceId: ContentId.parse(json['sourceId'], prefix: 'source'),
  );
  @override
  JsonMap toJson() => {
    ...baseJson('asset'),
    'kind': kind.name,
    'path': path,
    'sha256': sha256,
    'sourceId': sourceId.value,
  };
}

final class ReviewRecord extends VersionedRecord {
  const ReviewRecord(
    super.id,
    super.version, {
    required this.state,
    required this.roles,
    this.reviewedAt,
  });
  final ReviewState state;
  final List<String> roles;
  final DateTime? reviewedAt;
  factory ReviewRecord.fromJson(JsonMap json) => ReviewRecord(
    ContentId.parse(json['id'], prefix: 'review'),
    json['version'] as String,
    state: ReviewState.values.byName(json['state'] as String),
    roles: _strings(json['roles']),
    reviewedAt: json['reviewedAt'] == null
        ? null
        : DateTime.parse(json['reviewedAt'] as String),
  );
  @override
  JsonMap toJson() => {
    ...baseJson('review'),
    'state': state.name,
    'roles': roles,
    if (reviewedAt != null) 'reviewedAt': reviewedAt!.toUtc().toIso8601String(),
  };
}

final class ConstructionRecord extends VersionedRecord {
  const ConstructionRecord(
    super.id,
    super.version, {
    required this.segmentAssetIds,
    required this.acceptedSequences,
    required this.toleranceId,
    required this.feedbackIds,
  });
  final List<ContentId> segmentAssetIds;
  final List<List<String>> acceptedSequences;
  final ContentId toleranceId;
  final List<ContentId> feedbackIds;
  factory ConstructionRecord.fromJson(JsonMap json) => ConstructionRecord(
    ContentId.parse(json['id'], prefix: 'construction'),
    json['version'] as String,
    segmentAssetIds: _ids(json['segmentAssetIds']),
    acceptedSequences: (json['acceptedSequences'] as List<Object?>)
        .map((sequence) => _strings(sequence))
        .toList(),
    toleranceId: ContentId.parse(json['toleranceId'], prefix: 'tolerance'),
    feedbackIds: _ids(json['feedbackIds']),
  );
  @override
  JsonMap toJson() => {
    ...baseJson('construction'),
    'segmentAssetIds': segmentAssetIds.map((id) => id.value).toList(),
    'acceptedSequences': acceptedSequences,
    'toleranceId': toleranceId.value,
    'feedbackIds': feedbackIds.map((id) => id.value).toList(),
  };
}

final class ToleranceRecord extends VersionedRecord {
  const ToleranceRecord(
    super.id,
    super.version, {
    required this.shape,
    required this.proportion,
    required this.placement,
    required this.topology,
    required this.sequence,
  });
  final double shape;
  final double proportion;
  final double placement;
  final double topology;
  final double sequence;
  factory ToleranceRecord.fromJson(JsonMap json) => ToleranceRecord(
    ContentId.parse(json['id'], prefix: 'tolerance'),
    json['version'] as String,
    shape: (json['shape'] as num).toDouble(),
    proportion: (json['proportion'] as num).toDouble(),
    placement: (json['placement'] as num).toDouble(),
    topology: (json['topology'] as num).toDouble(),
    sequence: (json['sequence'] as num).toDouble(),
  );
  @override
  JsonMap toJson() => {
    ...baseJson('tolerance'),
    'shape': shape,
    'proportion': proportion,
    'placement': placement,
    'topology': topology,
    'sequence': sequence,
  };
}

final class FeedbackRecord extends VersionedRecord {
  const FeedbackRecord(
    super.id,
    super.version, {
    required this.issueCode,
    required this.messageKey,
    this.region,
  });
  final String issueCode;
  final ContentId messageKey;
  final String? region;
  factory FeedbackRecord.fromJson(JsonMap json) => FeedbackRecord(
    ContentId.parse(json['id'], prefix: 'feedback'),
    json['version'] as String,
    issueCode: json['issueCode'] as String,
    messageKey: ContentId.parse(json['messageKey'], prefix: 'localization'),
    region: json['region'] as String?,
  );
  @override
  JsonMap toJson() => {
    ...baseJson('feedback'),
    'issueCode': issueCode,
    'messageKey': messageKey.value,
    if (region != null) 'region': region,
  };
}

final class LocalizationRecord extends VersionedRecord {
  const LocalizationRecord(super.id, super.version, {required this.values});
  final Map<String, String> values;
  factory LocalizationRecord.fromJson(JsonMap json) => LocalizationRecord(
    ContentId.parse(json['id'], prefix: 'localization'),
    json['version'] as String,
    values: _map(json['values']).cast<String, String>(),
  );
  @override
  JsonMap toJson() => {...baseJson('localization'), 'values': values};
}

final class ManifestRecord extends VersionedRecord {
  const ManifestRecord(
    super.id,
    super.version, {
    required this.schemaVersion,
    required this.curriculumVersion,
    required this.recordIds,
    required this.assetIds,
    required this.checksums,
    this.rollbackParentId,
  });
  final String schemaVersion;
  final String curriculumVersion;
  final List<ContentId> recordIds;
  final List<ContentId> assetIds;
  final Map<String, String> checksums;
  final ContentId? rollbackParentId;
  factory ManifestRecord.fromJson(JsonMap json) => ManifestRecord(
    ContentId.parse(json['id'], prefix: 'manifest'),
    json['version'] as String,
    schemaVersion: json['schemaVersion'] as String,
    curriculumVersion: json['curriculumVersion'] as String,
    recordIds: _ids(json['recordIds']),
    assetIds: _ids(json['assetIds']),
    checksums: _map(json['checksums']).cast<String, String>(),
    rollbackParentId: json['rollbackParentId'] == null
        ? null
        : ContentId.parse(json['rollbackParentId'], prefix: 'manifest'),
  );
  @override
  JsonMap toJson() => {
    ...baseJson('manifest'),
    'schemaVersion': schemaVersion,
    'curriculumVersion': curriculumVersion,
    'recordIds': recordIds.map((id) => id.value).toList(),
    'assetIds': assetIds.map((id) => id.value).toList(),
    'checksums': checksums,
    if (rollbackParentId != null) 'rollbackParentId': rollbackParentId!.value,
  };
}

ContentRecord contentRecordFromJson(JsonMap json) => switch (json['type']) {
  'course' => CourseRecord.fromJson(json),
  'unit' => UnitRecord.fromJson(json),
  'lesson' => LessonRecord.fromJson(json),
  'glyph' => GlyphRecord.fromJson(json),
  'lexeme' => LexemeRecord.fromJson(json),
  'reading' => ReadingRecord.fromJson(json),
  'exercise' => ExerciseRecord.fromJson(json),
  'source' => SourceRecord.fromJson(json),
  'asset' => AssetRecord.fromJson(json),
  'review' => ReviewRecord.fromJson(json),
  'construction' => ConstructionRecord.fromJson(json),
  'tolerance' => ToleranceRecord.fromJson(json),
  'feedback' => FeedbackRecord.fromJson(json),
  'localization' => LocalizationRecord.fromJson(json),
  'manifest' => ManifestRecord.fromJson(json),
  final type => throw FormatException('Unknown content record type: $type'),
};

String encodeContentRecord(ContentRecord record) => jsonEncode(record.toJson());
