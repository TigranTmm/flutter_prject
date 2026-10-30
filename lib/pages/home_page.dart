import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../routes.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  final int initialIndex;

  const HomePage({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late int _selectedIndex;

  static const List<String> images = [
    'assets/images/desktop.jpg',
    'assets/images/mobile.webp',
    'assets/images/web.jpg',
    'assets/images/console.jpeg',
    'assets/images/server.jpeg',
  ];

  static const List<String>
  applicationNames = [
    'Настольные приложения',
    'Мобильные приложения',
    'Web-приложения',
    'Консольные приложения',
    'Серверные приложения',
  ];

  static const List<String>
  applicationDescriptions = [
    'Программы, устанавливаемые и запускаемые '
        'на персональном компьютере.',

    'Приложения, предназначенные '
        'для смартфонов и планшетов.',

    'Приложения, работающие через браузер '
        'и использующие web-технологии.',

    'Программы, взаимодействие с которыми '
        'осуществляется через командную строку.',

    'Приложения, выполняющиеся на сервере '
        'и предоставляющие услуги клиентам.',
  ];

  static const List<IconData>
  applicationIcons = [
    Icons.desktop_windows,
    Icons.smartphone,
    Icons.language,
    Icons.terminal,
    Icons.dns,
  ];

  @override
  void initState() {
    super.initState();

    _selectedIndex =
        widget.initialIndex;
  }

  // Создание карточки приложения.
  Widget _buildApplicationCard(
      BuildContext context,
      int index,
      ) {
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
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),

        // Переход на экран детализации.
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.detail,
            arguments: {
              'title':
              applicationNames[index],

              'description':
              applicationDescriptions[index],

              'imagePath':
              images[index],
            },
          );
        },
      ),
    );
  }

  Widget _buildHomeContent(
      BuildContext context,
      ) {
    // Проверяем платформу.
    final bool desktopPlatform =
        kIsWeb ||
            defaultTargetPlatform ==
                TargetPlatform.windows ||
            defaultTargetPlatform ==
                TargetPlatform.macOS ||
            defaultTargetPlatform ==
                TargetPlatform.linux;

    // На desktop/web вертикальные
    // интервалы делаем больше.
    final double verticalSpacing =
    desktopPlatform ? 24 : 12;

    return LayoutBuilder(
      builder: (context, constraints) {

        // Главное условие адаптивности.
        final bool isWide =
            constraints.maxWidth > 600;

        return ListView(
          padding: EdgeInsets.all(
            isWide ? 32 : 20,
          ),

          children: [
            Container(
              width: double.infinity,
              padding:
              const EdgeInsets.all(18),

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
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: verticalSpacing,
            ),

            Container(
              width: double.infinity,
              padding:
              const EdgeInsets.all(18),

              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.5,
                ),
              ),

              child: const Text(
                'Программное приложение — '
                    'это программа, предназначенная '
                    'для выполнения определённых задач '
                    'пользователя. Приложения могут '
                    'работать на компьютерах, мобильных '
                    'устройствах, серверах или '
                    'непосредственно в браузере.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                ),
              ),
            ),

            SizedBox(
              height: verticalSpacing,
            ),

            const Text(
              'Примеры приложений',
              style: TextStyle(
                fontSize: 18,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Горизонтальный список изображений.
            SizedBox(
              height: 170,

              child: ListView.separated(
                scrollDirection:
                Axis.horizontal,

                itemCount: images.length,

                separatorBuilder:
                    (context, index) =>
                const SizedBox(
                  width: 12,
                ),

                itemBuilder:
                    (context, index) {

                  return ClipRRect(
                    borderRadius:
                    BorderRadius.circular(
                      18,
                    ),

                    child: SizedBox(
                      width:
                      isWide ? 250 : 200,

                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              height: verticalSpacing,
            ),

            const Text(
              'Виды программных приложений',
              style: TextStyle(
                fontSize: 18,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Если ширина больше 600 —
            // карточки в два столбца.
            if (isWide)

              GridView.builder(
                shrinkWrap: true,

                physics:
                const NeverScrollableScrollPhysics(),

                itemCount:
                applicationNames.length,

                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  crossAxisSpacing: 16,

                  mainAxisSpacing:
                  verticalSpacing,

                  childAspectRatio: 3.2,
                ),

                itemBuilder:
                    (context, index) {

                  return _buildApplicationCard(
                    context,
                    index,
                  );
                },
              )

            else

            // На мобильном остаётся
            // отдельный вертикальный ListView.
              SizedBox(
                height: 280,

                child: ListView.separated(
                  itemCount:
                  applicationNames.length,

                  separatorBuilder:
                      (context, index) =>
                  const SizedBox(
                    height: 8,
                  ),

                  itemBuilder:
                      (context, index) {

                    return _buildApplicationCard(
                      context,
                      index,
                    );
                  },
                ),
              ),

            SizedBox(
              height: verticalSpacing,
            ),

            const Divider(),

            const SizedBox(height: 15),

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

                    alignment:
                    Alignment.center,

                    decoration:
                    BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                      ),
                    ),

                    child: const Text(
                      'Бабаянц Т.А. - ИКБО-63-23',
                      textAlign:
                      TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: verticalSpacing,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Text(
          _selectedIndex == 0
              ? 'ВИДЫ ПРОГРАММНЫХ ПРИЛОЖЕНИЙ'
              : 'ПРОФИЛЬ',

          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),

        centerTitle: true,
        backgroundColor:
        Colors.blueAccent,
      ),

      // IndexedStack сохраняет состояние
      // экранов при переключении.
      body: IndexedStack(
        index: _selectedIndex,

        children: [
          _buildHomeContent(context),

          const ProfilePage(
            embedded: true,
          ),
        ],
      ),

      // Нижняя панель.
      bottomNavigationBar:
      NavigationBar(

        selectedIndex:
        _selectedIndex,

        onDestinationSelected:
            (index) {

          setState(() {
            _selectedIndex = index;
          });
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