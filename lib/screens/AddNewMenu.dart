
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewMenu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AddNewMenuPage();
  }

}

class _AddNewMenuPage  extends State<AddNewMenu>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(children: <Widget>[Text('Add a new menu')],),);
  }
}
