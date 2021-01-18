import 'package:flutter/material.dart';
import 'package:shopping_application/model/model.dart';

class ProductsAll extends StatefulWidget {
  List<ProductData> productDataList;
  var title;
  ProductsAll({@required this.title, @required this.productDataList});
  @override
  _ProductsAllState createState() => _ProductsAllState();
}

class _ProductsAllState extends State<ProductsAll> {
  var appTitle;
  List<ProductData> productList;
  @override
  Widget build(BuildContext context) {
    setState(() {
      appTitle = widget.title;
      productList = widget.productDataList;
    });
    //List<ProductData> productList = diamondProduct;
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (contex, index) {
              return Card(
                elevation: 12,
                child: ListTile(
                  leading: CircleAvatar(
                    maxRadius: 50,
                    backgroundImage: productList[index].image == null
                        ? AssetImage('assets/images/diamond.jpeg')
                        : NetworkImage(productList[index].image),
                  ),
                  title: Text(
                    '${productList[index].title}',
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text('${productList[index].price}',
                      style: TextStyle(fontSize: 16)),
                ),
              );
            }),
      ),
    );
  }
}
