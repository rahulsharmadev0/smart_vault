part of 'bucket_base.dart';

class BucketApi extends ApiBase implements BucketBase {
  final db.DatabaseReference orgRef;

  BucketApi({db.FirebaseDatabase? firestore})
    : orgRef = (firestore ?? db.FirebaseDatabase.instance).ref('buckets');

  @override
  Future<void> create(Bucket bucket) => handleErrors(
    (value) => orgRef.child(bucket.bucketId).set(value!),
    bucket.toJson(),
    'Failed to create bucket',
  );

  @override
  Future<void> update(Bucket bucket) => handleErrors(
    (value) => orgRef.child(bucket.bucketId).update(value!),
    bucket.toJson(),
    'Failed to update bucket',
  );

  @override
  Future<void> delete(String bucketId) =>
      handleErrors((_) => orgRef.child(bucketId).remove(), 'Failed to delete bucket');

  @override
  Future<Bucket?> getBucketById(String bucketId) async {
    final snapshot = await orgRef.child(bucketId).get();
    if (!snapshot.exists) return null;
    return Bucket.fromJson(json.decode(json.encode(snapshot.value)));
  }

  @override
  Future<List<Bucket>> getBucketsByOrgId(String orgId) async {
    final snapshot = await orgRef.orderByChild('orgId').equalTo(orgId).get();
    return snapshot.children
        .map((e) => Bucket.fromJson(json.decode(json.encode(e.value))))
        .toList();
  }

  @override
  Future<void> updateAttributes(String bucketId, List<Attribute> attributes) async {
    await handleErrors(
      (list) => orgRef.child(bucketId).child('attributes').set(list),
      attributes.map((e) => e.toJson()).toList(),
      'Failed to update attributes',
    );
  }

  @override
  Future<void> updateDescription(String bucketId, String description) async {
    await handleErrors(
      (value) async => orgRef.child(bucketId).child('description').set(value),
      description,
      'Failed to update description',
    );
  }

  @override
  Future<void> updateFileTypes(String bucketId, List<DocumentType> filetypes) async {
    await handleErrors(
      (list) => orgRef.child(bucketId).child('filetypes').set(list),
      filetypes.map((e) => e.name).toList(),
      'Failed to update file types',
    );
  }

  @override
  Future<void> updateTitle(String bucketId, String title) async {
    await handleErrors(
      (value) => orgRef.child(bucketId).child('title').set(value),
      title,
      'Failed to update title',
    );
  }
}
