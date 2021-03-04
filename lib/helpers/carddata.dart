import 'package:flutter/material.dart';
import 'const.dart';

class Carddata extends StatelessWidget {
  const Carddata({this.cardtext, this.cardicon});

  final String cardtext;
  final IconData cardicon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardicon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          cardtext,
          style: carddatastyle,
        )
      ],
    );
  }
}
