import 'dart:developer';

import 'package:demo/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './pwnedbox.dart';
import './password_legend.dart';
import './all_saved_passwords_title.dart';
import './header_bar_settings_icon.dart';
import 'single_list_item.dart';

var savedDetails = [
  {
    'username': 'someone@example.com',
    'password': '12345678',
    'website': 'Gmail',
    'status': 'healthy'
  },
  {
    'username': 'someone@example.com',
    'password': '12345678',
    'website': 'Steam',
    'status': 'healthy'
  },
  {
    'username': 'someone@example.com',
    'password': '12345678',
    'website': 'Netflix',
    'status': 'reused'
  },
  {
    'username': 'someone@example.com',
    'password': '12345678',
    'website': 'Pinterest',
    'status': 'compromised'
  },
];

/* ----------------------- Homescreen Code starts here ---------------------- */
class Homescreen extends StatelessWidget {
  const Homescreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Onboarding();
    // return const SplashScreen();
    // return const SharePassword();
    // return const AddExistingPassword();
    // return const AddNewPassword();
    // return StartHome();
  }
}

class StartHome extends StatelessWidget {
  const StartHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () => log("FAB Clicked"),
        child: const Icon(Icons.add),
        backgroundColor: Colors.black,
        splashColor: Colors.pink.shade300,
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: LeadingMenuIcon(),
        title: const Text("Kryptonite"),
        titleTextStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w800,
          fontSize: 24,
        ),
        toolbarHeight: 100,
        centerTitle: false,
        actions: const <Widget>[
          HeaderBarSettingsIcon(),
        ],
        actionsIconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PwnedBox(),
          const AllPasswordTitle(),
          const PasswordLegend(),

          // This is just a separator for the listview
          Container(
            height: 20,
          ),

          // This is a widget for containing a single list item.
          const SingleListItem(),
          const SingleListItem(),
          const SingleListItem(),
          const SingleListItem(),
          const SingleListItem(),
          const SingleListItem(),
        ],
      ),
    );
  }
}
