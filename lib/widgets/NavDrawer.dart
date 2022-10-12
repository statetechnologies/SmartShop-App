import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/constants/theme.dart';

import '../pages/ProductPage.dart';
import '../pages/SalesPage.dart';
import '../pages/TypePage.dart';
import '../pages/homepage.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 8,
      backgroundColor: Get.isDarkMode ? primary3DarkMode : primary2,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [buildHeader(context), buildMenuItem(context)],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
        decoration: BoxDecoration(
            color: Get.isDarkMode ? primary3Container : bodyLight1,
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Smart Shop',
                style: headingStyle.copyWith(color: Colors.white),
              ),
              Text('Dashboard'),
              SizedBox(
                height: 30,
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('images/profile.png'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Username',
                style: subNavHeadingStyle.copyWith(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      );
  Widget buildMenuItem(BuildContext context) => Container(
        padding: EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: Icon(Icons.home_outlined, color: primary3LightMode),
              title: Text(
                'Home',
                style: headingNavStyle,
              ),
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage())),
            ),
            ListTile(
              leading: Icon(Icons.shop, color: primary3LightMode),
              title: Text(
                'Products',
                style: headingNavStyle,
              ),
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ProductPage())),
            ),
            ListTile(
              leading: Icon(Icons.type_specimen, color: primary3LightMode),
              title: Text(
                'Type',
                style: headingNavStyle,
              ),
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => TypePage())),
            ),
            ListTile(
              leading: Icon(Icons.money, color: primary3LightMode),
              title: Text(
                'Sales',
                style: headingNavStyle,
              ),
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SalesPage())),
            ),
            Divider(
              color: Get.isDarkMode ? one : Colors.black,
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: primary3LightMode,
              ),
              title: Text(
                'Info',
                style: headingNavStyle,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
}
