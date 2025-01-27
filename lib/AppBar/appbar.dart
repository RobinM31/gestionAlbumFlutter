import 'package:flutter/material.dart';



class appBar_Principal extends StatefulWidget implements PreferredSizeWidget {
  appBar_Principal({super.key,required this.actions});
  String title = 'Gestion Album';
  List<Widget> actions = [];

  @override
  State<appBar_Principal> createState() => _appBar_PrincipalState();

  @override
  Size get  preferredSize => Size.fromHeight(kToolbarHeight);

}

class _appBar_PrincipalState extends State<appBar_Principal> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),


      actions: <Widget>[IconButton(
          onPressed: (){
          },
          icon: Icon(Icons.search)
        ),

        ...widget.actions,
      ],
    );
  }
}

