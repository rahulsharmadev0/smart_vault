import 'dart:async';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:bloc_suite/bloc_suite.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = FlutterBlocObserver();

  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: HydratedStorageDirectory.web);

  runApp(await builder());
}
