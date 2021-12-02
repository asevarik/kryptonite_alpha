// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:demo/add_existing.dart';
import 'package:demo/add_new_password.dart';
import 'package:animated_floating_buttons/animated_floating_buttons.dart';
import 'package:demo/single_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import './pwnedbox.dart';
import './password_legend.dart';
import './all_saved_passwords_title.dart';
import './header_bar_settings_icon.dart';

class Password {
  String userName = "";
  String passWord = "";
  String websiteName = "";
  String status = "";

  Password(
      {required this.userName,
      required this.passWord,
      required this.status,
      required this.websiteName});
}

final GlobalKey<AnimatedFloatingActionButtonState> key =
    GlobalKey<AnimatedFloatingActionButtonState>();

/* ----------------------- Homescreen Code starts here ---------------------- */
class Homescreen extends StatefulWidget {
  Homescreen({
    Key? key,
  }) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    // return ManageSync();
    // return const ChangePassword();
    // return const SettingsScreen();
    // return const SignupScreen();
    // return const LoginScreen();
    // return const Onboarding();
    // return const SplashScreen();
    // return const SharePassword();
    // return const AddExistingPassword();
    // return const AddNewPassword();
    return const StartHome();
  }
}

class StartHome extends StatefulWidget {
  const StartHome({
    Key? key,
  }) : super(key: key);

  @override
  State<StartHome> createState() => _StartHomeState();
}

class _StartHomeState extends State<StartHome> {
  static List<Password> savedPasswd = [
    Password(
      userName: "username@gmail.com",
      passWord: "gmailPassword1234",
      websiteName: "Gmail",
      status: "compromised",
    ),
    Password(
      userName: "netflixUser@gmail.com",
      passWord: "Netflix_sbka_baap",
      websiteName: "Netflix",
      status: "reused",
    ),
    Password(
      userName: "theManCalledSting",
      passWord: "wooooo1234",
      websiteName: "Steam",
      status: "healthy",
    ),
    Password(
      userName: "lord_stevens_jobs@apple.com",
      passWord: "I_hate_android!",
      websiteName: "Apple ID",
      status: "healthy",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      floatingActionButton: AnimatedFloatingActionButton(
        //Fab list
        fabButtons: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 15),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddNewPassword(),
                  ),
                );
              },
              child: const Icon(Icons.fiber_new),
              heroTag: "btn1",
              backgroundColor: Colors.purple,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 15),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AddExistingPassword(passwordObject: savedPasswd),
                  ),
                );
              },
              child: const Icon(Icons.add),
              heroTag: "btn2",
              backgroundColor: Colors.deepPurple,
            ),
          ),
        ],
        key: key,
        colorStartAnimation: Colors.black,
        colorEndAnimation: Colors.pink,
        animatedIconData: AnimatedIcons.menu_close,
      ),

      // ),
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
        children: [
          const PwnedBox(),
          const AllPasswordTitle(),
          const PasswordLegend(),
          Container(
            height: 20,
          ),
          Column(
            children: <Widget>[
              for (var item in savedPasswd)
                SingleListItem(
                  passwordItem: item,
                ),
            ],
          ),
          // const SingleListItem(),
        ],
      ),
    );
  }
}
