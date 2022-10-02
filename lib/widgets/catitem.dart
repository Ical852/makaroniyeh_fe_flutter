import 'package:flutter/material.dart';
import 'package:makaroniyeh/shared/theme.dart';

class CatItem extends StatelessWidget {

  String title;
  CatItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 2
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(4)
      ),
      child: Text(
        title,
        style: poppinsText.copyWith(
          fontSize: 10,
          fontWeight: reguler,
          color: white
        ),
      ),
    );
  }
}