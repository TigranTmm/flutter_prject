import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../routes.dart';
import '../profile_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/application_item.dart';
import '../../routes.dart';
import '../profile_page.dart';
import 'bloc/home_bloc.dart';

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

  @override
  void initState() {
    super.initState();

    _selectedIndex =
        widget.initialIndex;
  }

  // Создание карточки приложения.
  Widget _buildApplicationCard(
      BuildContext context,
      ApplicationItem item,
      ) {
    IconData icon;

    switch (item.iconName) {
      case 'desktop':
        icon = Icons.desktop_windows;
        break;

      case 'mobile':
        icon = Icons.smartphone;
        break;

      case 'web':
        icon = Icons.language;
        break;

      case 'console':
        icon = Icons.terminal;
        break;

      case 'server':
        icon = Icons.dns;
        break;

      default:
        icon = Icons.apps;
    }

    return Card(
      elevation: 2,

      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.blue,
          size: 30,
        ),

        title: Text(
          item.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(
          item.shortDescription,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),

        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.detail,
            arguments: item,
          );
        },
      ),
    );
  }

  Widget _buildHomeContent(
      BuildContext context,
      List<ApplicationItem> applications,
      ) {
    final bool desktopPlatform =
        kIsWeb ||
            defaultTargetPlatform == TargetPlatform.windows ||
            defaultTargetPlatform == TargetPlatform.macOS ||
            defaultTargetPlatform == TargetPlatform.linux;

    final double verticalSpacing =
    desktopPlatform ? 24 : 12;

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isWide =
            constraints.maxWidth > 600;

        return ListView(
          padding: EdgeInsets.all(
            isWide ? 32 : 20,
          ),

          children: [
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

            SizedBox(
              height: verticalSpacing,
            ),

            Container(
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
                    'задач пользователя.',
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
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 170,

              child: ListView.separated(
                scrollDirection: Axis.horizontal,

                itemCount: applications.length,

                separatorBuilder: (context, index) =>
                const SizedBox(width: 12),

                itemBuilder: (context, index) {
                  final item =
                  applications[index];

                  return ClipRRect(
                    borderRadius:
                    BorderRadius.circular(18),

                    child: SizedBox(
                      width: isWide ? 250 : 200,

                      child: Image.asset(
                        item.imagePath,
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
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            if (isWide)

              GridView.builder(
                shrinkWrap: true,

                physics:
                const NeverScrollableScrollPhysics(),

                itemCount:
                applications.length,

                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing:
                  verticalSpacing,
                  childAspectRatio: 3.2,
                ),

                itemBuilder: (context, index) {
                  return _buildApplicationCard(
                    context,
                    applications[index],
                  );
                },
              )

            else

              SizedBox(
                height: 280,

                child: ListView.separated(
                  itemCount:
                  applications.length,

                  separatorBuilder:
                      (context, index) =>
                  const SizedBox(
                    height: 8,
                  ),

                  itemBuilder:
                      (context, index) {

                    return _buildApplicationCard(
                      context,
                      applications[index],
                    );
                  },
                ),
              ),

            SizedBox(
              height: verticalSpacing,
            ),

            const Divider(),

            const SizedBox(height: 15),

            const Text(
              'Бабаянц Т.А. - ИКБО-63-23',
              textAlign: TextAlign.center,
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
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {

              switch (state) {
                case HomeInitial():
                  return const Center(
                    child: Text(
                      'Данные еще не загружены',
                    ),
                  );

                case HomeLoading():
                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                case HomeError(:final message):
                  return Center(
                    child: Text(message),
                  );

                case HomeLoaded(
                    :final applications
                ):
                  return _buildHomeContent(
                    context,
                    applications,
                  );
              }
            },
          ),

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