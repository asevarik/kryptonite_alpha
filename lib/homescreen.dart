import 'package:demo/Modals/Password.dart';
import 'package:demo/Providers/SavedPasswordProvider.dart';
import 'package:demo/add_existing.dart';
import 'package:demo/add_new_password.dart';
import 'package:animated_floating_buttons/animated_floating_buttons.dart';
import 'package:demo/single_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

import './pwnedbox.dart';
import './password_legend.dart';
import './all_saved_passwords_title.dart';
import './header_bar_settings_icon.dart';

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
    
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final savedPasswordProvider = Provider.of<SavedPasswordProvider>(context);
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
      body: Column(
        children: [
          const PwnedBox(),
          const AllPasswordTitle(),
          const PasswordLegend(),
          Container(
            height: 20,
          ),
          Container(
            height: size.height / 2.5,
            child: ListView.builder(
                itemCount: savedPasswordProvider.getSavedPasswords.length,
                itemBuilder: (BuildContext context, int count) {
                  return ChangeNotifierProvider.value(
                    value: savedPasswordProvider,
                    child: SingleListItem(
                      passwordItem:
                          savedPasswordProvider.getSavedPasswords[count],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
