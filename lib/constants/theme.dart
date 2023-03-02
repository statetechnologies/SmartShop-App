import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const bodyLight = Color(0xffe3f2fd);
const bodyLight1 = Color(0xffc1d5e0);
const bodyDark = Color(0xff808e95);
const bodyDark1 = Color(0xff62757f);
const goldenYellow = Color(0xffffca28);
const purpleIcon = Color(0xff5e35b1);
const blueIcon = Color(0xff3949ab);

const primary = Color(0xffbbdefb);
const primaryLight = Color(0xffeeffff);
const primaryDark = Color(0xff8aacc8);
const secondary = Color(0xff7986cb);
const secondaryLight = Color(0xffaab6fe);
const secondaryDark = Color(0xff49599a);

const primary1 = Color(0xffb3e5fc);
const primary1Light = Color(0xffe6ffff);
const primary1Dark = Color(0xff82b3c9);
const secondary1 = Color(0xff7986cb);
const secondary1Light = Color(0xffaab6fe);
const secondary1Dark = Color(0xff49599a);

const primary2 = Color(0xff607d8b);
const primary2Light = Color(0xff8eacbb);
const primary2Dark = Color(0xff34515e);
const secondary2 = Color(0xff90caf9);
const secondary2Light = Color(0xffc3fdff);
const secondary2Dark = Color(0xff5d99c6);

const primary3DarkMode = Color(0xff11111D);
const primary3Container = Color(0xff161624);
const primary3DarkLogin = Color(0xff3049D1);
const primary3DarkTiles = Color(0xff222235);
const primary3subText = Color(0xffd6d7e3);

const primary3LightMode = Color(0xffEFF2F9);
const primary3LightTiles = Color(0xffFFFFFF);
const primary3Nav = Color(0xff0161f7);
const primary3TextLight = Color(0xff767676);
const primary3TextDark = Color(0xffeff0f5);
const primary3NavDark = Color(0xffa2a2a7);
const primary3NavLight = Color(0xffa3c0fd);

const one = Color(0xff171717);
const two = Color(0xffeff0f6);
const three = Color(0xffffeee);
const four = Color(0xffff444);
const five = Color(0xffff000);
const six = Color(0xffd6d7e3);
const svn = Color(0xffffb648);
const eght = Color(0xff5887ff);
const nne = Color(0xfff26464);
const ten = Color(0xff4bde97);
const icon3 = Color(0xff5f2eea);

class Themes {
  static final light = ThemeData(
      // primaryColor: ,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(centerTitle: true),
      backgroundColor: primary3LightMode);
  static final dark = ThemeData(
      // primaryColor: primary2,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(centerTitle: true),
      backgroundColor: primary3DarkMode);
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.white : Colors.black));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.white : Colors.black));
}

TextStyle get headingNavStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: primary3LightMode));
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.black38 : Colors.grey));
}

TextStyle get subText {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? primary3TextLight : primary3TextLight));
}

TextStyle get subNavHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.white60 : Colors.grey));
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.white : Colors.black));
}
