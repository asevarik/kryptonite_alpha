import 'dart:developer';
import 'package:demo/Providers/SavedPasswordProvider.dart';
import 'package:demo/splash_screen.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const KleanlyApp());

class KleanlyApp extends StatelessWidget {
  const KleanlyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(brightness: Brightness.light),
      dark: ThemeData(brightness: Brightness.dark),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MultiProvider(
        providers: [
          //!provider goes here
          ChangeNotifierProvider(create: (_) => SavedPasswordProvider())
        ],
        child: MaterialApp(
          home: SplashPage(),
        ),
      ),
    );
  }
}

/* ------------ The menu icon on the left side of the action bar ------------ */

class LeadingMenuIcon extends StatelessWidget {
  const LeadingMenuIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => IconButton(
        onPressed: () => log("Menu Button Pressed"),
        icon: const Icon(Icons.menu),
        color: Colors.black,
      ),
    );
  }
}

/* ------------------------------ Splash Screen ----------------------------- */


