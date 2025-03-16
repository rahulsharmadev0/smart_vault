import 'package:edukit/firebase_options.dart';
import 'package:edukit/ui/app/app.dart';
import 'package:edukit/ui/app/bootstrap.dart';
import 'package:edukit/ui/bloc/auth_cubit.dart';
import 'package:edukit/ui/bloc/bucket_bloc.dart';
import 'package:edukit/ui/bloc/file_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edukit/ui/bloc/organization_bloc.dart';
import 'package:repositories/repositories.dart';

void main() async {
  bootstrap(() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    final organizationRepo = OrganizationRepository(FirebaseOrganizationApi());
    final bucketRepo = BucketRepository(FirebaseBucketApi());
    final fileRepo = FileRepository(FirebaseFileApi());
    var authRepository = AuthenticationRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(repo: authRepository)),
        BlocProvider(
          lazy: false,
          create: (context) => OrganizationBloc(repo: organizationRepo, authCubit: context.read<AuthCubit>()),
        ),
        BlocProvider(
          lazy: false,
          create:
              (context) => BucketBloc(repo: bucketRepo, organizationBloc: context.read<OrganizationBloc>()),
        ),
        BlocProvider(create: (context) => FileBloc(repo: fileRepo)),
      ],
      child: const App(),
    );
  });
}
