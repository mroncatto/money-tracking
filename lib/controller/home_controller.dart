
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  static HomeController instance = HomeController();

  bool isDarkTheme = false;
  changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}