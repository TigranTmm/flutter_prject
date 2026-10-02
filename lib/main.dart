import 'package:flutter/material.dart';

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

      home: const ApplicationsPage(),
    );
  }
}

// Главный экран приложения.
class ApplicationsPage extends StatefulWidget {
  const ApplicationsPage({super.key});

  @override
  State<ApplicationsPage> createState() =>
      _ApplicationsPageState();
}

class _ApplicationsPageState extends State<ApplicationsPage> {
  final List<String> images = [
    'assets/images/desktop.jpg',
    'assets/images/mobile.webp',
    'assets/images/web.jpg',
    'assets/images/console.jpeg',
    'assets/images/server.jpeg',
  ];

  final List<String> imageTitles = [
    'Настольное приложение',
    'Мобильное приложение',
    'Web-приложение',
    'Консольное приложение',
    'Серверное приложение',
  ];

  int currentImageIndex = 0;

  void nextImage() {
    setState(() {
      currentImageIndex =
          (currentImageIndex + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Верхняя панель приложения.
      appBar: AppBar(
        title: const Text(
          'ВИДЫ ПРОГРАММНЫХ ПРИЛОЖЕНИЙ',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            // Пользовательский шрифт,
            fontFamily: 'Montserrat',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              // Блок с названием предметной области.
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

              // Вертикальный отступ.
              const SizedBox(height: 25),

              // Блок с описанием.
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

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Левая часть — изображение.
                  Expanded(
                    child: Container(
                      height: 250,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.5,
                        ),
                      ),

                      // обработка нажатия на изображение
                      child: GestureDetector(
                        onTap: nextImage,

                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.asset(
                                images[currentImageIndex],
                                fit: BoxFit.contain,
                              ),
                            ),

                            const SizedBox(height: 10),

                            // Подпись текущего изображения.
                            Text(
                              imageTitles[currentImageIndex],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Правая часть — список видов приложений.
                  Expanded(
                    child: Container(
                      height: 250,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.5,
                        ),
                      ),
                      child: const Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Text(
                            '1. Настольные',
                            style: TextStyle(fontSize: 15),
                          ),

                          SizedBox(height: 10),

                          Text(
                            '2. Мобильные',
                            style: TextStyle(fontSize: 15),
                          ),

                          SizedBox(height: 10),

                          Text(
                            '3. Web-приложения',
                            style: TextStyle(fontSize: 15),
                          ),

                          SizedBox(height: 10),

                          Text(
                            '4. Консольные',
                            style: TextStyle(fontSize: 15),
                          ),

                          SizedBox(height: 10),

                          Text(
                            '5. Серверные',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Кнопка переключения изображения.
              ElevatedButton.icon(
                onPressed: nextImage,
                icon: const Icon(
                  Icons.navigate_next,
                ),
                label: const Text(
                  'Следующее изображение',
                ),
              ),

              const SizedBox(height: 20),

              const Divider(
                thickness: 1,
              ),

              const SizedBox(height: 15),

              // Информация о студенте.
              Row(
                children: [
                  // Блок с иконкой пользователя.
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

                  // Блок с ФИО и группой.
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
        ),
      ),
    );
  }
}