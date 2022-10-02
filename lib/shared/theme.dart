// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;

String baseUrl = "http://192.168.100.15:8000/api";
String imageUrl = "http://192.168.100.15:8000/images";

String formatter(int number) {
  var formatted = intl.NumberFormat.decimalPattern().format(number);

  return formatted;
}

Color primaryColor = Color(0xff07599C);
Color secondaryColor = Color(0xff9FD1FF);

Color black = Color(0xff15171F);
Color grey = Color(0xff9698A9);
Color white = Color(0xffFFFFFF);
Color blue1 = Color(0xff07599C);
Color blue2 = Color(0xff9FD1FF);
Color blue3 = Color(0xffD1EBFD);

TextStyle poppinsText = GoogleFonts.poppins();

FontWeight light = FontWeight.w300;
FontWeight reguler = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight blackBold = FontWeight.w900;
