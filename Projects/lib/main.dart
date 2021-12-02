import 'dart:developer';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import './homescreen.dart';

void main() => runApp(const KleanlyApp());

class KleanlyApp extends StatelessWidget {
  const KleanlyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(brightness: Brightness.light),
      dark: ThemeData(brightness: Brightness.dark),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => const MaterialApp(
        home: Homescreen(),
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

/* ------------------------- Some useless reminders ------------------------- */
// Add the profile avatar circle
// Change the background color to white
// Try to use a custom icon for menu button.