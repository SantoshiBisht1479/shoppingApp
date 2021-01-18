import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_application/screens/10+1plan.dart';
import 'package:shopping_application/screens/faqs.dart';
import 'package:shopping_application/screens/home_page.dart';
import 'package:shopping_application/screens/myGoldMine.dart';
import 'package:shopping_application/screens/my_wallet.dart';
import 'package:shopping_application/screens/offers.dart';
import 'package:shopping_application/screens/redeem.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
              accountName: Text(
                'Santoshi Bisht',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text('santoshibisht@gmail.com',
                  style: TextStyle(fontSize: 16))),
          ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                leading: Icon(FontAwesomeIcons.home),
                title: Text('HOME'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage())),
              ),
              Divider(
                height: 5,
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.wallet),
                title: Text('MY WALLET'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyWallet())),
              ),
              Divider(
                height: 5,
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.getPocket),
                title: Text('REDEEM'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Redeem())),
              ),
              Divider(
                height: 5,
              ),
              ListTile(
                leading: Icon(FontAwesomeIcons.cashRegister),
                title: Text('OFFERS'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Offers())),
              ),
              Divider(
                height: 5,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TenPlusOne()));
                },
                leading: Icon(FontAwesomeIcons.handPaper),
                title: Text('10+1 PLAN'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              Divider(
                height: 5,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyGoldMine()));
                },
                leading: Icon(FontAwesomeIcons.coins),
                title: Text('MyGoldMine'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              Divider(
                height: 5,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Faqs()));
                },
                leading: Icon(FontAwesomeIcons.questionCircle),
                title: Text('FAQ'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              Divider(
                height: 5,
              ),
              ListTile(
                onTap: () {},
                leading: Icon(FontAwesomeIcons.signOutAlt),
                title: Text('LOGOUT'),
                trailing: Icon(Icons.arrow_forward_ios),
              )
            ],
          )
        ],
      ),
    );
  }
}
