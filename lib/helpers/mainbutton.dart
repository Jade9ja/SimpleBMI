import 'package:flutter/material.dart';
import 'const.dart';

class Mainbutton extends StatelessWidget {
  Mainbutton({@required this.onTap, @required this.title});
  final Function onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        color: Bottombarcolor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: Bottombarheight,
      ),
    );
  }
}
