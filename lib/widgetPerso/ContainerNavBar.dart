import 'package:flutter/material.dart';
import 'package:flutteralbum/widgetPerso/Card1.dart';

class Containernavbar1 extends StatefulWidget {
  const Containernavbar1({super.key});

  @override
  State<Containernavbar1> createState() => _ContainernavbarState();
}

class _ContainernavbarState extends State<Containernavbar1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            color: Color.fromRGBO(91, 171, 95 ,1),
            child: Row(
              children: [
                Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Oxygen480-devices-media-optical-dvd.svg/1200px-Oxygen480-devices-media-optical-dvd.svg.png',
                  height: 150,
                  width: 150,
                ),
                Text("Bienvenue sur l'application \nde gestion d'album")
              ],
            ),
          ),
          Card1(titre: "News",contenu: "Derniere actu",),
          Card1(titre: 'Version 1', contenu: 'Wait and see')
        ],
      ),
    );
  }
}

class Containernavbar3 extends StatefulWidget {
  const Containernavbar3({super.key});

  @override
  State<Containernavbar3> createState() => _Containernavbar3State();
}

class _Containernavbar3State extends State<Containernavbar3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card1(titre: "Configurer les paramêtre", contenu: "Param1")
        ],
      ),
    );
  }
}

