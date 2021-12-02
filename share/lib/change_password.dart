import 'dart:developer';

import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => log("FAB Clicked"),
        child: const Icon(Icons.check),
        backgroundColor: Colors.black,
        splashColor: Colors.pink.shade300,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(
                        0x112400FF,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.deepPurple.shade400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Change \nPassword",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 32,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    initialValue: "hoa6#Xhhx(ncas",
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "********",
                      hintStyle: TextStyle(color: Colors.black38),
                      labelText: "Current Password",
                      labelStyle: TextStyle(color: Colors.black54),
                      focusColor: Colors.deepPurple,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    initialValue: "hoa6#Xhhx(ncas",
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "********",
                      hintStyle: TextStyle(color: Colors.black38),
                      labelText: "New Password",
                      labelStyle: TextStyle(color: Colors.black54),
                      focusColor: Colors.deepPurple,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    initialValue: "hoa6#Xhhx(ncas",
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "********",
                      hintStyle: TextStyle(color: Colors.black38),
                      labelText: "Confirm New Password",
                      labelStyle: TextStyle(color: Colors.black54),
                      focusColor: Colors.deepPurple,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
