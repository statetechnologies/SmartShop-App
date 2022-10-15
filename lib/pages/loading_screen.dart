import 'package:flutter/material.dart';
import 'package:smart_shop/services/productAPI.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_shop/pages/homepage.dart';
import 'package:smart_shop/services/salesAPI.dart';
import '../services/categoryAPI.dart';
import '../services/userAPI.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await getProducts();
    await getSales();
    await getUserProfile();
    await getCategory();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitWanderingCubes(
        color: Colors.blue,
        size: 100.0,
      )),
    );
  }
}
