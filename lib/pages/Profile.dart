import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/services/theme_service.dart';
import '../constants/theme.dart';
import '../widgets/NavDrawer.dart';
import 'homepage.dart';
import 'package:smart_shop/services/userAPI.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController FnameController = TextEditingController();
  TextEditingController LnameController = TextEditingController();
  bool userRead = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: TextFormField(
              readOnly: userRead,
              controller: FnameController,
              decoration: InputDecoration(
                labelText: 'First Name',
                hintText: getFname(),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                focusColor: Colors.blueAccent,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: TextFormField(
              readOnly: userRead,
              controller: LnameController,
              decoration: InputDecoration(
                labelText: 'Last Name',
                hintText: getLname(),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                focusColor: Colors.blueAccent,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: TextFormField(
              readOnly: userRead,
              controller: usernameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: getUserName(),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                focusColor: Colors.blueAccent,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: TextFormField(
              readOnly: userRead,
              controller: mailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail),
                hintText: getEmail(),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                focusColor: Colors.blueAccent,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Spacer()
        ],
      ),
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
