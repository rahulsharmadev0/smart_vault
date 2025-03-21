part of 'organization.dart';

enum AttributeType { text, dateTime, singleSelect, multiSelect }

//
//===============================================================
//  Bucket
//===============================================================
//

@freezed
sealed class Bucket with _$Bucket {
  @override
  final String bucketId;

  @override
  final DateTime createdAt, updatedAt;
  Bucket._({String? bucketId, DateTime? createdAt, DateTime? updatedAt})
    : bucketId = bucketId ?? const Uuid().v4(),
      createdAt = createdAt ?? DateTime.now(),
      updatedAt = updatedAt ?? DateTime.now();

  factory Bucket({
    String? bucketId,
    required String orgId,
    required String title,
    required String description,
    required List<DocumentType> fileTypes,
    @Default([]) List<Attribute> attributes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Bucket;

  factory Bucket.fromJson(Map<String, dynamic> json) => _$BucketFromJson(json);
}

//
//===============================================================
//  Attribute
//===============================================================
//

@freezed
sealed class Attribute with _$Attribute {
  @override
  final String attributeId;

  Attribute._({String? attributeId}) : attributeId = attributeId ?? const Uuid().v4();

  factory Attribute.text({required String label, String? attributeId}) = TextAttribute;

  factory Attribute.dateTime({
    required String label,
    String? attributeId,
    required DateTime firstDate,
    required DateTime lastDate,
  }) = DateTimeAttribute;

  factory Attribute.singleSelect({
    required String label,
    String? attributeId,
    required List<Option> options,
  }) = SingleSelectAttribute;

  factory Attribute.multiSelect({
    required String label,
    String? attributeId,
    required List<Option> options,
  }) = MultiSelectAttribute;

  factory Attribute.fromJson(Map<String, dynamic> json) => _$AttributeFromJson(json);

  T map<T>({
    T Function(TextAttribute)? text,
    T Function(DateTimeAttribute)? dateTime,
    T Function(SingleSelectAttribute)? singleSelect,
    T Function(MultiSelectAttribute)? multiSelect,
    T Function()? orElse,
  }) {
    return switch (this) {
      TextAttribute state => text?.call(state) ?? orElse?.call() as T,
      DateTimeAttribute state => dateTime?.call(state) ?? orElse?.call() as T,
      SingleSelectAttribute state => singleSelect?.call(state) ?? orElse?.call() as T,
      MultiSelectAttribute state => multiSelect?.call(state) ?? orElse?.call() as T,
    };
  }
}

@freezed
sealed class Option with _$Option {
  @override
  final String id;

  Option._({String? id}) : id = id ?? const Uuid().v4();

  factory Option({String? id, required String value}) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}
