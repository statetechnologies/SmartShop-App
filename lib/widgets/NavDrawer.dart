import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/constants/theme.dart';
import 'package:smart_shop/pages/infoPage.dart';
import '../pages/ProductPage.dart';
import '../pages/SalesPage.dart';
import '../pages/TypePage.dart';
import '../pages/homepage.dart';
import 'package:smart_shop/services/tokenAPI.dart';

class MyNavDrawer extends StatelessWidget {

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
                session.first.username,
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
              onTap: () => Future.delayed(Duration.zero, () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false);
              }),
            ),
            ListTile(
              leading: Icon(Icons.shop, color: primary3LightMode),
              title: Text(
                'Products',
                style: headingNavStyle,
              ),
              onTap: () => Future.delayed(Duration.zero, () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => ProductPage()),
                    (route) => false);
              }),
            ),
            ListTile(
              leading: Icon(Icons.type_specimen, color: primary3LightMode),
              title: Text(
                'Type',
                style: headingNavStyle,
              ),
              onTap: () => Future.delayed(Duration.zero, () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => TypePage()),
                    (route) => false);
              }),
            ),
            ListTile(
              leading: Icon(Icons.money, color: primary3LightMode),
              title: Text(
                'Sales',
                style: headingNavStyle,
              ),
              onTap: () => Future.delayed(Duration.zero, () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => SalesPage()),
                    (route) => false);
              }),
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
                Future.delayed(Duration.zero, () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Infopage()),
                          (route) => false);
                });
                //            Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
}
