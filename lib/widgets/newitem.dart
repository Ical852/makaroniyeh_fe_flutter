import 'package:flutter/material.dart';
import 'package:makaroniyeh/shared/theme.dart';
import 'package:makaroniyeh/widgets/catitem.dart';

class NewItem extends StatelessWidget {

  String image;
  String cat;
  String title;
  String desc;
  int price;
  NewItem({required this.image, required this.cat, required this.title, required this.desc, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 20,
      ),
      height: 150,
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.2),
            blurRadius: 2,
            offset: Offset(0, 2))
        ],
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Container(
            width: 118,
            height: 118,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(12)
            ),
          ),
          SizedBox(width: 16,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatItem(title: cat),
                Container(
                  margin: EdgeInsets.only(
                    top: 8
                  ),
                  child: Text(
                    title,
                    style: poppinsText.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      color: black
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 8
                    ),
                    width: MediaQuery.of(context).size.width - 48 - 16 - 118 - 16 - 16,
                    child: Text(
                      desc,
                      style: poppinsText.copyWith(
                        fontSize: 10,
                        fontWeight: reguler,
                        color: grey,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "IDR. " + formatter(price),
                      style: poppinsText.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                        color: primaryColor
                      ),
                    ),
                    Container(
                      width: 58,
                      height: 24,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(
                        child: Text(
                          "Buy",
                          style: poppinsText.copyWith(
                            fontSize: 10,
                            fontWeight: reguler,
                            color: white
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}