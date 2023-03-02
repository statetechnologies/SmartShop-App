import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final IconData icon;
  final Color color;

  CustomButton(
      {required this.label,
      this.onTap,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      height: 55,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: ElevatedButton.icon(
        style: ButtonStyle(),
        onPressed: onTap,
        icon: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        label: Text(
          label,
          style: TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
    // GestureDetector(
    //   onTap: onTap,
    //   child: Container(
    //     width: 150.0,
    //     height: 60.0,
    //     decoration: BoxDecoration(
    //         color: color, borderRadius: BorderRadius.circular(15.0)),
    //     child: Padding(
    //       padding: const EdgeInsets.all(5.0),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: [
    //           Icon(
    //             icon,
    //             color: Colors.white,
    //           ),
    //           Text(
    //             label,
    //             style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 18.0,
    //                 fontWeight: FontWeight.bold),
    //           )
    //         ],
    //       ),
    //     ),
    //   ));
  }
}
