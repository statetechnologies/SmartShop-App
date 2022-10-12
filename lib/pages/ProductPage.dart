import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/services/theme_service.dart';
import '../constants/theme.dart';
import '../widgets/NavDrawer.dart';
import '../widgets/buttons.dart';
import '../widgets/productTile.dart';
import 'Profile.dart';
import 'package:smart_shop/models/ProductsFile.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'login.dart';

Data dataFile = Data();

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final TextEditingController prodName = TextEditingController();
  final TextEditingController quantityName = TextEditingController();
  final TextEditingController priceName = TextEditingController();
  List<String> _selectAction = ['My Profile', 'Log Out'];
  List<BottomNavigationBarItem> bottomNav = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(
          Icons.list_alt_outlined,
        ),
        label: 'List'),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.add_chart,
      ),
      label: 'Add Product',
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
      appBar: _appBar(),
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

  _pageContent(int index) {
    switch (index) {
      case 0:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 160,
            ),
            Center(
              child: Text(
                'Your Product List',
                style: headingStyle.copyWith(fontSize: 32),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
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
                                Name: dataFile.product
                                    .elementAt(index)
                                    .Productname,
                                price: dataFile.product
                                    .elementAt(index)
                                    .Productprice,
                                quantity:
                                    dataFile.product.elementAt(index).quantity),
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        );

      case 1:
        return Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Add Product',
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
                        controller: prodName,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            label: Text(
                              'Product Name',
                              style: titleStyle,
                            ),
                            hintText: 'Product Name',
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
                      TextFormField(
                        controller: priceName,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            label: Text(
                              'Product Price',
                              style: titleStyle,
                            ),
                            hintText: 'Price',
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
                      TextFormField(
                        controller: quantityName,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            label: Text(
                              'Quantity',
                              style: titleStyle,
                            ),
                            hintText: 'Quantity',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            focusColor: Colors.blueAccent),
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
                            _validateProduct();
                            prodName.clear();
                            priceName.clear();
                            quantityName.clear();
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
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 160,
            ),
            Center(
              child: Text(
                'Your Product List',
                style: headingStyle.copyWith(fontSize: 32),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
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
                                Name: dataFile.product
                                    .elementAt(index)
                                    .Productname,
                                price: dataFile.product
                                    .elementAt(index)
                                    .Productprice,
                                quantity:
                                    dataFile.product.elementAt(index).quantity),
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        );
    }
  }

  _validateProduct() {
    if (prodName.text.isNotEmpty &&
        priceName.text.isNotEmpty &&
        quantityName.text.isNotEmpty) {
      dataFile.addToList(prodName.text, double.parse(priceName.text),
          int.parse(quantityName.text));
    } else if (prodName.text.isEmpty ||
        priceName.text.isEmpty ||
        quantityName.text.isEmpty) {
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
