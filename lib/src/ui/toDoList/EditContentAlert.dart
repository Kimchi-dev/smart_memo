import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class EditContentAlert extends StatefulWidget {
  @override
  _EditContentAlertState createState() => _EditContentAlertState();
}

class _EditContentAlertState extends State<EditContentAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10.0),
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(10.0))),
      backgroundColor: Colors.white,
      actions: <Widget>[
        DialogButton(
          child: Icon(
            Icons.camera_alt,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.blueAccent,
          radius: BorderRadius.circular(10.0),
        ),
        DialogButton(
          child: Icon(
            Icons.image,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.blueAccent,
          radius: BorderRadius.circular(10.0),
        ),
        DialogButton(
          child: Icon(
            Icons.image,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.blueAccent,
          radius: BorderRadius.circular(10.0),
        ),
      ],
    );
  }
}
