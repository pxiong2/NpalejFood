import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_food/model/UserModel.dart';
import 'package:flutter_app_food/screens/Customer.dart';
import 'package:flutter_app_food/screens/Deliver.dart';
import 'package:flutter_app_food/screens/Owner.dart';
import 'package:flutter_app_food/utilities/my_style.dart';
import 'package:flutter_app_food/utilities/popUpDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String userEmail, pwd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In', style: TextStyle(color: Color(0xffffffaa))),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: <Color>[
              Colors.white,
              MyStyle().amberColor,
            ],
            radius: 1.0,
            center: Alignment(0, -0.3),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyStyle().showLoGo(),
                MyStyle().buildSizedBox(),
                MyStyle().showLoGoName('NplejTshiab'),
                MyStyle().buildSizedBox(),
                textEmail(),
                MyStyle().buildSizedBox(),
                textPWD(),
                MyStyle().buildSizedBox(),
                buildLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginButton() {
    return Container(
      width: 300.0,
      child: RaisedButton(
        color: MyStyle().orangeColor,
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          if (userEmail == null ||
              userEmail.isEmpty ||
              pwd == null ||
              pwd.isEmpty) {
            shareDialog(
                context, 'Cannot login, the email or password is empty!');
          } else {
            checkAuthen();
          }
        },
      ),
    );
  }

  Future<Null> checkAuthen() async {
    String url =
        'http://192.168.1.141/nplejfood/getUserWhereUserMaster.php?isAdd=true&email=$userEmail';
    try {
      Response resp = await Dio().get(url);
      var res = resp;
      print('res = $resp');
      if (res.toString() == 'null') {
        shareDialog(context, 'This user is not exist, please try again!');
      }
      // to solve unicode or thai or lao letter you shoud set the database collection to utf8_unicode_ci
      //then use json.decode() to match the data to be readable
      var result = json.decode(resp.data);
      print('result = $result');

      for (var map in result) {
        UserModel userModel = UserModel.fromJson(map);
        if (pwd != userModel.pwd) {
          shareDialog(context, 'Your password is incorrect, please try again!');
        } else {
          if (userModel.userType == 'Owner') {
            routeToService(Owner(), userModel);
          } else if (userModel.userType == 'User') {
            routeToService(Customer(), userModel);
          } else if (userModel.userType == 'Deliver') {
            routeToService(Deliver(), userModel);
          }
        }
      }
    } catch (e) {}
  }

  void routeToService(Widget myWidget, UserModel userModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('id', userModel.id);
    preferences.setString('fname', userModel.fname);
    preferences.setString('lname', userModel.lname);
    preferences.setString('email', userModel.email);
    preferences.setString('userType', userModel.userType);
    MaterialPageRoute newRoute = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, newRoute, (route) => false);
  }

  Widget textEmail() => Container(
        width: 300.0,
        child: TextField(
          onChanged: (value) => userEmail = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.mail_outline,
              color: MyStyle().orangeColor,
            ),
            labelStyle: TextStyle(color: MyStyle().orangeColor),
            labelText: 'Email',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().amberColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().orangeColor)),
          ),
        ),
      );

  Widget textPWD() => Container(
        width: 300.0,
        child: TextField(
          onChanged: (value) => pwd = value.trim(),
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.vpn_key,
              color: MyStyle().orangeColor,
            ),
            labelStyle: TextStyle(color: MyStyle().orangeColor),
            labelText: 'Password',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().amberColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().orangeColor)),
          ),
        ),
      );
}
