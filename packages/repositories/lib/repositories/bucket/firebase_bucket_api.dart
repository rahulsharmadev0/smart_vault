part of 'bucket_base.dart';

class BucketApi extends ApiBase implements BucketBase {
  final db.DatabaseReference orgRef;

  BucketApi({db.FirebaseDatabase? firestore})
    : orgRef = (firestore ?? db.FirebaseDatabase.instance).ref('buckets');

  @override
  Future<void> create(Bucket bucket) async {
    return await orgRef.child(bucket.bucketId).set(bucket.toJson());
  }

  @override
  Future<void> update(Bucket bucket) async {
    await handleErrors(() async {
      await orgRef.child(bucket.bucketId).update(bucket.toJson());
    }, 'Failed to update bucket');
  }

  @override
  Future<void> delete(String bucketId) async {
    await handleErrors(() async {
      await orgRef.child(bucketId).remove();
    }, 'Failed to delete bucket');
  }

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
      () async => await orgRef
          .child(bucketId)
          .child('attributes')
          .set(attributes.map((e) => e.toJson()).toList()),
      'Failed to update attributes',
    );
  }

  @override
  Future<void> updateDescription(String bucketId, String description) async {
    await handleErrors(
      () async => await orgRef.child(bucketId).child('description').set(description),
      'Failed to update description',
    );
  }

  @override
  Future<void> updateFileTypes(String bucketId, List<DocumentType> filetypes) async {
    await orgRef
        .child(bucketId)
        .child('filetypes')
        .set(filetypes.map((e) => e.name).toList());
  }

  @override
  Future<void> updateTitle(String bucketId, String title) async {
    await orgRef.child(bucketId).child('title').set(title);
  }
}
