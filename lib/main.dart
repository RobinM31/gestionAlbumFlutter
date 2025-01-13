import 'package:flutter/material.dart';
import 'package:flutteralbum/AppBar/appbar.dart';
import 'package:flutteralbum/my_flutter_app_icons.dart';
import 'package:json_theme/json_theme.dart';
import 'package:flutter/services.dart';
import 'package:flutteralbum/themeController.dart';
import 'dart:convert';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeLightStr = await rootBundle.loadString('assets/ThemeAlbum.json');
  final themeLightJson = jsonDecode(themeLightStr);
  final themeLight = ThemeDecoder.decodeThemeData(themeLightJson)!;

  final themeDarkStr = await rootBundle.loadString('assets/ThemeAlbum.json');
  final themeDarkJson = jsonDecode(themeDarkStr);
  final themeDark = ThemeDecoder.decodeThemeData(themeDarkJson)!;

  runApp(MyApp(themeLight: themeLight, themeDark: themeDark,));
}

class MyApp extends StatelessWidget {

  final ThemeData themeLight;
  final ThemeData themeDark;
  const MyApp({Key? key, required this.themeLight, required this.themeDark}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: themeController,
        builder: (context, themeMode, _){

          return MaterialApp(
            title: 'Gestion des Albums',
            debugShowMaterialGrid: false,
            debugShowCheckedModeBanner: false,
            theme: themeLight,
            darkTheme: themeDark,
            themeMode: themeMode,
            home: const MyHomePage(title: "Page d'accueil"),
          );

         },
        );
      }

  }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int currentPageIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : appBar_Principal(
        actions: <Widget>[
        ],
      ),
      body: <Widget>[
            Container(
              child: const Text('Home'),
            ),
            Container(
              child: const Text('Liste musique'),
            ),
            Container(
              child: const Text('Paramètre'),
            )
          ][currentPageIndex],

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


      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
