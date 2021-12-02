import 'dart:developer';

import 'package:flutter/material.dart';

class AddNewPassword extends StatefulWidget {
  const AddNewPassword({Key? key}) : super(key: key);

  @override
  State<AddNewPassword> createState() => _AddNewPasswordState();
}

class _AddNewPasswordState extends State<AddNewPassword> {
  @override
  Widget build(BuildContext context) {
    bool? _checked = false;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => log("message"),
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
              "Generate \nNew Password",
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
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

          // Customize Password
          const Padding(
            padding:
                EdgeInsets.only(top: 15.0, left: 15, right: 15, bottom: 20),
            child: Text(
              "Customize the password",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          CheckboxListTile(
            value: _checked,
            title: const Text("Uppercase Characters"),
            onChanged: (bool? value) {
              setState(
                () {
                  _checked = value;
                },
              );
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            value: _checked,
            title: const Text("Lowercase Characters"),
            onChanged: (bool? value) {
              setState(
                () {
                  _checked = value;
                },
              );
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            value: _checked,
            title: const Text("Underscore Characters"),
            onChanged: (bool? value) {
              setState(
                () {
                  _checked = value;
                },
              );
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            value: _checked,
            title: const Text("Special Characters"),
            onChanged: (bool? value) {
              setState(
                () {
                  _checked = value;
                },
              );
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ],
      ),
    );
  }
}
