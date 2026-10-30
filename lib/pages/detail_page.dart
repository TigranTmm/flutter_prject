import 'package:flutter/material.dart';

import '../routes.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const DetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(title),

        backgroundColor:
        Colors.blueAccent,
      ),

      body: SingleChildScrollView(
        padding:
        const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [
            Center(
              child: ClipRRect(
                borderRadius:
                BorderRadius.circular(20),

                child: Image.asset(
                  imagePath,
                  height: 220,
                  width: 320,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 30),

            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              description,
              style: const TextStyle(
                fontSize: 18,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),

      // Панель присутствует и здесь,
      // как в макете методички.
      bottomNavigationBar:
      NavigationBar(

        selectedIndex: 0,

        onDestinationSelected:
            (index) {

          if (index == 0) {
            // Возвращаемся назад на Home.
            Navigator.pop(context);
          }

          if (index == 1) {
            // Открываем Home сразу
            // с вкладкой профиля.
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.home,
                  (route) => false,
              arguments: 1,
            );
          }
        },

        destinations: const [
          NavigationDestination(
            icon:
            Icon(Icons.home_outlined),
            selectedIcon:
            Icon(Icons.home),
            label: 'Главная',
          ),

          NavigationDestination(
            icon:
            Icon(Icons.person_outline),
            selectedIcon:
            Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}