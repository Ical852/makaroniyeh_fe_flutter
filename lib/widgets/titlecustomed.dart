import 'package:flutter/material.dart';
import 'package:makaroniyeh/shared/theme.dart';

class TitleCustomed extends StatelessWidget {

  String title;
  String subtitle;
  TitleCustomed({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 24
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: poppinsText.copyWith(
              fontSize: 14,
              fontWeight: semiBold,
              color: black
            ),
          ),
          Text(
            subtitle,
            style: poppinsText.copyWith(
              fontSize: 12,
              fontWeight: reguler,
              color: grey
            ),
          )
        ],
      ),
    );
  }
}