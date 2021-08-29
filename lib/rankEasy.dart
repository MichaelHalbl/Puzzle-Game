import 'package:firstapp_app/rankHard.dart';
import 'package:firstapp_app/rankMiddle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen_Easy.dart';

class Rangliste extends StatefulWidget {
  @override
  _RanglisteState createState() => _RanglisteState();
}

class _RanglisteState extends State<Rangliste> {
  int timeValue;
  int moveValue;

  @override
  void initState() {
    super.initState();
    getMove();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    IconData icon1 = FontAwesomeIcons.feather;
    IconData icon2 = FontAwesomeIcons.userClock;
    IconData icon3 = FontAwesomeIcons.weightHanging;
    IconData icon4 = FontAwesomeIcons.houseUser;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Leaderboard - Einfach'),
      ),
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                ),
                child: SizedBox(
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: const Color(0xFF778899),
                    backgroundImage: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/15-puzzle_magical.svg/1200px-15-puzzle_magical.svg.png"),
                  ),
                ),
              ),
              ListTile(
                leading: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Rangliste()));
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    alignment: Alignment.center,
                    child: FaIcon(icon1, size: 35, color: Colors.lightBlue),
                  ),
                ),
                title: const Text('Einfach'),
                dense: false,
              ),
              ListTile(
                leading: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RanglisteMiddle()));
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    alignment: Alignment.center,
                    child: FaIcon(icon2, size: 30, color: Colors.lightBlue),
                  ),
                ),
                title: const Text('Mittel'),
                dense: false,
              ),
              ListTile(
                leading: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RanglisteHard()));
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    alignment: Alignment.center,
                    child: FaIcon(icon3, size: 35, color: Colors.lightBlue),
                  ),
                ),
                title: const Text('Schwer'),
                dense: false,
              ),
              ListTile(
                leading: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    alignment: Alignment.center,
                    child: FaIcon(icon4, size: 35, color: Colors.lightBlue),
                  ),
                ),
                title: const Text('Hauptmenü'),
                dense: false,
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: myDetailsContainer1(),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 200,
                        ),
                      ],
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 1.0),
                            child: myDetailsContainer2(),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 180,
                        ),
                      ],
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: myDetailsContainer3(),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 180,
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget myDetailsContainer1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            "User12345 "
            "Deine Moves und Zeit auf einfach sind:",
            style: TextStyle(
                color: Color(0xffe6020a),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
        ),
      ],
    );
  }

  Widget myDetailsContainer2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: timeValue == null
                ? Text(
                    'Keine Zeit vorhanden!',
                    style: TextStyle(
                        color: Color(0xffe6020a),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  )
                : Text(
                    timeValue.toString(),
                    style: TextStyle(
                        color: Color(0xffe6020a),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
        ),
      ],
    );
  }

  void getTime() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    timeValue = pref.getInt('timeData');
    setState(() {});
  }

  Widget myDetailsContainer3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: moveValue == null
              ? Text(
                  'Keine Moves vorhanden!',
                  style: TextStyle(
                      color: Color(0xffe6020a),
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                )
              : Text(
                  moveValue.toString(),
                  style: TextStyle(
                      color: Color(0xffe6020a),
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
        ),
      ],
    );
  }

  void getMove() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    moveValue = pref.getInt('moveData');
    setState(() {});
  }
}
