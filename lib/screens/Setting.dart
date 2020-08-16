import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_food/screens/AddShopInfor.dart';
import 'package:flutter_app_food/utilities/my_style.dart';

class Setting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingPage();
  }
}

class _SettingPage extends State<Setting> {
  Widget currentPage = Setting();

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      MyStyle().noDataText(context, 'No data to show!'),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 16.0, bottom: 16.0),
                child: FloatingActionButton(
                  onPressed: () {
                    MaterialPageRoute route =
                        MaterialPageRoute(builder: (context) => AddShopInfor());
                    Navigator.push(context, route);
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      )
    ]);
  }
}
