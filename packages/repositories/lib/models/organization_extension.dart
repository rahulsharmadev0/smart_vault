part of 'organization.dart';

extension BucketExtension on Bucket {
  Bucket addAttribute(Attribute attribute) {
    return copyWith(attributes: [...attributes, attribute]);
  }

  Bucket removeAttribute(String attributeId) {
    return copyWith(
      attributes: attributes.where((attribute) => attribute.attributeId != attributeId).toList(),
    );
  }

  Bucket updateAttribute(Attribute updatedAttribute) {
    return copyWith(
      attributes:
          attributes
              .map(
                (attribute) =>
                    attribute.attributeId == updatedAttribute.attributeId ? updatedAttribute : attribute,
              )
              .toList(),
    );
  }

  Attribute? getAttribute(String attributeId) =>
      attributes.firstWhereOrNull((attribute) => attribute.attributeId == attributeId);

  void updateAttributeTitle(int index, String value) {
    if (value.isEmpty || index < 0 || index >= attributes.length) return;
    var tmp = attributes[index].toJson();
    tmp['title'] = value;
    attributes[index] = Attribute.fromJson(tmp);
  }
}
