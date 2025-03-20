import 'package:edukit/firebase_options.dart';
import 'package:edukit/ui/app/app.dart';
import 'package:edukit/ui/app/bootstrap.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:repositories/cache/hive_storage.dart';
import 'package:repositories/repositories.dart';

void main() async {
  bootstrap(() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    initializeRepositories();
    return const App();
  });
}
