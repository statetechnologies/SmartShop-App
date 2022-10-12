import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/constants/theme.dart';
import 'package:smart_shop/pages/login.dart';
import 'package:smart_shop/services/theme_service.dart';
import 'package:smart_shop/widgets/tiles.dart';
import 'package:smart_shop/widgets/productTile.dart';
import '../widgets/NavDrawer.dart';
import 'Profile.dart';
import 'package:smart_shop/models/ProductsFile.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

Data dataFile = Data();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _selectAction = ['My Profile', 'Log Out'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 30.0, 0, 5),
            child: Text(
              'Info',
              style: headingStyle,
            ),
          ),
          Tiles(
              icon: Icons.bar_chart_rounded,
              Iconcolor: blueIcon,
              label: 'Total Sales',
              value: 10000.00,
              currency: 'Tsh'),
          SizedBox(
            height: 10,
          ),
          Tiles(
              icon: Icons.insert_drive_file_outlined,
              Iconcolor: svn,
              label: 'Available Products',
              value: 10000.00,
              currency: 'Tsh'),
          SizedBox(
            height: 10,
          ),
          Tiles(
              icon: Icons.insert_drive_file_outlined,
              Iconcolor: icon3,
              label: 'Types of Available Products',
              value: 10000.00,
              currency: 'Tsh'),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 30.0, 0, 5),
            child: Text(
              'Our products',
              style: headingStyle,
            ),
          ),
          Expanded(
            child: AnimationLimiter(
              child: ListView.builder(
                  itemCount: dataFile.productLenght,
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 900),
                      child: FadeInAnimation(
                        child: ProductTiles(
                            index: index,
                            Name: dataFile.product.elementAt(index).Productname,
                            price:
                                dataFile.product.elementAt(index).Productprice,
                            quantity:
                                dataFile.product.elementAt(index).quantity),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  _appBar() => AppBar(
        toolbarHeight: 110,
        elevation: 2,
        backgroundColor: Get.isDarkMode ? primary3DarkTiles : primary2Light,
        title: Center(
          child: GestureDetector(
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
                  Get.to(() => LoginPage());
                } else if (value == 'My Profile') {
                  Get.to(() => ProfilePage());
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
