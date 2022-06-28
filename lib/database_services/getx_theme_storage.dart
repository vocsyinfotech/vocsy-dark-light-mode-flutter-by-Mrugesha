import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';

class GetXThemeStorage {

  static final light = ThemeData.light().copyWith(
    backgroundColor: kLightThemeBackGroundColor,
  );
  static final dark =
      ThemeData.dark().copyWith(backgroundColor: kDarkThemeBackGroungColor);

  ThemeMode get theme =>
      loadThemeFromBox() != null ? ThemeMode.dark : ThemeMode.light;



  Future<bool> loadThemeFromBox  () async {
    if(themeDataBox.read("isDark") == null){
      modes.value = false;
    }else{
      modes.value=themeDataBox.read("isDark");
    }
    print('get kr value ${themeDataBox.read("isDark")}');
    print('get kr value ${modes.value}');
    return modes.value;
  }


  _saveThemeToBox(Future<bool> isDarkMode) async {
    bool isCheck = await isDarkMode;
    themeDataBox.write('isDark', isCheck);
  }


  void switchTheme() {
    Get.changeThemeMode(
        loadThemeFromBox() != null ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(loadThemeFromBox());
  }
}
