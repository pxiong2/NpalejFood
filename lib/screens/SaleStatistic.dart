import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaleStatistic extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SaleStatisticPage();
  }

}

class _SaleStatisticPage  extends State<SaleStatistic>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(children: <Widget>[Text('Sales Statistic')],),);
  }
}