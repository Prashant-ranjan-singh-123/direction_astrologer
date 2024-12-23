import 'package:flutter/material.dart';

class AppColor{
  AppColor._();
  static AppColor instance () => AppColor._();
  Color background = const Color.fromRGBO(251, 251, 251, 1);
  Color white = const Color.fromRGBO(255, 255, 255, 1);
  Color shadow = const Color.fromRGBO(163, 163, 163, 1);
  Color shadow2 = const Color.fromRGBO(212, 212, 216, 1);
  Color button_color = const Color.fromRGBO(20, 184, 166, 1);
  Color text_dark_green = const Color.fromRGBO(19, 78, 74, 1);
  Color header_light_green = const Color.fromRGBO(96, 172, 172, 1);
  Color header_light_green_original = const Color.fromRGBO(230, 239, 238, 1);
  Color error = const Color.fromRGBO(236, 86, 86, 1);
  Color black = const Color.fromRGBO(0, 0, 0, 1.0);
}