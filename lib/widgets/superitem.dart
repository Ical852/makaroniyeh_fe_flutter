import 'package:flutter/material.dart';
import 'package:makaroniyeh/shared/theme.dart';
import 'package:makaroniyeh/widgets/catitem.dart';

class SuperItem extends StatelessWidget {

  String image;
  String cat;
  String title;
  int price;

  SuperItem({required this.image, required this.cat, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 7
      ),
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
          Row(
            children: [
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(6)
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: ((MediaQuery.of(context).size.width / 2) - 48 - 15 - 10 - 42) /2 
                ),
                child: CatItem(title: cat)
              )
            ],
          ),
          SizedBox(height: 25,),
          Text(
            title,
            style: poppinsText.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
              color: black
            ),
          ),
          Text(
            "IDR. " + formatter(price),
            style: poppinsText.copyWith(
              fontSize: 10,
              fontWeight: semiBold,
              color: primaryColor
            ),
          )
        ],
      ),
    );
  }
}