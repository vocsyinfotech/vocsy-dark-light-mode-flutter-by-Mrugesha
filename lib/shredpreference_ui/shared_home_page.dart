import 'package:apptheme/constant.dart';
import 'package:apptheme/database_services/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';

import '../shared_pref_service.dart';

class SharedPreferenceHomePage extends StatefulWidget {
  const SharedPreferenceHomePage({Key? key}) : super(key: key);

  @override
  State<SharedPreferenceHomePage> createState() => _SharedPreferenceHomePageState();
}

class _SharedPreferenceHomePageState extends State<SharedPreferenceHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: comboScaffoldBackGround(),
      body: SizedBox(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Column(
              children: [
                Text('Shared Preference Light and Dark Mode Demo',style: TextStyle(color: comboRedAndPink(),fontSize: 25,fontWeight: FontWeight.w500),),
                IconButton(
                  onPressed: () async {
                    await SharedPrefService()
                        .getBool("isDark")
                        .then((value) async {
                      await SharedPrefService()
                          .setBool(
                          value == false ? true : false, 'isDark')
                          .whenComplete(() async {
                        value = !value;
                        mode = value;
                        print(
                            "Between ${await SharedPrefService().getBool("isDark")}");
                        Phoenix.rebirth(context);
                      });
                      Get.changeTheme(
                        value == false ? SharedPreferenceThemeStorage.light : SharedPreferenceThemeStorage.dark,
                      );
                    });
                  },
                  iconSize: 30,
                  color: comboRedAndPink(),
                  // tooltip: mode == false? 'Light Theme' : 'Dark Theme',
                  icon: mode == false
                      ? Icon(
                    Icons.nightlight_round,
                    color: comboBlackAndWhite()
                  )
                      : Icon(
                    Icons.light_mode_rounded,
                    color: comboBlackAndWhite()
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
