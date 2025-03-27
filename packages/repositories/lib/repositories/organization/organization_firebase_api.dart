part of 'organization_base.dart';

class OrganizationApi extends ApiBase<db.DatabaseReference> implements OrganizationBase {
  OrganizationApi() : super(db.FirebaseDatabase.instance.ref('organizations'));

  db.DatabaseReference get orgRef => credential!;

  @override
  Future<void> create(Organization organization) => handleErrors(
    (data) => orgRef.child(organization.orgId).set(data),
    organization.toJson(),
    'Failed to create organization',
  );

  @override
  Future<void> delete(String orgId) =>
      handleErrors((_) => orgRef.child(orgId).remove(), 'Failed to delete organization');

  @override
  Future<Organization?> getById(String orgId) async => handleErrors((_) async {
    final snapshot = await orgRef.child(orgId).get();
    if (snapshot.value == null) {
      throw Exception('Organization not found');
    }
    return Organization.fromJson(json.decode(json.encode(snapshot.value)));
  }, 'Failed to get organization');

  @override
  Future<void> updateDescription(String orgId, String newDescription) => handleErrors(
    (data) => orgRef.child(orgId).update(data!),
    {'description': newDescription},
    'Failed to update organization description',
  );

  @override
  Future<void> updateName(String orgId, String newName) => handleErrors(
    (data) => orgRef.child(orgId).update(data!),
    {'name': newName},
    'Failed to update organization name',
  );
}
