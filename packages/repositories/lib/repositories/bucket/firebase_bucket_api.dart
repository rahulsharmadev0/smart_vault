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
    await orgRef.child(bucket.bucketId).update(bucket.toJson());
  }

  @override
  Future<void> delete(String bucketId) async {
    await orgRef.child(bucketId).remove();
  }

  @override
  Future<Bucket?> getBucketById(String bucketId) async {
    final snapshot = await orgRef.child(bucketId).get();
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
    await orgRef
        .child(bucketId)
        .child('attributes')
        .set(attributes.map((e) => e.toJson()).toList());
  }

  @override
  Future<void> updateDescription(String bucketId, String description) async {
    await orgRef.child(bucketId).child('description').set(description);
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
