import 'package:flutter/material.dart';
import 'package:flutter_app_food/utilities/signOut.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';

class Deliver extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DeliverPage();
  }
}

class _DeliverPage extends State<Deliver> {
  String fname, lname;

  @override
  void initState() {
    super.initState();
    findUser();
  }

  Future<Null> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      fname = preferences.getString('fname');
      lname = preferences.getString('lname');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((fname != null && lname != null) ? '$fname $lname' : 'No name'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: () {
              signOutProcess(context);
            },
          )
        ],
      ),
    );
  }
}
