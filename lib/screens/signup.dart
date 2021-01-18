import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopping_application/screens/login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _key = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
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
                      'SIGN UP',
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
                Container(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    children: [
                      //username
                      TextFormField(
                        controller: userNameController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: 'User Name',
                            hintText: 'Enter User name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      //email
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            labelText: 'Email',
                            hintText: 'Enter email',
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
                        height: 15.0,
                      ),
                      //phone number
                      TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: 'Phone Number',
                            hintText: 'Enter phone number',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      //password
                      TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
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
                        },
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      //Register button
                      InkWell(
                        //splashColor: Color(0xffc61aff),
                        onTap: () {
                          print('register');
                          if (_key.currentState.validate()) {
                            print('registeration success');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          } else {
                            print('Details not saved');
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: double.infinity,
                          child: Text(
                            'REGISTER',
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

                      Container(
                        child: RichText(
                            text: TextSpan(
                                text: 'Already have an account? ',
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 18.0),
                                children: [
                              TextSpan(
                                  text: 'Login',
                                  style: TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    })
                            ])),
                      )
                    ],
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
