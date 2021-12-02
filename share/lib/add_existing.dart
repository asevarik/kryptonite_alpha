import 'dart:developer';

import 'package:flutter/material.dart';

class AddExistingPassword extends StatefulWidget {
  var passwordObject;

  AddExistingPassword({Key? key, required this.passwordObject})
      : super(key: key);

  @override
  State<AddExistingPassword> createState() => _AddExistingPasswordState();
}

class _AddExistingPasswordState extends State<AddExistingPassword> {
  final usernameTextFieldContoller = TextEditingController();
  final websiteTextFieldContoller = TextEditingController();
  final passwordTextFieldContoller = TextEditingController();

  @override
  void dispose() {
    usernameTextFieldContoller.dispose();
    websiteTextFieldContoller.dispose();
    passwordTextFieldContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => log("clicked"),
        // onPressed: () => log(
        //   "${usernameTextFieldContoller.text}\n ${websiteTextFieldContoller.text}\n ${passwordTextFieldContoller.text}\n",
        // ),
        child: const Icon(Icons.check),
        backgroundColor: Colors.black,
        splashColor: Colors.deepPurple,
      ),
      body: ListView(
        children: [
          // Action Buttons
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
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.deepPurple.shade400,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(
                        0x112400FF,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "Clear",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Heading
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Add Existing\nPassword",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          // Input Fields

          const Padding(
            padding: EdgeInsets.only(top: 15.0, left: 15, right: 15),
            child: Text(
              "Please enter the following details below:",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      controller: websiteTextFieldContoller,
                      decoration: const InputDecoration(
                        hintText: "E.g. SquareSpace",
                        hintStyle: TextStyle(color: Colors.black38),
                        labelText: "Nickname",
                        labelStyle: TextStyle(color: Colors.black54),
                        focusColor: Colors.deepPurple,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      validator: (text) {
                        if (text!.isEmpty || text == null) {
                          return "Please enter some term";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      controller: usernameTextFieldContoller,
                      decoration: const InputDecoration(
                        hintText: "email@example.com",
                        hintStyle: TextStyle(color: Colors.black38),
                        labelText: "Username/Email",
                        labelStyle: TextStyle(color: Colors.black54),
                        focusColor: Colors.deepPurple,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      validator: (text) {
                        if (text!.isEmpty || text == null) {
                          return "Please enter some term";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      controller: passwordTextFieldContoller,
                      decoration: const InputDecoration(
                        hintText: "********",
                        hintStyle: TextStyle(color: Colors.black38),
                        labelText: "Password",
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
          ),
        ],
      ),
    );
  }
}
