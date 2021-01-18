import 'package:flutter/material.dart';
import 'package:shopping_application/model/model.dart';
import 'package:shopping_application/screens/product_all.dart';
import 'package:shopping_application/widgets/my_drawer.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          productOne(),
          SizedBox(
            height: 10,
          ),
          productTwo()
        ],
      ),
    );
  }

  Widget productOne() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductsAll(
                      title: 'Diamond Products',
                      productDataList: diamondProduct,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
            //color: Color(0xffffb366),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Row(
          children: [
            Column(
              children: [
                RichText(
                  textScaleFactor: 2,
                  text: TextSpan(
                      text: "Diamond",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.arrow_downward_rounded,
                            color: Colors.blue,
                          ),
                        )
                      ]),
                ),
                Text('Pendants,Earrings,nosepin,bracelet..'),
              ],
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/diamond.jpeg',
                  fit: BoxFit.fill,
                  width: 100,
                  height: 200,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget productTwo() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductsAll(
                      title: 'Gold Products',
                      productDataList: goldProduct,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
            //color: Color(0xffeb99ff),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
        child: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/gold.jpg',
                  fit: BoxFit.fill,
                  width: 100,
                  height: 200,
                ),
              ),
            ),
            Column(
              children: [
                RichText(
                  textScaleFactor: 2,
                  text: TextSpan(
                      text: "GOLD",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.arrow_downward_rounded,
                            color: Colors.blue,
                          ),
                        )
                      ]),
                ),
                Text('Earrings, pendants, mangalsutra....'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
