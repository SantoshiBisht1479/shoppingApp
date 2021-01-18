import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopping_application/screens/home_page.dart';
import 'package:shopping_application/screens/main_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    //HomePage()
                    MainPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'))),
            ),
            // SizedBox(
            //   height: 15,
            // ),
            Text(
              'Elegant',
              style: TextStyle(
                color: Colors.black87,
                wordSpacing: 4,
                fontSize: 45,
                fontFamily: 'Lobster',
              ),
            )
          ],
        ),
      ),
    ));
  }
}
