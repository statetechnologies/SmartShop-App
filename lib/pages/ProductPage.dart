import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:smart_shop/services/categoryAPI.dart';
import 'package:smart_shop/services/productAPI.dart';
import 'package:smart_shop/services/theme_service.dart';
import 'package:smart_shop/services/tokenAPI.dart';

import '../constants/theme.dart';
import '../widgets/NavDrawer.dart';
import '../widgets/buttons.dart';
import '../widgets/productTile.dart';
import 'Profile.dart';
import 'login.dart';

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

  String selectedProduct = categoryData[0]['title'].toString();
  var selectValue;

  DropdownButton AndroidPicker() {
    List<DropdownMenuItem<String>> myDrop = [];

    for (int i = 0; i < getTypeLength() - 1; i++) {
      var newItem = DropdownMenuItem<String>(
        child: Text(
          categoryData[i]['title'].toString(),
          style: TextStyle(fontSize: 20),
        ),
        value: categoryData[i]['title'].toString(),
        onTap: () {
          setState(() {
            selectValue = i + 1;
            //TODO: Add a function
          });
        },
      );
      myDrop.add(newItem);
    }

    return DropdownButton<String>(
      underline: Container(
        height: 0,
      ),
      icon: Icon(
        Icons.arrow_drop_down,
        size: 25,
      ),
      value: selectedProduct,
      items: myDrop,
      onChanged: (var value) {
        setState(() {
          selectedProduct = value!;
          //TODO: Add a function
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> myList = [];

    for (int i = 0; i < getTypeLength() - 1; i++) {
      var newText = Text(categoryData[0]['title'].toString());

      myList.add(newText);
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32,
      onSelectedItemChanged: (int value) {
        selectedProduct = categoryData[value]['title'].toString();
        print(categoryData[value]['title'].toString());
      },
      children: myList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  MyNavDrawer(),
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
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  //TODO: add a log out and profile function
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
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()),
                          (route) => false);
                    });
                    // Get.to(() => ProfilePage());
                  }
                });
              },
            ),
          ),
          const SizedBox(
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
                      itemCount: getProductLength(),
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 900),
                          child: FadeInAnimation(
                            child: ProductTiles(
                                index: index,
                                Name: getproductName(index).toString(),
                                price: getPrice(index),
                                quantity: getQuantity(index)),
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
                        height: 15,
                      ),
                      Container(
                        height: 50.0,
                        width: 145,
                        decoration: BoxDecoration(
                          color: context.theme.backgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Center(child: AndroidPicker()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        color: secondary1Dark,
                        label: 'Add',
                        icon: Icons.add,
                        onTap: () async {
                          await _validateProduct();

                          setState(() {
                            prodName.clear();
                            priceName.clear();
                            quantityName.clear();
                            getProducts();
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
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 900),
                          child: FadeInAnimation(
                            child: ProductTiles(
                                index: index,
                                Name: getproductName(index),
                                price: getPrice(index),
                                quantity: getQuantity(index)),
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

  _validateProduct() async {
    if (prodName.text.isNotEmpty &&
        priceName.text.isNotEmpty &&
        quantityName.text.isNotEmpty) {
      await addProduct(
          name: prodName.text.toString(),
          price: priceName.text.toString(),
          category: selectValue.toString(),
          quantity: quantityName.text.toString());
      await getProducts();

      print(selectedProduct);
      print(selectValue);
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
