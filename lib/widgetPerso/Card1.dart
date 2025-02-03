import 'package:flutter/material.dart';

class Card1 extends StatefulWidget {
  const Card1({super.key,required this.titre, required this.contenu});
  final String titre;
  final String contenu;

  @override
  State<Card1> createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 20.0),
      child:Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: [
              ListTile(
                title: Text(widget.titre,
                  textAlign: TextAlign.left,
                ),
                subtitle: Text(widget.contenu,
                  textAlign: TextAlign.left,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
