import 'package:flutter/material.dart';

Future<void> shareDialog(BuildContext context, String msn) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text(msn, style: TextStyle(color: Colors.orange.shade500),),
      children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK', style: TextStyle(color: Colors.orange.shade500),),
            ),
          ],
        )
      ],
    ),
  );
}
