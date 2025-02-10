part of 'organization.dart';

abstract class BucketAttributeField extends Equatable {
  final String title;
  final Type type;

  @CopyWithField(immutable: true)
  final String attributeId; // Fixed typo here

  BucketAttributeField(
    this.type, {
    String? attributeId,
    required this.title,
  }) : attributeId = attributeId ?? Uuid().v4();

  static BucketAttributeField fromJson(Map<String, dynamic> json) {
    return switch (json['type'] as String) {
      'BucketTextAttributeField' => BucketTextAttributeField.fromJson(json),
      'BucketDateTimeAttributeField' => BucketDateTimeAttributeField.fromJson(json),
      'BucketSingleSelectAttributeField' => BucketSingleSelectAttributeField.fromJson(json),
      'BucketMultiSelectAttributeField' => BucketMultiSelectAttributeField.fromJson(json),
      _ => throw Exception('Unknown type: ${json['type']}'),
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'type': type.toString(),
      'attributeId': attributeId,
    };
  }

  @override
  List<Object?> get props => [title, type, attributeId];
}

@_copyWith
@_jsonSerializable
class BucketTextAttributeField extends BucketAttributeField {
  BucketTextAttributeField({
    super.attributeId,
    required super.title,
  }) : super(BucketTextAttributeField);

  factory BucketTextAttributeField.fromJson(Map<String, dynamic> json) =>
      _$BucketTextAttributeFieldFromJson(json);

  @override
  Map<String, dynamic> toJson() => super.toJson()..addAll(_$BucketTextAttributeFieldToJson(this));
}

@_copyWith
@_jsonSerializable
class BucketDateTimeAttributeField extends BucketAttributeField {
  BucketDateTimeAttributeField({
    super.attributeId,
    required super.title,
  }) : super(BucketDateTimeAttributeField);

  factory BucketDateTimeAttributeField.fromJson(Map<String, dynamic> json) =>
      _$BucketDateTimeAttributeFieldFromJson(json);
  @override
  Map<String, dynamic> toJson() => super.toJson()..addAll(_$BucketDateTimeAttributeFieldToJson(this));
}

@_copyWith
@_jsonSerializable
class BucketSingleSelectAttributeField extends BucketAttributeField {
  final List<Option> options;

  BucketSingleSelectAttributeField({
    super.attributeId,
    required super.title,
    required this.options,
  }) : super(BucketSingleSelectAttributeField);

  factory BucketSingleSelectAttributeField.fromJson(Map<String, dynamic> json) =>
      _$BucketSingleSelectAttributeFieldFromJson(json);

  @override
  Map<String, dynamic> toJson() => super.toJson()..addAll(_$BucketSingleSelectAttributeFieldToJson(this));
}

@_copyWith
@_jsonSerializable
class BucketMultiSelectAttributeField extends BucketAttributeField {
  final List<Option> options;

  BucketMultiSelectAttributeField({
    super.attributeId,
    required super.title,
    required this.options,
  }) : super(BucketMultiSelectAttributeField);

  factory BucketMultiSelectAttributeField.fromJson(Map<String, dynamic> json) =>
      _$BucketMultiSelectAttributeFieldFromJson(json);

  @override
  Map<String, dynamic> toJson() => super.toJson()..addAll(_$BucketMultiSelectAttributeFieldToJson(this));
}

@_copyWith
@_jsonSerializable
class Option extends Equatable {
  final String id, value;
  const Option({required this.id, required this.value});

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
  Map<String, dynamic> toJson() => _$OptionToJson(this);

  @override
  List<Object?> get props => [id];
}

class BucketAttributeFieldJsonConverter implements JsonConverter<BucketAttributeField, Map<String, dynamic>> {
  const BucketAttributeFieldJsonConverter();
  @override
  BucketAttributeField fromJson(Map<String, dynamic> json) => BucketAttributeField.fromJson(json);

  @override
  Map<String, dynamic> toJson(BucketAttributeField object) => object.toJson();
}
