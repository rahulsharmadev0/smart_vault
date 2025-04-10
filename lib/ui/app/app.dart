import 'package:flutter/material.dart';
import 'routes.dart';

const kSurfaceColor = Color(0xFFF9FAFF);
const kPrimaryColor = Color(0xFF31628D);
const kSecondaryColor = Color(0xFFE2E9FF);

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: AppRoutes.I.scaffoldMessengerKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          surface: Color(0xFFF9FAFF),
          seedColor: Colors.blueAccent,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: AppRoutes.I.router,
    );
  }
}
