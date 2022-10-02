import 'package:flutter/material.dart';
import 'package:makaroniyeh/shared/theme.dart';
import 'package:makaroniyeh/widgets/catitem.dart';

class PopularItem extends StatelessWidget {

  String cat;
  String image;
  String title;
  int price;

  PopularItem({required this.cat, required this.image, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 215,
      height: 278,
      margin: EdgeInsets.only(
        right: 20,
        top: 16,
        bottom: 20
      ),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.2),
            blurRadius: 2,
            offset: Offset(0, 2))
        ],
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CatItem(title: cat),
          Container(
            margin: EdgeInsets.only(
              top: 20
            ),
            width: 175,
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(12)
            ),
          ),
          SizedBox(height: 24,),
          Text(
            title,
            style: poppinsText.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
              color: black
            ),
          ),
          SizedBox(height: 6,),
          Text(
            "IDR. " + formatter(price),
            style: poppinsText.copyWith(
              fontSize: 14,
              fontWeight: semiBold,
              color: primaryColor
            ),
          )
        ],
      ),
    );
  }
}