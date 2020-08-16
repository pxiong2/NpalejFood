import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliveredOrders extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DeliveredOrdersPage();
  }

}

class _DeliveredOrdersPage  extends State<DeliveredOrders>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(children: <Widget>[Text('Delivered Orders')],),);
  }
}