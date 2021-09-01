import 'package:firstapp_app/home_screen_Easy.dart';
import 'package:firstapp_app/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  bool mainMenuIsActiv = false;
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: MyThemes.lighTheme,
      darkTheme: MyThemes.darkTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
