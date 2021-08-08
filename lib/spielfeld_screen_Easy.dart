import 'dart:ffi';

import 'package:firstapp_app/Time.dart';
import 'package:flutter/material.dart';
import 'MyTitleEasy.dart';
import 'buttons.dart';
import 'grid.dart';
import 'dart:async';

class spielfeldEinfach extends StatefulWidget {
  @override
  _spielfeldState createState() => _spielfeldState();
}

class _spielfeldState extends State<spielfeldEinfach> {
  var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int move = 0;
  int secondsPassed = 0;
  static const duration = const Duration(seconds: 1);
  bool isActive = false;
  Timer timer;

  @override
  void initState() {
    super.initState();
    numbers.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (timer == null) {
      timer = Timer.periodic(duration, (t) {
        startTime();
      });
    }
    return SafeArea(
        child: Container(
      height: size.height,
      color: Colors.orange,
      child: Column(
        children: <Widget>[
          MyTitleEasy(size),
          Grid(numbers, size, clickGrid),
          buttons(reset, move, secondsPassed, size, back),
        ],
      ),
    ));
  }

  void clickGrid(index) {
    if (secondsPassed == 0) {
      isActive = true;
    }
    if (index - 1 >= 0 && numbers[index - 1] == 0 && index % 4 != 0 ||
        index + 1 < 16 && numbers[index + 1] == 0 && (index + 1) % 4 != 0 ||
        (index - 4 >= 0 && numbers[index - 4] == 0) ||
        (index + 4 < 16 && numbers[index + 4] == 0)) {
      setState(() {
        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
        move++;
      });
    }
    Win();
  }

  void reset() {
    setState(() {
      numbers.shuffle();
      move = 0;
      isActive = false;
      secondsPassed = 0;
    });
  }

  void back() {

  }


  void startTime() {
    if (isActive) {}
    setState(() {
      secondsPassed += 1;
    });
  }

  bool sorted(List list) {
    int prev = list.first;
    for (var i = 1; i < list.length - 1; i++) {
      int next = list[i];
      if (prev > next) return false;
      prev = next;
    }
    return true;
  }

  void Win() {
    if (sorted(numbers)) {
      isActive = false;
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
                height: 150,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Du hast Gewonnen auf Einfach!",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                          width: 200,
                          child: RaisedButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text(
                                "Schließen",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            color: Colors.white,
                          ))
                    ],
                  ),
                )),
          );
        },
      );
    }
  }
}

