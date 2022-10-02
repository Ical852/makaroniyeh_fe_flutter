import 'package:flutter/material.dart';
import 'package:makaroniyeh/shared/theme.dart';

class NewCatItem extends StatelessWidget {

  String title;
  bool active;
  Function() onPress;
  NewCatItem({required this.title, this.active = false, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(
          right: 16
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10
        ),
        decoration: BoxDecoration(
          color: active ? primaryColor : white,
          border: Border.all(
            color: primaryColor
          ),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Text(
          title,
          style: poppinsText.copyWith(
            fontSize: 13,
            fontWeight: medium,
            color: active ? white : primaryColor
          ),
        ),
      ),
    );
  }
}