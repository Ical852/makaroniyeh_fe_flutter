import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:makaroniyeh/shared/theme.dart';

class SplashPage extends StatefulWidget {

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushNamed(context, "/home");
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 135,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/logo.png")
                    )
                  ),
                ),
                SizedBox(height: 30,),
                Text(
                  "Makaroniyeh",
                  style: poppinsText.copyWith(
                    fontSize: 32,
                    fontWeight: semiBold,
                    color: white
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}