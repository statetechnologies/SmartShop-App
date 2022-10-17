import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/services/theme_service.dart';
import '../constants/theme.dart';
import '../widgets/NavDrawer.dart';
import '../widgets/buttons.dart';
import 'Profile.dart';
import 'package:smart_shop/models/TypeFile.dart';
import 'login.dart';
import 'package:smart_shop/services/tokenAPI.dart';
import 'package:smart_shop/services/categoryAPI.dart';

Data dataFile = Data();

class TypePage extends StatefulWidget {
  const TypePage({Key? key}) : super(key: key);

  @override
  State<TypePage> createState() => _TypePageState();
}

class _TypePageState extends State<TypePage> {
  TextEditingController productController = TextEditingController();
  List<String> _selectAction = ['My Profile', 'Log Out'];
  List<BottomNavigationBarItem> bottomNav = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(
          Icons.merge_type_outlined,
        ),
        label: 'Product Types'),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.add_box_rounded,
      ),
      label: 'Add Product Type',
    )
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: _pageContent(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: subHeadingStyle,
        backgroundColor:
            Get.isDarkMode ? primary3DarkTiles : primary3LightTiles,
        unselectedItemColor: Get.isDarkMode ? null : bodyDark,
        selectedItemColor: Get.isDarkMode ? bodyLight1 : primary2Dark,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        iconSize: 40,
        onTap: _onItemTapped,
        elevation: 4,
        items: bottomNav,
      ),
    );
  }

  _appBar(BuildContext context) => AppBar(
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

  _pageContent(int index) {
    switch (index) {
      case 0:
        return Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
          child: Container(
            height: 220,
            child: PageView.builder(
                controller: PageController(viewportFraction: 0.88),
                itemCount: getTypeLength(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      height: 220,
                      width: MediaQuery.of(context).size.width - 20,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Get.isDarkMode
                              ? primary3DarkTiles
                              : primary3LightTiles),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getCategoryName(index),
                            style: headingStyle.copyWith(fontSize: 32),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        );

      case 1:
        return Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Add Product Type',
                style: headingStyle,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Get.isDarkMode
                        ? primary3Container
                        : primary3LightTiles),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: productController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            label: Text(
                              'Product Type',
                              style: titleStyle,
                            ),
                            hintText: 'Enter product type',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            focusColor: Colors.blueAccent),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        color: secondary1Dark,
                        label: 'Add',
                        icon: Icons.add,
                        onTap: () {
                          setState(() {
                            _validateType();
                            productController.clear();
                            _selectedIndex = 0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );

      default:
        return Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
          child: Container(
            height: 220,
            child: PageView.builder(
                controller: PageController(viewportFraction: 0.88),
                itemCount: dataFile.typeLenght,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      height: 220,
                      width: MediaQuery.of(context).size.width - 20,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.blueGrey),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dataFile.type.elementAt(index).type,
                            style: headingStyle.copyWith(fontSize: 32),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        );
    }
  }

  _validateType() {
    if (productController.text.isNotEmpty) {
      dataFile.addToList(productController.text);
    } else if (productController.text.isEmpty) {
      Get.snackbar('Required', 'All required fields must be filled',
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
          colorText: Colors.red,
          icon: Icon(
            Icons.warning,
            color: Get.isDarkMode ? Colors.red : Colors.yellowAccent,
          ),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
