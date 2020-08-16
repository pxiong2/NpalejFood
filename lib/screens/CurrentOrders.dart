import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentOrders extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CurrentOrdersPage();
  }
}

class _CurrentOrdersPage extends State<CurrentOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[Text('Current Orders')],),
    );
  }
}
