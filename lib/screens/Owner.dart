import 'package:flutter/material.dart';
import 'package:flutter_app_food/screens/AddNewMenu.dart';
import 'package:flutter_app_food/screens/CurrentOrders.dart';
import 'package:flutter_app_food/screens/DeliveredOrders.dart';
import 'package:flutter_app_food/screens/SaleStatistic.dart';
import 'package:flutter_app_food/screens/Setting.dart';
import 'package:flutter_app_food/utilities/createDrawer.dart';
import 'package:flutter_app_food/utilities/signOut.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Owner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OwnerPage();
  }
}

class _OwnerPage extends State<Owner> {
  String fname, lname, email;
  Widget currentPage = CurrentOrders();

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
      email = preferences.getString('email');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            (fname != null && lname != null) ? '$fname $lname' : 'No name'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: () {
              signOutProcess(context);
            },
          )
        ],
      ),
      drawer: showDrawer(),
      body: currentPage,
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showDrawerHeader(email),
            currentOrders(),
            deliveredOrders(),
            addNewMenu(),
            saleStatistic(),
            setting(),
            logOut(),
          ],
        ),
      );

  ListTile currentOrders() => ListTile(
        leading: Icon(Icons.restaurant_menu),
        title: Text('Current Orders'),
        subtitle: Text('The orders are not delivered'),
        onTap: () {
          setState(() {
            currentPage = CurrentOrders();
          });
          Navigator.pop(context);
        },
      );

  ListTile deliveredOrders() => ListTile(
        leading: Icon(Icons.directions_bike),
        title: Text('Delivered Orders'),
        subtitle: Text('The orders are not delivered'),
        onTap: () {
          setState(() {
            currentPage = DeliveredOrders();
          });
          Navigator.pop(context);
        },
      );

  ListTile addNewMenu() => ListTile(
        leading: Icon(Icons.add_circle),
        title: Text('Add a new menu'),
        subtitle: Text('The new menus you want to add'),
        onTap: () {
          setState(() {
            currentPage = AddNewMenu();
          });
          Navigator.pop(context);
        },
      );

  ListTile saleStatistic() => ListTile(
        leading: Icon(Icons.show_chart),
        title: Text('Sale Statistic'),
        subtitle: Text('Looking at what you sale'),
        onTap: () {
          setState(() {
            currentPage = SaleStatistic();
          });
          Navigator.pop(context);
        },
      );

  ListTile setting() => ListTile(
        leading: Icon(Icons.settings),
        title: Text('Setting'),
        subtitle: Text('Shop information setting'),
        onTap: () {
          setState(() {
            currentPage = Setting();
          });
          Navigator.pop(context);
        },
      );

  ListTile logOut() => ListTile(
        leading: Icon(Icons.power_settings_new),
        title: Text('Log Out'),
        subtitle: Text('Do you want to log out?'),
        onTap: () => signOutProcess(context),
      );
}
