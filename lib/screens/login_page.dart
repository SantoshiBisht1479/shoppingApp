import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopping_application/screens/home_page.dart';
import 'package:shopping_application/screens/signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _key = GlobalKey<FormState>();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          child: SingleChildScrollView(child: FormWidget()),
        ));
  }

  Widget FormWidget() {
    return Form(
        key: _key,
        child: Column(
          children: [
            Container(
              height: 200,
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.only(right: 60, bottom: 40),
                alignment: Alignment.bottomRight,
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                      letterSpacing: 4.0,
                      color: Colors.white,
                      fontFamily: 'Langar',
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                  color: Color(0xff9900cc),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(100))),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    controller: emailTextController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: 'Email',
                        hintText: 'Enter Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          labelText: 'Password',
                          hintText: 'Enter password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    //color: Colors.amber,
                    padding: EdgeInsets.only(right: 10),
                    alignment: Alignment.centerRight,
                    child: RichText(
                        text: TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Forgot Password');
                              },
                            text: 'Forgot Password ?',
                            style:
                                TextStyle(color: Colors.blue, fontSize: 16))),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  InkWell(
                    //splashColor: Color(0xffc61aff),
                    onTap: () {
                      print('login');
                      if (_key.currentState.validate()) {
                        // Scaffold.of(context).showSnackBar(
                        //     SnackBar(content: Text('Login Successfull')));
                        print('Login Successfull');
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false);
                      } else {
                        print('No such email exits');
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            letterSpacing: 3.0,
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Langar',
                            fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xff9900cc),
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Image(
                                image: AssetImage(
                                    'assets/images/gmail_logo_jpg.jpg')),
                          ),
                          Text(
                            'Login with Gmail',
                            style: TextStyle(
                                letterSpacing: 3.0,
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Langar',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black87, style: BorderStyle.solid),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    child: RichText(
                        text: TextSpan(
                            text: 'Don\'t have an account? ',
                            style: TextStyle(
                                color: Colors.black87, fontSize: 18.0),
                            children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUpPage()));
                                },
                              text: 'Sign Up',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 19.0))
                        ])),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
