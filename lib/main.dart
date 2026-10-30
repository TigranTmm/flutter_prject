import 'package:flutter/material.dart';

import 'pages/detail_page.dart';
import 'pages/home_page.dart';
import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Виды программных приложений',

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),

      // Первый экран приложения.
      initialRoute: Routes.loading,

      // Простые маршруты.
      routes: {
        Routes.loading: (context) =>
        const LoadingPage(),

        Routes.login: (context) =>
        const LoginPage(),

        Routes.register: (context) =>
        const RegisterPage(),
      },

      // Маршруты, которым нужно передавать параметры.
      onGenerateRoute: (settings) {
        if (settings.name == Routes.home) {
          // Можно сразу открыть нужный пункт NavigationBar.
          final initialIndex =
              settings.arguments as int? ?? 0;

          return MaterialPageRoute(
            settings: settings,
            builder: (context) => HomePage(
              initialIndex: initialIndex,
            ),
          );
        }

        if (settings.name == Routes.detail) {
          final args =
          settings.arguments
          as Map<String, dynamic>;

          return MaterialPageRoute(
            settings: settings,
            builder: (context) => DetailPage(
              title: args['title'] as String,
              description:
              args['description'] as String,
              imagePath:
              args['imagePath'] as String,
            ),
          );
        }

        return null;
      },
    );
  }
}