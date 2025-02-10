import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import '../../models/organization.dart';

class OrganizationRepository {
  final fs.CollectionReference orgColRef;

  OrganizationRepository({
    String collectionPath = 'organizations',
    fs.FirebaseFirestore? firestore,
  }) : orgColRef = (firestore ?? fs.FirebaseFirestore.instance).collection(collectionPath);

  Future<void> create(Organization organization) async =>
      await orgColRef.doc(organization.orgId).set(organization.toJson());

  Future<void> update(Organization organization) async =>
      await orgColRef.doc(organization.orgId).update(organization.toJson());

  Future<void> delete(String orgId) async => await orgColRef.doc(orgId).delete();

  Stream<Organization> watch(String orgId) =>
      orgColRef.doc(orgId).snapshots().map((s) => Organization.fromJson(s.data()! as Map<String, dynamic>));

  Future<Organization> get(String orgId) async =>
      Organization.fromJson((await orgColRef.doc(orgId).get()).data()! as Map<String, dynamic>);
}
