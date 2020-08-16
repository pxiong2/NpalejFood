import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_food/utilities/my_style.dart';
import 'package:flutter_app_food/utilities/popUpDialog.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddShopInfor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddShopInforPage();
  }
}

class _AddShopInforPage extends State<AddShopInfor> {
  String shopName, shopAddress, email, tel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Shop Info'),
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
              children: <Widget>[
                Text('Add Shop Info'),
                MyStyle().buildSizedBox(),
                buildFieldShopName(),
                MyStyle().buildSizedBox(),
                buildFieldShopAddress(),
                MyStyle().buildSizedBox(),
                buildFieldShopEmail(),
                MyStyle().buildSizedBox(),
                buildFieldShopTel(),
                MyStyle().buildSizedBox(),
                groupImage(),
                MyStyle().buildSizedBox(),
                showMap(),
                MyStyle().buildSizedBox(),
                buildSaveButton(),
                MyStyle().buildSizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container showMap() {
    LatLng latLng = LatLng(44.510398, -87.966267);
    CameraPosition cameraPosition = CameraPosition(target: latLng, zoom: 16.0);
    return Container(
      height: 300.0,
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,onMapCreated: (controller){},
      ),
    );
  }

  Row groupImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.add_a_photo,
            size: 40.0,
          ),
          onPressed: () {},
        ),
        Container(
          width: 150.0,
          child: Image.asset('images/logo.png'),
        ),
        IconButton(
          icon: Icon(
            Icons.add_photo_alternate,
            size: 40.0,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildFieldShopName() => Container(
        width: 300.0,
        child: TextField(
          onChanged: (value) => shopName = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.home,
              color: MyStyle().orangeColor,
            ),
            labelStyle: TextStyle(color: MyStyle().orangeColor),
            labelText: 'Shop Name',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().amberColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().orangeColor)),
          ),
        ),
      );

  Widget buildFieldShopAddress() => Container(
        width: 300.0,
        child: TextField(
          onChanged: (value) => shopAddress = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.add_location,
              color: MyStyle().orangeColor,
            ),
            labelStyle: TextStyle(color: MyStyle().orangeColor),
            labelText: 'Address',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().amberColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().orangeColor)),
          ),
        ),
      );

  Widget buildFieldShopEmail() => Container(
        width: 300.0,
        child: TextField(
          onChanged: (value) => email = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.mail_outline,
              color: MyStyle().orangeColor,
            ),
            labelStyle: TextStyle(color: MyStyle().orangeColor),
            labelText: 'Email Address',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().amberColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().orangeColor)),
          ),
        ),
      );

  Widget buildFieldShopTel() => Container(
        width: 300.0,
        child: TextField(
          keyboardType: TextInputType.phone,
          onChanged: (value) => tel = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.phone,
              color: MyStyle().orangeColor,
            ),
            labelStyle: TextStyle(color: MyStyle().orangeColor),
            labelText: 'Phone Number',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().amberColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().orangeColor)),
          ),
        ),
      );

  Widget buildSaveButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton.icon(
        color: MyStyle().orangeColor,
        label: Text(
          'Save',
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(Icons.save, color: Colors.white,),
        onPressed: () {
          if (shopName == null ||
              shopName.isEmpty ||
              shopAddress == null ||
              shopAddress.isEmpty ||
              email == null ||
              email.isEmpty ||
              tel == null ||
              tel.isEmpty) {
            shareDialog(context, 'Please enter all fields');
          } else {
            saveShopInfo();
          }
        },
      ),
    );
  }

  void saveShopInfo() {}
}
