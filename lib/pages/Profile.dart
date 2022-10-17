import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/services/theme_service.dart';
import '../constants/theme.dart';
import '../widgets/NavDrawer.dart';
import 'homepage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: Container(),
    );
  }

  _appBar(BuildContext context) => AppBar(
        elevation: 2,
        toolbarHeight: 80,
        backgroundColor: Get.isDarkMode ? primary3DarkTiles : primary2Light,
        leading: IconButton(
          onPressed: () {
            Future.delayed(Duration.zero, () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false);
            });

            // Navigator.of(context).pushReplacement(
            // MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 30,
            color: Get.isDarkMode ? primary3NavDark : primary3TextLight,
          ),
        ),
        title: Center(
          child: GestureDetector(
            onTap: () => ThemeServices().changeThemeMode(),
            child: CircleAvatar(
              backgroundColor: Get.isDarkMode ? Colors.black26 : bodyLight,
              child: Icon(
                Get.isDarkMode ? Icons.wb_sunny_sharp : Icons.nightlight_round,
                size: 20.0,
                color: Get.isDarkMode ? Colors.white : Colors.black12,
              ),
            ),
          ),
        ),
        actions: [
          SizedBox(
            width: 80,
          )
        ],
      );
}
