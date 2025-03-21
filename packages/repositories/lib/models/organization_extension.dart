part of 'organization.dart';

extension BucketExtension on Bucket {
  Bucket addAttribute(Attribute attribute) {
    return copyWith(attributes: [...attributes, attribute]);
  }

  Bucket removeAttribute(String attributeId) {
    bool test(o) => o.attributeId != attributeId;
    return copyWith(attributes: attributes.where(test).toList());
  }

  Bucket updateAttribute(Attribute updatedAttribute) {
    Attribute toElement(o) =>
        o.attributeId == updatedAttribute.attributeId ? updatedAttribute : o;

    return copyWith(attributes: attributes.map(toElement).toList());
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
