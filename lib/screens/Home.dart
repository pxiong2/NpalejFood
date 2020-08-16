import 'package:flutter/material.dart';
import 'package:flutter_app_food/screens/Customer.dart';
import 'package:flutter_app_food/screens/Deliver.dart';
import 'package:flutter_app_food/screens/Owner.dart';
import 'package:flutter_app_food/screens/SignIn.dart';
import 'package:flutter_app_food/screens/SignUp.dart';
import 'package:flutter_app_food/utilities/my_style.dart';
import 'package:flutter_app_food/utilities/popUpDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
//  State<StatefulWidget> createState() {
//    return _HomeState();
//  }
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    checkPreferance();
  }

  Future<Null> checkPreferance() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String userType = preferences.getString('userType');
      if (userType != null && userType.isNotEmpty) {
        if (userType == 'User') {
          routeToUserType(Customer());
        } else if (userType == 'Owner') {
          routeToUserType(Owner());
        } else if (userType == 'Deliver') {
          routeToUserType(Deliver());
        } else {
          shareDialog(context, 'Error: user type is unknown!');
        }
      }
    } catch (e) {}
  }

  void routeToUserType(Widget myWidget) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: showdDrawer(),
    );
  }

  //Function create the drawer
  Drawer showdDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showDrawerHeader(),
            showSignIn(),
            showSignUp(),
          ],
        ),
      );

  ListTile showSignIn() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('Sign In'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignIn());
        Navigator.push(context, route);
      },
    );
  }

  ListTile showSignUp() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('Sign Up'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignUp());
        Navigator.push(context, route);
      },
    );
  }

  UserAccountsDrawerHeader showDrawerHeader() {
    return UserAccountsDrawerHeader(
      currentAccountPicture: MyStyle().showLoGo(),
      accountName: Text('Guest'),
      accountEmail: Text('You are not login'),
    );
  }
}
