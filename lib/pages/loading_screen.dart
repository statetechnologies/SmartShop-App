import 'package:flutter/material.dart';
import 'package:smart_shop/services/productAPI.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_shop/pages/homepage.dart';
import 'package:smart_shop/services/salesAPI.dart';
import '../services/categoryAPI.dart';
import '../services/userAPI.dart';
import 'package:get/get.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await getProducts();
    await getSales();
    await getUserProfile();
    await getCategory();
    await Get.to(() => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
          child: SpinKitPouringHourGlassRefined(
        color: Colors.blue,
        size: 100.0,
      )),
    );
  }
}
