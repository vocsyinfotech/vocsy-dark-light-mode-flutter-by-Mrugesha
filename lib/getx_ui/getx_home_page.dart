import 'package:apptheme/database_services/getx_theme_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';

import '../constant.dart';

class GetXHomePage extends StatelessWidget {
  const GetXHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getXComboScaffoldBackGround(),
      body: SizedBox(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 180),
            child: Column(
              children: [
                Text(
                  'GetX Light and Dark Mode Demo',
                  style: TextStyle(
                      color: getXComboRedAndPink(),
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 50,),
                Obx(() {
                  return IconButton(
                    onPressed: (){

                      changeTheme(context);

                    },
                    iconSize: 30,
                    color: getXComboRedAndPink(),
                    // tooltip: mode == false? 'Light Theme' : 'Dark Theme',
                    icon: modes.value == false
                        ? Icon(
                        Icons.nightlight_round, color: getXComboBlackAndWhite())
                        : Icon(
                        Icons.light_mode_rounded, color: getXComboBlackAndWhite()),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
