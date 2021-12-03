import 'package:demo/Providers/SavedPasswordProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewPassword extends StatefulWidget {
  const AddNewPassword({Key? key}) : super(key: key);

  @override
  State<AddNewPassword> createState() => _AddNewPasswordState();
}

class _AddNewPasswordState extends State<AddNewPassword> {
  TextEditingController _webSiteNameController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final FocusNode _webSiteFocusNode = FocusNode();
  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _floatingFocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    _webSiteFocusNode.dispose();
    _passwordFocusNode.dispose();
    _floatingFocusNode.dispose();
    _userNameFocusNode.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    _webSiteNameController.dispose();
    super.dispose();
  }

  bool? _isUpperCase = false;
  bool? _isLowerCase = false;
  bool? _isSpecialCase = false;
  bool? _isUnderCase = false;
  @override
  Widget build(BuildContext context) {
    final savedPasswordProvider = Provider.of<SavedPasswordProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final isValid = _formkey.currentState!.validate();
          if (isValid) {
            savedPasswordProvider.addPassword(_webSiteNameController.text,
                _userNameController.text, _passwordController.text);
            Navigator.of(context).pop();
          }
        },
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
                  //TODO add ontap which clears all
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
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      key: ValueKey("websitename"),
                      focusNode: _webSiteFocusNode,
                      controller: _webSiteNameController,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_userNameFocusNode),
                      keyboardType: TextInputType.emailAddress,
                      // onEditingComplete
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
                      key: ValueKey("username"),
                      controller: _userNameController,
                      focusNode: _userNameFocusNode,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_passwordFocusNode),
                      keyboardType: TextInputType.emailAddress,
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
                      key: ValueKey("password"),
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_floatingFocusNode),
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      validator: (String? value) {
                        if (_isUpperCase == true) {
                          if (!value!.contains(RegExp(r'[A-Z]'))) {
                            return "Upper case character not present";
                          } else {
                            return null;
                          }
                        }
                        if (_isLowerCase == true) {
                          if (!value!.contains(RegExp(r'[a-z]'))) {
                            return "Lower case character not present";
                          } else {
                            return null;
                          }
                        }
                        if (_isSpecialCase == true) {
                          if (!value!.contains(RegExp(r'[^A-Za-z0-9]'))) {
                            return "Spe case character not present";
                          } else {
                            return null;
                          }
                        }
                        if (_isUnderCase == true) {
                          if (!value!.contains(RegExp(r'_'))) {
                            return "under case character not present";
                          } else {
                            return null;
                          }
                        }
                      },
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
            value: _isUpperCase,
            title: const Text("Uppercase Characters"),
            onChanged: (bool? value) {
              setState(
                () {
                  print(value);
                  _isUpperCase = value;
                },
              );
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            value: _isLowerCase,
            title: const Text("Lowercase Characters"),
            onChanged: (bool? value) {
              setState(
                () {
                  _isLowerCase = value;
                },
              );
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            value: _isUnderCase,
            title: const Text("Underscore Characters"),
            onChanged: (bool? value) {
              setState(
                () {
                  _isUnderCase = value;
                },
              );
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            value: _isSpecialCase,
            title: const Text("Special Characters"),
            onChanged: (bool? value) {
              setState(
                () {
                  _isSpecialCase = value;
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
