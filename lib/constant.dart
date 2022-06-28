import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'database_services/getx_theme_storage.dart';

bool mode = false;




RxBool modes = false.obs;






GetStorage themeDataBox = GetStorage();


const Color redColor = Color(0xffff0404);
const Color pinkColor =   Color(0xfff604f2);
const Color blackColor =   Color(0xff000000);
const Color whiteColor =   Color(0xffffffff);
const Color kLightThemeBackGroundColor =   Color(0xffa0f69e);
const Color kDarkThemeBackGroungColor =   Color(0xff021d4e);














Color comboRedAndPink() {
  return mode == false ? redColor : pinkColor;
}



Color comboBlackAndWhite() {
  return mode == false ? blackColor : whiteColor;
}



Color comboScaffoldBackGround(){
  return mode == false ? kLightThemeBackGroundColor : kDarkThemeBackGroungColor;
}


Color getXComboRedAndPink() {
  // print('mode value==${modes.value}');
  return modes.value == false ? redColor : pinkColor;
}


Color getXComboBlackAndWhite() {
  return modes.value == false ? blackColor : whiteColor;
}

Color getXComboScaffoldBackGround(){
  return modes.value == false ? kLightThemeBackGroundColor : kDarkThemeBackGroungColor;
}




changeTheme(context){

  GetXThemeStorage().loadThemeFromBox().then((value){
    themeDataBox
        .write('isDark', value == false ? true : false);
    modes.value = themeDataBox.read('isDark');

    Get.changeTheme(
      value == false
          ? GetXThemeStorage.light
          : GetXThemeStorage.dark,
    );
    Phoenix.rebirth(context);
    Get.reset();
  });
}