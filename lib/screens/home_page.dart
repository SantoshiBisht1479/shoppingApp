import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_application/screens/about_us.dart';
import 'package:shopping_application/screens/contact_us.dart';
import 'package:shopping_application/screens/product_list.dart';
import 'package:shopping_application/screens/special_discounts.dart';
import 'package:shopping_application/widgets/my_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  PageController _pageController = PageController();
  List<Widget> _screens = [
    AboutUs(),
    ProductList(),
    ContactUs(),
    SpecialDiscounts()
  ];
  void _onPageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
    //print(index);
  }

  void _onItemTapped(int index) {
    //print(index);
    //selectedIndex = index;
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home Page'),
      // ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _screens,
        physics: NeverScrollableScrollPhysics(),
      ),
      //drawer: MyDrawer(),
      bottomNavigationBar: myBottomNavigationBar(),
    );
  }

  Widget myBottomNavigationBar() {
    return BottomNavigationBar(
        onTap: _onItemTapped,
        selectedItemColor: Color(0xff9900cc),
        unselectedItemColor: Colors.grey,
        currentIndex: this.selectedIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About Us',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'Product List'),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_phone), label: 'Contact Us'),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'Special Discounts'),
        ]);
  }
}
