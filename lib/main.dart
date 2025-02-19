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

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OrganizationBloc(repo: OrganizationRepository())),
        BlocProvider(create: (context) => BucketBloc(repo: BucketRepository())),
        BlocProvider(create: (context) => FileBloc(repo: FileRepository())),
        BlocProvider(
          create: (context) => AuthCubit(
            repo: AuthenticationRepository(),
            bloc: context.read<OrganizationBloc>(),
          ),
        ),
      ],
      child: const App(),
    );
  });
}
