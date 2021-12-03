import 'package:demo/Modals/Password.dart';
import 'package:flutter/foundation.dart';

class SavedPasswordProvider with ChangeNotifier {
  //Initial values of provider goes here
  List<Password> savedPasswords = [
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
  //getter method
  List<Password> get getSavedPasswords => savedPasswords;

  void addPassword(String websitename, String email, String password) {
    savedPasswords.add(Password(
        userName: email,
        passWord: password,
        status: "green",
        websiteName: websitename));
    notifyListeners();
  }
}
