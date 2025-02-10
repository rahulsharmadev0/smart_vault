import 'package:edukit/firebase_options.dart';
import 'package:edukit/ui/app/app.dart';
import 'package:edukit/ui/app/bootstrap.dart';
import 'package:edukit/ui/bloc/auth_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edukit/ui/bloc/organization_bloc/organization_bloc.dart';
import 'package:repositories/repositories.dart';

void main() async {
  bootstrap(() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    return MultiBlocProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthenticationRepository()),
        RepositoryProvider(create: (context) => OrganizationRepository()),
        BlocProvider(create: (context) => OrganizationBloc(repo: context.read<OrganizationRepository>())),
        BlocProvider(
          create: (context) => AuthCubit(
            repo: context.read<AuthenticationRepository>(),
            bloc: context.read<OrganizationBloc>(),
          ),
        ),
      ],
      child: const App(),
    );
  });
}
