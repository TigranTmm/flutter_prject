import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Корневой виджет приложения.
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

      home: const ApplicationsPage(),
    );
  }
}

// Главный экран.
class ApplicationsPage extends StatelessWidget {
  const ApplicationsPage({super.key});

  // Список изображений.
  static const List<String> images = [
    'assets/images/desktop.jpg',
    'assets/images/mobile.webp',
    'assets/images/web.jpg',
    'assets/images/console.jpeg',
    'assets/images/server.jpeg',
  ];

  // Названия видов приложений.
  static const List<String> applicationNames = [
    'Настольные приложения',
    'Мобильные приложения',
    'Web-приложения',
    'Консольные приложения',
    'Серверные приложения',
  ];

  // Краткие описания.
  static const List<String> applicationDescriptions = [
    'Программы, устанавливаемые и запускаемые на персональном компьютере.',
    'Приложения, предназначенные для смартфонов и планшетов.',
    'Приложения, работающие через браузер и использующие web-технологии.',
    'Программы, взаимодействие с которыми осуществляется через командную строку.',
    'Приложения, выполняющиеся на сервере и предоставляющие услуги клиентам.',
  ];

  // Иконки для карточек.
  static const List<IconData> applicationIcons = [
    Icons.desktop_windows,
    Icons.smartphone,
    Icons.language,
    Icons.terminal,
    Icons.dns,
  ];

  // Метод показа SnackBar.
  void showApplicationSnackBar(
      BuildContext context,
      String applicationName,
      ) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Выбрано: $applicationName',
        ),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Верхняя панель.
      appBar: AppBar(
        title: const Text(
          'ВИДЫ ПРОГРАММНЫХ ПРИЛОЖЕНИЙ',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),

      // Основной вертикально прокручиваемый экран.
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Название предметной области.
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.5,
              ),
            ),
            child: const Center(
              child: Text(
                'Программные приложения',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          // Описание.
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.5,
              ),
            ),
            child: const Text(
              'Программное приложение — это программа, '
                  'предназначенная для выполнения определённых '
                  'задач пользователя. Приложения могут работать '
                  'на компьютерах, мобильных устройствах, '
                  'серверах или непосредственно в браузере.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
              ),
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'Примеры приложений',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          // Горизонтальный ListView с изображениями.
          SizedBox(
            height: 170,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,

              itemCount: images.length,

              separatorBuilder: (context, index) {
                return const SizedBox(width: 12);
              },

              itemBuilder: (context, index) {
                return ClipRRect(
                  // Скругление изображения.
                  borderRadius: BorderRadius.circular(18),

                  child: Container(
                    width: 200,
                    color: Colors.grey.shade200,

                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 30),

          const Text(
            'Виды программных приложений',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // Вертикальный ListView
          SizedBox(
            height: 260,

            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: applicationNames.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8);
              },

              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,

                  child: ListTile(
                    leading: Icon(
                      applicationIcons[index],
                      color: Colors.blue,
                      size: 30,
                    ),

                    title: Text(
                      applicationNames[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      applicationDescriptions[index],
                    ),

                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.grey,
                    ),

                    // При нажатии показывается SnackBar.
                    onTap: () {
                      showApplicationSnackBar(
                        context,
                        applicationNames[index],
                      );
                    },
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 25),

          const Divider(thickness: 1),

          const SizedBox(height: 15),

          // Информация о студенте.
          Row(
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.5,
                  ),
                ),
                child: const Icon(
                  Icons.person,
                  size: 40,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Container(
                  height: 65,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                  child: const Text(
                    'Бабаянц Т.А. - ИКБО-63-23',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}