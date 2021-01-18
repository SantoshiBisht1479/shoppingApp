import 'package:flutter/material.dart';
import 'package:shopping_application/widgets/my_drawer.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text('about us'),
      ),
    );
  }
}
