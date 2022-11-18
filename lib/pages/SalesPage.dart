import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/services/salesAPI.dart';
import 'package:smart_shop/services/theme_service.dart';
import '../constants/theme.dart';
import '../services/productAPI.dart';
import '../widgets/NavDrawer.dart';
import '../widgets/buttons.dart';
import '../widgets/salesTile.dart';
import 'Profile.dart';
import 'package:smart_shop/models/SalesFile.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:smart_shop/services/tokenAPI.dart';
import 'login.dart';

Data dataFile = Data();

class SalesPage extends StatefulWidget {
  const SalesPage({Key? key}) : super(key: key);

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  List<String> _selectAction = ['My Profile', 'Log Out'];

  String selectedProduct = productData[0]['name'].toString();
  var selectValue;

  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  List<BottomNavigationBarItem> bottomNav = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(
          Icons.view_list,
        ),
        label: 'List of Sales'),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sell_rounded,
      ),
      label: 'Sell',
    )
  ];

  DropdownButton AndroidPicker() {
    List<DropdownMenuItem<String>> myDrop = [];

    for (int i = 0; i < getProductLength() - 1; i++) {
      var newItem = DropdownMenuItem<String>(
        child: Text(
          productData[i]['name'].toString(),
          style: TextStyle(fontSize: 20),
        ),
        value: productData[i]['name'].toString(),
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
          // selectedCurrency = value!;
          //TODO: Add a function
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> myList = [];

    for (int i = 0; i < getProductLength() - 1; i++) {
      var newText = Text(productData[0]['name'].toString());

      myList.add(newText);
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 20,
      onSelectedItemChanged: (value) async {
        await getChoice(value);
          // selectedProduct = await productData[value]['name'].toString();
        print(productData[value]['name'].toString());
      },
      children: myList,
    );
  }

   getChoice(value) async{
    var myProduct  = await productData[value]['name'];
    setState(() {
     selectedProduct=myProduct.toString();
    });
  }

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
        return Column(
          children: [
            SizedBox(
              height: 160,
            ),
            Center(
              child: Text(
                'Your Sales List',
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
                      itemCount: getSalesLength(),
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 900),
                          child: FadeInAnimation(
                            child: SalesTiles(
                                index: index,
                                Name: 'Price Paid is ${getSalePrice(index)}',
                                quantity: getSalesQuantity(index)),
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
                'Sell Product',
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
                        controller: priceController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            label: Text(
                              'Price Paid',
                              style: titleStyle,
                            ),
                            hintText: 'Paid Price',
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            focusColor: Colors.blueAccent),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: quantityController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            label: Text(
                              'Quantity Purchased',
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
                        width: 180,
                        decoration: BoxDecoration(
                          color: context.theme.backgroundColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Center(
                            child: AndroidPicker()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        color: secondary1Dark,
                        label: 'Add',
                        icon: Icons.add,
                        onTap: () async {
                          await _validateSales();
                          setState(() {
                            priceController.clear();
                            quantityController.clear();
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
          children: [
            const SizedBox(
              height: 160,
            ),
            Center(
              child: Text(
                'Your Sales List',
                style: headingStyle.copyWith(fontSize: 32),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                child: AnimationLimiter(
                  child: ListView.builder(
                      itemCount: dataFile.salesLenght,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 900),
                          child: FadeInAnimation(
                            child: SalesTiles(
                                index: index,
                                Name:
                                    'Price Paid is ${dataFile.sales.elementAt(index).Pricepaid}',
                                quantity:
                                    dataFile.sales.elementAt(index).quantity),
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

  _validateSales() async {
    if (priceController.text.isNotEmpty && quantityController.text.isNotEmpty) {
      await addSales(
          paid: double.parse(priceController.text),
          product: selectValue.toString());
      await getSales();
    } else if (priceController.text.isEmpty ||
        quantityController.text.isEmpty) {
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
