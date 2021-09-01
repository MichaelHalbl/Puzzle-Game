import 'dart:typed_data';

import 'package:firstapp_app/rankHard.dart';
import 'package:firstapp_app/rankMiddle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen_Easy.dart';

class Rangliste extends StatefulWidget {
  @override
  _RanglisteState createState() => _RanglisteState();
}

class _RanglisteState extends State<Rangliste> {
  int timeValue;
  int moveValue;
  final controller = ScreenshotController();

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
      body: Screenshot(
        controller: controller,
        child: ListView(
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
                            width: 150,
                            height: 65,
                            child: myDetailsContainer1(),
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
                            width: 150,
                            height: 65,
                            child: myDetailsContainer2(),
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
                            width: 150,
                            height: 65,
                            child: myDetailsContainer3(),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            TextButton(
                child: Text(
                  'Share',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  final imageFile = await controller.capture();
                  if (imageFile == null) return;
                  await saveImage(imageFile);
                  saveAndShare(imageFile);
                }),
          ],
        ),
      ),
    );
  }

  Future saveAndShare(Uint8List bytes) async {
    final directory = await getApplicationDocumentsDirectory();
   /* final image = File('${directory.path}/Einfach.png');
    image.writeAsBytesSync(bytes);
    await Share.shareFiles([image.path]); */
  }

  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();

    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'screenshot_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    return result['filePath'];
  }

  Widget myDetailsContainer1() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            child: CircleAvatar(
              radius: 10.0,
              backgroundColor: const Color(0xFF778899),
              backgroundImage: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/User_icon-cp.svg/485px-User_icon-cp.svg.png"),
            ),
          ),
          Container(
            child: Text(
              'User1234 ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xffe6020a),
                  fontSize: 8.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
                child: Text(
              "Deine besten Werte sind: ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xffe6020a),
                  fontSize: 8.0,
                  fontWeight: FontWeight.bold),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
          ),
        ],
      ),
    );
  }

  Widget myDetailsContainer2() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            child: CircleAvatar(
              radius: 10.0,
              backgroundColor: const Color(0xFF778899),
              backgroundImage: NetworkImage(
                  "https://pcdn.sharethis.com/wp-content/uploads/2018/03/FeatureImage-best-time-to-post-on-instagram.jpg"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Container(
              child: Text(
                'Deine Zeit: ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xffe6020a),
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              child: timeValue == null
                  ? Text(
                      'Keine Zeit vorhanden!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xffe6020a),
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold),
                    )
                  : Text(
                      timeValue.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xffe6020a),
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
          ),
        ],
      ),
    );
  }

  void getTime() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    timeValue = pref.getInt('timeData');
    setState(() {});
  }

  Widget myDetailsContainer3() {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            child: CircleAvatar(
              radius: 10.0,
              backgroundColor: const Color(0xFF778899),
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgy0Xl7L0lHlhsCcoOOcvRGHjZU79IqJUahQ&usqp=CAU"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: Text(
                'Deine Moves: ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xffe6020a),
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: moveValue == null
                ? Text(
                    'Keine Moves vorhanden!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xffe6020a),
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold),
                  )
                : Text(
                    moveValue.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xffe6020a),
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
          ),
        ],
      ),
    );
  }

  void getMove() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    moveValue = pref.getInt('moveData');
    setState(() {});
  }


}
