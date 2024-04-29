import 'package:flutter/material.dart';
import 'package:scone_clone/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Scone Clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1773FC)),
        scaffoldBackgroundColor: const Color(0xFFF3F3F3),
        appBarTheme: const AppBarTheme(
          color: Color(0xFFF3F3F3),
        ),
        useMaterial3: true,
      ),
      routerConfig: routes,
      // home: const HomePage(),
    );
  }
}
