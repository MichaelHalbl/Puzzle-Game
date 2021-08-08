import 'package:firstapp_app/home_screen_Easy.dart';
import 'package:flutter/material.dart';

class backButton extends StatelessWidget {
  Function back;

  backButton(this.back);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text("Hauptmenü"),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
    );
  }
}
