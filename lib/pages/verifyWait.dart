import 'package:flutter/material.dart';

class WaitBay extends StatefulWidget {
  const WaitBay({Key? key}) : super(key: key);

  @override
  State<WaitBay> createState() => _WaitBayState();
}

class _WaitBayState extends State<WaitBay> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Please verify your email and click the button below',style: TextStyle(fontSize: 14),),
      ),
    );
  }
}
