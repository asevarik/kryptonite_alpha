import 'dart:developer';

import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    bool? _checked = true;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                GestureDetector(
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
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Create\nAccount",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 32,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              obscureText: true,
              initialValue: "example@email.com",
              decoration: const InputDecoration(
                hintText: "email@example.com",
                hintStyle: TextStyle(color: Colors.black38),
                labelText: "Email",
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
              obscureText: true,
              initialValue: "hoa6#Xhhx(ncas",
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
          const SizedBox(
            height: 30,
          ),
          CheckboxListTile(
            value: _checked,
            title: const Text(
                "I agree to the terms and conditions \nand the Privacy policy."),
            onChanged: (bool? value) {
              setState(
                () {
                  _checked = value;
                },
              );
            },
            activeColor: Colors.deepPurple.shade300,
            controlAffinity: ListTileControlAffinity.leading,
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              child: const Text("Create Account"),
              onPressed: () => log("Create Account Pressed"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(15),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              child: const Text("Sign up with Google"),
              onPressed: () => log("Sign up with Google Pressed"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(15),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
            child: GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Already Have an account? Log in instead"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
