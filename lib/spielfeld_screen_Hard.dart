import 'dart:ffi';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firstapp_app/MyTitleHard.dart';
import 'package:firstapp_app/Time.dart';
import 'package:flutter/material.dart';
import 'MyTitleEasy.dart';
import 'buttons.dart';
import 'grid.dart';
import 'dart:async';

import 'home_screen_Easy.dart';

class spielfeldSchwer extends StatefulWidget {
  @override
  _spielfeldState createState() => _spielfeldState();
}

class _spielfeldState extends State<spielfeldSchwer> {
  var numbers = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31
  ];
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
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          MyTitleHard(size),
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
        index + 1 < 32 && numbers[index + 1] == 0 && (index + 1) % 4 != 0 ||
        (index - 4 >= 0 && numbers[index - 4] == 0) ||
        (index + 4 < 32 && numbers[index + 4] == 0)) {
      setState(() {
        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
        move++; // wichtig für rank
        setMoveDataHard(move);
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

  void back() {}

  void startTime() {
    if (isActive) {}
    setState(() {
      secondsPassed += 1; // wichtig für rank
      setTimeDataHard(secondsPassed);
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
                        "Du hast auf Schwer Gewonnen!",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                          width: 300,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                            },
                            child: Text(
                              "Schließen",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            color: Theme.of(context).primaryColor,
                          ))
                    ],
                  ),
                )),
          );
        },
      );
    }
  }

  Future<void> setTimeDataHard(timeValue) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('timeDataHard', timeValue);
  }

  Future<void> setMoveDataHard(moveValue) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('moveDataHard', moveValue);
  }
}
