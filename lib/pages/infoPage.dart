import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/reusables.dart';
import '../constants/theme.dart';
import '../services/theme_service.dart';
import '../services/tokenAPI.dart';
import '../widgets/NavDrawer.dart';
import 'Profile.dart';
import 'login.dart';


class Infopage extends StatefulWidget {
  const Infopage({Key? key}) : super(key: key);

  @override
  State<Infopage> createState() => _InfopageState();
}

class _InfopageState extends State<Infopage> {

  List<String> _selectAction = ['My Profile', 'Log Out'];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: MyNavDrawer(),
      appBar: _appBar(context),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SizedBox(
          child:Padding(
            padding:  EdgeInsets.all(12.0),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding:  EdgeInsets.all(5.0),
                child: ListView(
                  children: [
                    Text(infoText.toString(),style: TextStyle(fontSize: 15),),
                    SizedBox(height: 3,),
                    Text('Features ', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,),),
                    SizedBox(height: 1.5,),
                    Text(featuresText.toString(),style: TextStyle(fontSize: 15),),
                    SizedBox(height: 3,),
                    Text('Benefits ', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,),),
                    SizedBox(height: 1.5,),
                    Text('1. Increased Efficiency: The app streamlines inventory and sales operations, reducing the time and effort required to manage these processes manually.\n'
                        '2. Improved Accuracy: The app reduces the risk of errors that can occur when managing inventory and sales manually.\n'
                        '3. Better Decision-making: The app provides real-time data and insights that enable businesses to make informed decisions about their inventory and sales operations.\n'
                        '4. Cost Savings: The app helps businesses to optimize their inventory levels, reducing the cost of carrying excess inventory and minimizing the risk of stockouts.\n'
                        '5. Scalability: The app can be used by businesses of all sizes, making it easy to scale as the business grows.\n',style: TextStyle(fontSize: 15),),
                    SizedBox(height: 3,),
                    Text(conlusionText.toString(),style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  _appBar(BuildContext context) => AppBar(
    centerTitle: true,
    toolbarHeight: 75,
    elevation: 2,
    backgroundColor: Get.isDarkMode ? primary3DarkTiles : primary2Light,
    title: GestureDetector(
      onTap: () => ThemeServices().changeThemeMode(),
      child: CircleAvatar(
        radius: 25,
        backgroundColor: Get.isDarkMode ? Colors.black26 : bodyLight,
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_sharp : Icons.nightlight_round,
          size: 20.0,
          color: Get.isDarkMode ? Colors.white : Colors.black12,
        ),
      ),
    ),
    actions: [
      Center(
        child: DropdownButton(
          underline: Container(
            height: 0,
            width: 0,
          ),
          icon: CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage('images/profile.png'),
          ),
          elevation: 8,
          style: subTitleStyle,
          items:
          _selectAction.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              child: Text(value),
              value: value,
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              //TODO: add a log out and profile function
            });
            if (value == 'Log Out') {
              Future.delayed(Duration.zero, () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                        (route) => false);
              });

              //  Get.to(() => LoginPage());
              session.clear();
            } else if (value == 'My Profile') {
              Future.delayed(Duration.zero, () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                        (route) => false);
              });
              // Get.to(() => ProfilePage());
            }
          },
        ),
      ),
      SizedBox(
        width: 20,
      )
    ],
  );
}
