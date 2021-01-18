import 'package:flutter/material.dart';
import 'package:shopping_application/screens/home_page.dart';
import 'package:shopping_application/screens/login_page.dart';
import 'package:shopping_application/screens/signup.dart';
import 'package:shopping_application/shared_preferences/shared_pref.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff9900cc),
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('assets/images/logo.png'), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [signUp(context), loginscreen(context)],
            ),
            InkWell(
              onTap: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));

                SharedPrefs.storePref(true);
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white),
                  child: Text(
                    'SKIP',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget signUp(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: EdgeInsets.all(15),
          alignment: Alignment.center,
          height: 60,
          width: double.infinity,
          child: Text(
            'SignUp',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(width: 1.5, style: BorderStyle.solid)),
        ),
      ),
    );
  }
}

Widget loginscreen(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
      SharedPrefs.storePref(false);
    },
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: EdgeInsets.all(15),
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        child: Text(
          'LogIn',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(width: 1.5, style: BorderStyle.solid)),
      ),
    ),
  );
}
