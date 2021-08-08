
import 'package:firstapp_app/Move.dart';
import 'package:firstapp_app/Time.dart';
import 'package:firstapp_app/backButton.dart';
import 'package:firstapp_app/resetGameButton.dart';
import 'package:flutter/material.dart';

class buttons extends StatelessWidget {
  Function reset;
  int move;
  int secondsPassed;
  Function back;
  var size;

  buttons(this.reset, this.move, this.secondsPassed, this.size, this.back);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          resetGameButton(reset),
          Move(move),
          Time(secondsPassed),
          backButton(back),
          //backButton(home_screen),
        ],
      )
    );
  }
}