import 'package:flutter/material.dart';
import 'package:makaroniyeh/shared/theme.dart';
import 'package:makaroniyeh/widgets/catitem.dart';

class BestSellerItem extends StatelessWidget {

  String image;
  String cat;
  String title;
  int price;

  BestSellerItem({required this.image, required this.cat, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 24,
        top: 16,
        bottom: 20
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10
      ),
      width: MediaQuery.of(context).size.width - 48,
      height: 205,
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.2),
            blurRadius: 2,
            offset: Offset(0, 2))
        ],
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 92,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(4)
            ),
          ),
          SizedBox(height: 12,),
          CatItem(title: cat,),
          Container(
            margin: EdgeInsets.only(top: 6),
            child: Text(
              title,
              style: poppinsText.copyWith(
                color: black,
                fontSize: 18,
                fontWeight: semiBold
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6),
            child: Text(
              "IDR. " + formatter(price),
              style: poppinsText.copyWith(
                color: primaryColor,
                fontSize: 14,
                fontWeight: semiBold
              ),
            ),
          )
        ],
      ),
    );
  }
}