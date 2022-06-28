import 'package:apptheme/constant.dart';
import 'package:apptheme/database_services/getx_theme_storage.dart';
import 'package:apptheme/database_services/shared_preference.dart';
import 'package:apptheme/getx_ui/getx_home_page.dart';
import 'package:apptheme/shredpreference_ui/shared_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';

void main() {

    GetXThemeStorage().loadThemeFromBox();

  /*if (mode == false) {
    SharedPreferenceThemeStorage().loadThemeFromBox();
  }*/

  runApp(Phoenix(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Theme Mode Demo',
      themeMode: modes.value  == false ? ThemeMode.light :ThemeMode.dark,
      home: const GetXHomePage(),
    );
      /*MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: mode == false ? ThemeMode.light : ThemeMode.dark,
      home: const SharedPreferenceHomePage(),
    );*/
  }
}

