import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_shop/constants/theme.dart';

class Tiles extends StatelessWidget {
  final IconData? icon;
  final String? currency;
  final double? value;
  final String? label;
  final Color? Iconcolor;
  const Tiles(
      {Key? key,
      required this.icon,
      required this.Iconcolor,
      this.currency,
      required this.value,
      required this.label})
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
                  backgroundColor:
                      Get.isDarkMode ? Colors.white54 : primary3LightMode,
                  radius: 28,
                  child: Icon(
                    icon,
                    color: Iconcolor,
                    size: 28,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currency! + value!.toStringAsFixed(2),
                      style: titleStyle.copyWith(fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      label!,
                      style: subText.copyWith(fontSize: 15.0),
                    )
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
