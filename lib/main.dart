import 'package:flutter/material.dart';
import 'package:flutter_app_food/screens/Home.dart';

//void main() {
//  runApp(MyApp());
//}
main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber, iconTheme: IconThemeData(color: Colors.white),),

      title: 'Food App',
      home: Home(),
    );
  }
}
