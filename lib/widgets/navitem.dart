import 'package:flutter/material.dart';
import 'package:makaroniyeh/shared/theme.dart';

class NavItem extends StatelessWidget {

  String text;
  String image;
  bool active;
  NavItem({required this.text, required this.image, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: 2
            ),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/ic"+ image +".png")
              )
            ),
          ),
          Text(
            text,
            style: poppinsText.copyWith(
              fontSize: 14,
              fontWeight: active ? semiBold : reguler,
              color: active ? primaryColor : blue3
            ),
          )
        ],
      ),
    );
  }
}