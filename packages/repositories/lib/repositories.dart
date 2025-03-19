library;

import 'package:get_it/get_it.dart';

import 'package:repositories/repositories/authentication/authentication_base.dart';
import 'package:repositories/repositories/bucket_repository.dart';
import 'package:repositories/repositories/file_repository.dart';
import 'package:repositories/repositories/organization_repository.dart';

export 'repositories/organization_repository.dart';
export 'repositories/bucket_repository.dart';
export 'repositories/file_repository.dart';

void initializeRepositories() {
  GetIt.I.registerSingleton<AuthenticationApi>(AuthenticationApi());
  GetIt.I.registerSingleton<OrganizationRepository>(OrganizationRepository());
  GetIt.I.registerSingleton<BucketRepository>(BucketRepository());
  GetIt.I.registerSingleton<FileRepository>(FileRepository());
}

AuthenticationApi get authRepo => GetIt.I.get<AuthenticationApi>();
OrganizationRepository get orgRepo => GetIt.I.get<OrganizationRepository>();
BucketRepository get bucketRepo => GetIt.I.get<BucketRepository>();
FileRepository get fileRepo => GetIt.I.get<FileRepository>();
