import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/constants/theme.dart';

class SalesTiles extends StatelessWidget {
  final int index;
  final String? Name;
  final double? price;
  final int? quantity;
  const SalesTiles(
      {Key? key, required this.index, this.Name, this.price, this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 5, 15.0, 2),
          child: Container(
            height: 80,
            width: 160,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? primary3DarkTiles : primary3LightTiles,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/$index.png'),
                  backgroundColor:
                      Get.isDarkMode ? Colors.white54 : primary3LightMode,
                  radius: 36,
                  // child: Image(image: AssetImage('images/profile.png')),
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Name!,
                      style: titleStyle.copyWith(fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Product Quantity is $quantity',
                      style: subText.copyWith(fontSize: 15.0),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
