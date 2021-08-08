import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTitleEasy extends StatelessWidget{
  var size;

  MyTitleEasy(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.10,
      padding: EdgeInsets.all(5.0),
      child: Text(
          "Einfach",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: size.height * 0.05,
          color: Colors.white,
          decoration: TextDecoration.none,

        ),
      ),
    );
  }
}