part of 'organization.dart';

extension OrganizationExtension on Organization {
  Organization addBucket(Bucket bucket) {
    return copyWith(buckets: [...buckets, bucket]);
  }

  Organization removeBucket(String bucketId) {
    return copyWith(
      buckets: buckets.where((bucket) => bucket.bucketId != bucketId).toList(),
    );
  }

  Organization updateBucket(Bucket updatedBucket) {
    return copyWith(
      buckets: buckets
          .map((bucket) => bucket.bucketId == updatedBucket.bucketId ? updatedBucket : bucket)
          .toList(),
    );
  }

  Bucket? getBucket(String bucketId) => buckets.firstWhereOrNull((bucket) => bucket.bucketId == bucketId);
}

extension BucketExtension on Bucket {
  Bucket addAttribute(BucketAttributeField attribute) {
    return copyWith(attributes: [...attributes, attribute]);
  }

  Bucket removeAttribute(String attributeId) {
    return copyWith(
      attributes: attributes.where((attribute) => attribute.attributeId != attributeId).toList(),
    );
  }

  Bucket updateAttribute(BucketAttributeField updatedAttribute) {
    return copyWith(
      attributes: attributes
          .map((attribute) =>
              attribute.attributeId == updatedAttribute.attributeId ? updatedAttribute : attribute)
          .toList(),
    );
  }

  BucketAttributeField? getAttribute(String attributeId) =>
      attributes.firstWhereOrNull((attribute) => attribute.attributeId == attributeId);

  void updateAttributeTitle(int index, String value) {
    if (value.isEmpty || index < 0 || index >= attributes.length) return;
    var tmp = attributes[index].toJson();
    tmp['title'] = value;
    attributes[index] = BucketAttributeField.fromJson(tmp);
  }
}
