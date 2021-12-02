import 'package:demo/homescreen.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: const Image(
        image: AssetImage("images/logo.png"),
      ),
      logoSize: 200,
      backgroundColor: Colors.deepPurple.shade100,
      navigator: Homescreen(),
      durationInSeconds: 2,
    );
  }
}
