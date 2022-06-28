import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';

class SharedPreferenceThemeStorage {
  static final light = ThemeData.light().copyWith(
    backgroundColor: kLightThemeBackGroundColor,
  );
  static final dark =
      ThemeData.dark().copyWith(backgroundColor: kDarkThemeBackGroungColor);

  ThemeMode get theme =>
      loadThemeFromBox() != null ? ThemeMode.dark : ThemeMode.light;

  Future<bool> loadThemeFromBox() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    mode = (prefs.getBool("isDark") == null ? false : prefs.getBool("isDark"))!;
    return mode;
  }

  _saveThemeToBox(Future<bool> isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isCheck = await isDarkMode;
    prefs.setBool('isDark', isCheck);
  }

  void switchTheme() {
    Get.changeThemeMode(
        loadThemeFromBox() != null ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(loadThemeFromBox());
  }
}
