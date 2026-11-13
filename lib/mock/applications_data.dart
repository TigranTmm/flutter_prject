import '../models/application_item.dart';

const List<ApplicationItem> applications = [
  ApplicationItem(
    title: 'Настольные приложения',
    shortDescription:
    'Программы для персональных компьютеров',
    fullDescription:
    'Настольные приложения устанавливаются и запускаются '
        'непосредственно на персональном компьютере.',
    imagePath: 'assets/images/desktop.jpg',
    iconName: 'desktop',
  ),

  ApplicationItem(
    title: 'Мобильные приложения',
    shortDescription:
    'Приложения для смартфонов и планшетов',
    fullDescription:
    'Мобильные приложения предназначены для работы '
        'на смартфонах, планшетах и других мобильных устройствах.',
    imagePath: 'assets/images/mobile.webp',
    iconName: 'mobile',
  ),

  ApplicationItem(
    title: 'Web-приложения',
    shortDescription:
    'Приложения, работающие через браузер',
    fullDescription:
    'Web-приложения запускаются в браузере '
        'и используют веб-технологии для взаимодействия с пользователем.',
    imagePath: 'assets/images/web.jpg',
    iconName: 'web',
  ),

  ApplicationItem(
    title: 'Консольные приложения',
    shortDescription:
    'Программы с интерфейсом командной строки',
    fullDescription:
    'Консольные приложения взаимодействуют с пользователем '
        'с помощью командной строки.',
    imagePath: 'assets/images/console.jpeg',
    iconName: 'console',
  ),

  ApplicationItem(
    title: 'Серверные приложения',
    shortDescription:
    'Программы, выполняющиеся на сервере',
    fullDescription:
    'Серверные приложения выполняются на сервере '
        'и предоставляют данные или сервисы другим приложениям.',
    imagePath: 'assets/images/server.jpeg',
    iconName: 'server',
  ),
];