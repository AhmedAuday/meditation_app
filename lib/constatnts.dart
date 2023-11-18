import 'package:flutter/material.dart';

Color kPink = const Color(0xffFFE1ED);
Color kYellow = const Color.fromARGB(255, 252, 250, 248);

const String kIMG = "assets/images/";
const String kAudio = "assets/audio/";

const kParaghraph = TextStyle(
    color: Color(0xff030303),
    fontSize: 14,
    height: 1.5,
    fontWeight: FontWeight.w500);

const kHeadline = TextStyle(
    color: Color(0xff030303),
    fontSize: 25,
    height: 1.5,
    fontWeight: FontWeight.w700); // TextStyle

const kCardText = TextStyle(
  color: Color(0xff030303),
  fontSize: 16,
  fontWeight: FontWeight.w400,
); // Textstyle

const kText = TextStyle(
  color: Color(0xff030303),
  fontSize: 17,
  fontWeight: FontWeight.w300,
);

class ScreenSize {
  static double? width;
  static double? height;

  void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}
