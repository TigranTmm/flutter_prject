import 'package:flutter/material.dart';

import '../models/application_item.dart';
import '../routes.dart';

class DetailPage extends StatelessWidget {
  final ApplicationItem item;

  const DetailPage({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        backgroundColor: Colors.blueAccent,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [
            Center(
              child: ClipRRect(
                borderRadius:
                BorderRadius.circular(20),

                child: Image.asset(
                  item.imagePath,
                  height: 220,
                  width: 320,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 30),

            Text(
              item.title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              item.fullDescription,
              style: const TextStyle(
                fontSize: 18,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,

        onDestinationSelected: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }

          if (index == 1) {
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
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Главная',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}