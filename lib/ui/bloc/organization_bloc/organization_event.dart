part of 'organization_bloc.dart';

sealed class OrganizationEvent<T> with EquatableMixin {
  final T value;
  const OrganizationEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class LoadOrganization extends OrganizationEvent<String> {
  const LoadOrganization(super.value);
}

class UpdateName extends OrganizationEvent<String> {
  const UpdateName(super.value);
}

class UpdateDescription extends OrganizationEvent<String> {
  const UpdateDescription(super.value);
}

// Bucket Management
class AddBucket extends OrganizationEvent<Bucket> {
  const AddBucket(super.value);
}

class RemoveBucket extends OrganizationEvent<String> {
  const RemoveBucket(super.value);
}

class UpdateBucket extends OrganizationEvent<Bucket> {
  const UpdateBucket(super.value);
}
