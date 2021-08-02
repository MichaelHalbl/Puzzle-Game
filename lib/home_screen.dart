import 'package:firstapp_app/spielfeld_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepOrangeAccent,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "The",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        fontSize: 65,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2.0
                          ..color = Colors.black,
                      ),
                    ),
                    Text(
                      "Number",
                      style: TextStyle(
                        fontFamily: "Manrope",
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        fontSize: 65,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2.0
                          ..color = Colors.black,
                      ),
                    ),
                    Text(
                      "Puzzle",
                      style: TextStyle(
                        fontFamily: "Manrope",
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        fontSize: 65,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2.0
                          ..color = Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    circButton(FontAwesomeIcons.info, spielfeld(), context),
                    circButton(
                        FontAwesomeIcons.lightbulb, spielfeld(), context),
                    circButton(FontAwesomeIcons.cog, spielfeld(), context),
                  ],
                ),
                Column(
                  //runSpacing: 16,
                  children: [
                    modeButton(
                        spielfeld(),
                        context,
                        "Einfach",
                        "elevate your level",
                        FontAwesomeIcons.feather,
                        Color(0xFF259E00),
                        width: MediaQuery.of(context).size.width - 80),
                    modeButton(spielfeld(),
                        context,
                        "Mittel",
                        "getting better",
                        FontAwesomeIcons.userClock,
                        Color(0xF5AAA600),
                        width: MediaQuery.of(context).size.width - 80),
                    modeButton(
                        spielfeld(),
                        context,
                        "Schwer",
                        "this is really hard",
                        FontAwesomeIcons.weightHanging,
                        Color(0xFFA30000),
                        width: MediaQuery.of(context).size.width - 80),
                    modeButton(
                      spielfeld(),
                      context,
                      "Rangliste",
                      "the Best of the best",
                      FontAwesomeIcons.listOl,
                      Color(0xFF2F80ED),
                      width: MediaQuery.of(context).size.width - 80,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding circButton(IconData icon, Widget screen, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: RawMaterialButton(
          onPressed: () {
            print("open");
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => screen));
          },
          fillColor: Colors.lightBlue,
          shape: CircleBorder(),
          constraints: BoxConstraints(minHeight: 35, minWidth: 35),
          child: FaIcon(icon, size: 22, color: Color(0xFF2F3041)),
        ));
  }

  Widget modeButton(Widget screen, BuildContext context, String title,
      String subtitle, IconData icon, Color color,
      {double width}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RawMaterialButton(
        onPressed: () {
          print("open");
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular((16))),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        fontFamily: "Manrope",
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                          fontFamily: "Manrope",
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                child: FaIcon(icon, size: 35, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
