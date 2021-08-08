import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class resetGameButton extends StatelessWidget {
  Function reset;

  resetGameButton(this.reset);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Reset Game"),
      onPressed: reset,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      )
    );
  }
}