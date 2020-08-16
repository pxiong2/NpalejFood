import 'package:flutter/material.dart';
import 'package:flutter_app_food/utilities/my_style.dart';
import 'package:flutter_app_food/utilities/popUpDialog.dart';
import 'package:dio/dio.dart';

class SignUp extends StatefulWidget {
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String userType, firstName, lastName, email, pwd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(colors: <Color>[
          Colors.white,
          MyStyle().amberColor,
        ], radius: 1.0, center: Alignment(0, -0.3))),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyStyle().showLoGo(),
                MyStyle().buildSizedBox(),
                MyStyle().showLoGoName('NplejTshiab'),
                MyStyle().buildSizedBox(),
                MyStyle().buildTitle('User Info'),
                MyStyle().buildSizedBox(),
                buildFieldFirstName(),
                MyStyle().buildSizedBox(),
                buildFieldLastName(),
                MyStyle().buildSizedBox(),
                buildFieldEmail(),
                MyStyle().buildSizedBox(),
                buildFieldPWD(),
                MyStyle().buildSizedBox(),
                MyStyle().buildTitle('User Type'),
                buildCustomer(),
                buildOwner(),
                buildDeliver(),
                buildSignUpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCustomer() {
    return Container(
      width: 300.0,
      child: Row(
        children: <Widget>[
          Radio(
            value: 'User',
            groupValue: userType,
            onChanged: (value) {
              setState(() {
                userType = value;
              });
            },
          ),
          Text(
            'Customer',
            style: TextStyle(color: MyStyle().orangeColor),
          ),
        ],
      ),
    );
  }

  Widget buildOwner() {
    return Container(
      width: 300.0,
      child: Row(
        children: <Widget>[
          Radio(
            value: 'Owner',
            groupValue: userType,
            onChanged: (value) {
              setState(() {
                userType = value;
              });
            },
          ),
          Text(
            'Owner',
            style: TextStyle(color: MyStyle().orangeColor),
          ),
        ],
      ),
    );
  }

  Widget buildDeliver() {
    return Container(
      width: 300.0,
      child: Row(
        children: <Widget>[
          Radio(
            value: 'Deliver',
            groupValue: userType,
            onChanged: (value) {
              setState(() {
                userType = value;
              });
            },
          ),
          Text(
            'Deliver',
            style: TextStyle(color: MyStyle().orangeColor),
          ),
        ],
      ),
    );
  }

  Widget buildSignUpButton() {
    return Container(
      width: 300.0,
      child: RaisedButton(
        color: MyStyle().orangeColor,
        child: Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          print(
              'name: $firstName, lastname: $lastName, email: $email, password: $pwd, user: $userType');
//          (firstName != null ||
//              lastName != null ||
//              email != null ||
//              pwd != null ||
//              userType.isEmpty)
//              ? shareDialog(context, 'Please enter all fields')
//              : Container();
          if (firstName == null ||
              firstName.isEmpty ||
              lastName == null ||
              lastName.isEmpty ||
              email == null ||
              email.isEmpty ||
              pwd == null ||
              pwd.isEmpty) {
            shareDialog(context, 'Please enter all fields');
          } else if (userType == null) {
            shareDialog(context, 'Please choose a user type');
          } else {
            isUserExist();
          }
        },
      ),
    );
  }

  Future<Null> isUserExist() async {
    String url ='http://192.168.1.141/nplejfood/getUserWhereUserMaster.php?isAdd=true&email=$email';
    try {
      Response response = await Dio().get(url);
      if(response.toString() == 'null'){
        registerThread();
      }else {
        shareDialog(context, 'The email "$email" has been used ');
      }
      print('res = $response');
    } catch (e) {}
  }

  Future<Null> registerThread() async {
    String url =
        'http://192.168.1.141/nplejfood/addUser.php?isAdd=true&fname=$firstName&lname=$lastName&email=$email&pwd=$pwd&userType=$userType';
    try {
      Response response = await Dio().get(url);
      print('res = $response');
      if(response.toString() == 'true'){
        Navigator.pop(context);
      }else {
        shareDialog(context, 'Cannot register, please try aain!');
      }
    } catch (e) {}
  }

  Widget buildFieldFirstName() => Container(
        width: 300.0,
        child: TextField(
          onChanged: (value) => firstName = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.perm_identity,
              color: MyStyle().orangeColor,
            ),
            labelStyle: TextStyle(color: MyStyle().orangeColor),
            labelText: 'First Name',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().amberColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().orangeColor)),
          ),
        ),
      );

  Widget buildFieldLastName() => Container(
        width: 300.0,
        child: TextField(
          onChanged: (value) => lastName = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.perm_identity,
              color: MyStyle().orangeColor,
            ),
            labelStyle: TextStyle(color: MyStyle().orangeColor),
            labelText: 'Last Name',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().amberColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().orangeColor)),
          ),
        ),
      );

  Widget buildFieldEmail() => Container(
        width: 300.0,
        child: TextField(
          onChanged: (value) => email = value.trim(),
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

  Widget buildFieldPWD() => Container(
        width: 300.0,
        child: TextField(
          onChanged: (value) => pwd = value.trim(),
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
