import 'package:flutter/material.dart';

import '../routes.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() =>
      _LoadingPageState();
}

class _LoadingPageState
    extends State<LoadingPage> {

  @override
  void initState() {
    super.initState();

    // Через 4 секунды переходим
    // на экран авторизации.
    Future.delayed(
      const Duration(seconds: 4),
          () {
        if (!mounted) return;

        Navigator.pushReplacementNamed(
          context,
          Routes.login,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,

          children: [
            Icon(
              Icons.apps_rounded,
              size: 100,
              color: Colors.blueAccent,
            ),

            SizedBox(height: 25),

            Text(
              'ВИДЫ ПРОГРАММНЫХ\nПРИЛОЖЕНИЙ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
          ],
        ),
      ),
    );
  }
}