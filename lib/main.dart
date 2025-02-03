import 'package:flutter/material.dart';
import 'package:flutteralbum/AppBar/appbar.dart';
import 'package:flutteralbum/my_flutter_app_icons.dart';
import 'package:flutteralbum/widgetPerso/Card1.dart';
import 'package:flutteralbum/widgetPerso/ContainerNavBar.dart';
import 'package:json_theme/json_theme.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class ThemeController extends ValueNotifier<ThemeMode> {
  ThemeController() : super(ThemeMode.light);

  void toggleTheme() {
    value = value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeLightStr = await rootBundle.loadString('assets/theme_gestionAlbum_light.json');
  final themeLightJson = jsonDecode(themeLightStr);
  final themeLight = ThemeDecoder.decodeThemeData(themeLightJson)!;

  final themeDarkStr = await rootBundle.loadString('assets/theme_gestionAlbum_dark.json');
  final themeDarkJson = jsonDecode(themeDarkStr);
  final themeDark = ThemeDecoder.decodeThemeData(themeDarkJson)!;

  runApp(MyApp(themeLight: themeLight, themeDark: themeDark));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.themeLight, required this.themeDark}) : super(key: key);

  final ThemeData themeLight;
  final ThemeData themeDark;
  final themeController = ThemeController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeController,
      builder: (context, themeMode, _) {
        return MaterialApp(
          title: 'Gestion des Albums',
          debugShowMaterialGrid: false,
          debugShowCheckedModeBanner: false,
          theme: themeLight,
          darkTheme: themeDark,
          themeMode: themeMode,
          home: MyHomePage(title: "Page d'accueil", themeController: themeController),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final ThemeController themeController;

  MyHomePage({Key? key, required this.title, required this.themeController}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar_Principal(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.lightbulb),
            onPressed: () {
              widget.themeController.toggleTheme();
            },
          ),
        ],
      ),
      body: <Widget>[
        Containernavbar1(),
        Container(
          child: const Text('Liste musique'),
        ),
        Containernavbar3()
      ][currentPageIndex],


      floatingActionButton: currentPageIndex == 0 ? FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: const Icon(Icons.add),
      ): null,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.beenhere),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.beenhere),
            icon: Icon(Icons.music_note),
            label: 'Liste musique',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.beenhere),
            icon: Icon(Icons.settings),
            label: 'Paramètre',
          ),
        ],
      ),
    );
  }
}
