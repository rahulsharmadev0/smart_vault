import 'package:uuid/uuid.dart';
import 'package:equatable/equatable.dart';
import 'package:collection/collection.dart';

part 'organization_extension.dart';

class Organization extends Equatable {
  final String name;
  final String email;
  final String orgId;
  final DateTime createdAt;
  final List<Bucket> buckets;

  Organization({
    String? orgId,
    required this.email,
    required this.name,
    this.buckets = const [],
    DateTime? createdAt,
  })  : orgId = orgId ?? Uuid().v4(),
        createdAt = createdAt ?? DateTime.now();

  Organization.fromJson(Map<String, dynamic> json)
      : orgId = json['orgId'] as String,
        name = json['name'] as String,
        email = json['email'] as String,
        createdAt = DateTime.parse(json['createdAt'] as String),
        buckets = (json['buckets'] as List).map((e) => Bucket.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {
        'orgId': orgId,
        'name': name,
        'email': email,
        'createdAt': createdAt.toIso8601String(),
        'buckets': buckets.map((e) => e.toJson()).toList(),
      };

  Organization copyWith({
    String? name,
    String? email,
    List<Bucket>? buckets,
  }) =>
      Organization(
        orgId: orgId,
        createdAt: createdAt,
        name: name ?? this.name,
        email: email ?? this.email,
        buckets: buckets ?? this.buckets,
      );

  @override
  List<Object?> get props => [orgId, name, email, createdAt, buckets];
}

enum DocumentType {
  pdf('PDF'),
  doc('Document'),
  sheet('Spreadsheet'),
  md('Markdown'),
  txt('Text File');

  final String fullName;
  const DocumentType(this.fullName);
}

class Bucket extends Equatable {
  final String bucketId;
  final String title;
  final String description;
  final DateTime createdAt;
  final List<DocumentType> fileTypes;
  final List<BucketAttributeField> attributes;

  Bucket({
    String? bucketId,
    required this.title,
    required this.description,
    DateTime? createdAt,
    this.fileTypes = const [],
    this.attributes = const [],
  })  : bucketId = bucketId ?? Uuid().v4(),
        createdAt = createdAt ?? DateTime.now();

  Bucket.fromJson(Map<String, dynamic> json)
      : bucketId = json['bucketId'] as String,
        title = json['title'] as String,
        description = json['description'] as String,
        fileTypes = (json['fileTypes'] as List).map((e) => DocumentType.values.byName(e)).toList(),
        createdAt = DateTime.parse(json['createdAt'] as String),
        attributes = (json['attributes'] as List)
            .map((e) => BucketAttributeField.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'bucketId': bucketId,
        'title': title,
        'description': description,
        'createdAt': createdAt.toIso8601String(),
        'fileTypes': fileTypes.map((e) => e.name).toList(),
        'attributes': attributes.map((e) => e.toJson()).toList(),
      };

  Bucket copyWith({
    String? title,
    String? description,
    List<DocumentType>? fileTypes,
    List<BucketAttributeField>? attributes,
  }) =>
      Bucket(
        bucketId: bucketId,
        createdAt: createdAt,
        title: title ?? this.title,
        fileTypes: fileTypes ?? this.fileTypes,
        description: description ?? this.description,
        attributes: attributes ?? this.attributes,
      );

  Bucket addAttribute(BucketAttributeField attribute) {
    return copyWith(attributes: [...attributes, attribute]);
  }

  Bucket removeAttribute(String attributeId) {
    return copyWith(
      attributes: attributes.where((attr) => attr.attributeId != attributeId).toList(),
    );
  }

  Bucket updateAttribute(BucketAttributeField updatedAttribute) {
    return copyWith(
      attributes: attributes
          .map((attr) => attr.attributeId == updatedAttribute.attributeId ? updatedAttribute : attr)
          .toList(),
    );
  }

  @override
  List<Object?> get props => [bucketId, title, description, createdAt, attributes, fileTypes];
}

// ------------------------------

abstract class BucketAttributeField extends Equatable {
  final String title;
  final String type;
  final String attributeId; // Fixed typo here

  BucketAttributeField(Type type, {String? attributeId, required this.title})
      : attributeId = attributeId ?? Uuid().v4(),
        type = type.toString();

  static BucketAttributeField fromJson(Map<String, dynamic> json) {
    return switch (json['type'] as String) {
      'BucketTextAttributeField' => BucketTextAttributeField.fromJson(json),
      'BucketDateTimeAttributeField' => BucketDateTimeAttributeField.fromJson(json),
      'BucketSingleSelectAttributeField' => BucketSingleSelectAttributeField.fromJson(json),
      'BucketMultiSelectAttributeField' => BucketMultiSelectAttributeField.fromJson(json),
      _ => throw Exception('Unknown type: ${json['type']}'),
    };
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'type': type,
        'attributeId': attributeId // Fixed typo here
      };

  @override
  List<Object?> get props => [title, type, attributeId];
}

class BucketTextAttributeField extends BucketAttributeField {
  BucketTextAttributeField({super.attributeId, required super.title}) : super(BucketTextAttributeField);

  BucketTextAttributeField.fromJson(Map<String, dynamic> json)
      : this(attributeId: json['attributeId'] as String, title: json['title'] as String);
}

class BucketDateTimeAttributeField extends BucketAttributeField {
  BucketDateTimeAttributeField({super.attributeId, required super.title})
      : super(BucketDateTimeAttributeField);

  BucketDateTimeAttributeField.fromJson(Map<String, dynamic> json)
      : this(attributeId: json['attributeId'] as String, title: json['title'] as String);
}

class BucketSingleSelectAttributeField extends BucketAttributeField {
  final List<Option> options;

  BucketSingleSelectAttributeField({super.attributeId, required super.title, required this.options})
      : super(BucketSingleSelectAttributeField);

  BucketSingleSelectAttributeField.fromJson(Map<String, dynamic> json)
      : options = (json['options'] as List).map((e) => Option.fromJson(e as Map<String, dynamic>)).toList(),
        super(
          BucketSingleSelectAttributeField,
          attributeId: json['attributeId'] as String,
          title: json['title'] as String,
        );

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'options': options.map((e) => e.toJson()).toList(),
      };
}

class BucketMultiSelectAttributeField extends BucketAttributeField {
  final List<Option> options;

  BucketMultiSelectAttributeField({super.attributeId, required super.title, required this.options})
      : super(BucketMultiSelectAttributeField);

  BucketMultiSelectAttributeField.fromJson(Map<String, dynamic> json)
      : options = (json['options'] as List).map((e) => Option.fromJson(e as Map<String, dynamic>)).toList(),
        super(
          BucketMultiSelectAttributeField,
          attributeId: json['attributeId'] as String,
          title: json['title'] as String,
        );

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'options': options.map((e) => e.toJson()).toList(),
      };
}

class Option extends Equatable {
  final String id, value;
  const Option({required this.id, required this.value});

  Option.fromJson(Map<String, dynamic> json)
      : id = json.keys.first,
        value = json.values.first as String;

  Map<String, dynamic> toJson() => {id: value};
  @override
  List<Object?> get props => [id];
}
