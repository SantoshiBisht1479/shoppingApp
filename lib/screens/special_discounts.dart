import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopping_application/widgets/my_drawer.dart';

class SpecialDiscounts extends StatefulWidget {
  @override
  _SpecialDiscountsState createState() => _SpecialDiscountsState();
}

class _SpecialDiscountsState extends State<SpecialDiscounts>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    List<String> discountImages = [
      'https://staticimg.titan.co.in/Tanishq/Catalog/513217VBR1AP3_1.jpg?impolicy=pqmed',
      'https://staticimg.titan.co.in/Tanishq/Catalog/502614ODDAAA02_1.jpg?impolicy=pqmed',
      'https://staticimg.titan.co.in/Tanishq/Catalog/501718SGLAAA09_1.jpg?impolicy=pqmed',
      'https://staticimg.titan.co.in/Tanishq/Catalog/512217JIEABA37_1.jpg?impolicy=pqmed',
      'https://staticimg.titan.co.in/Tanishq/Catalog/502419PBYAAA02_1.jpg?impolicy=pqmed',
      'https://staticimg.titan.co.in/Tanishq/Catalog/503117FJOAA02_1.jpg?impolicy=pqmed',
      'https://staticimg.titan.co.in/Tanishq/Catalog/502614YFGAA32_1.jpg?impolicy=pqmed',
      'https://staticimg.titan.co.in/Tanishq/Catalog/502415VEL1A02_1.jpg?impolicy=pqmed'
    ];
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Special Discounts'),
        ),
        drawer: MyDrawer(),
        body: Container(
          child: CarouselSlider.builder(
              itemCount: discountImages.length,
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            //color: Colors.purpleAccent,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                width: 3, color: Colors.purpleAccent),
                            image: DecorationImage(
                                image: NetworkImage(discountImages[index]),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        bottom: 30.0,
                        child: Container(
                          width: 400,
                          alignment: Alignment.center,
                          height: 50,
                          // height: double.infinity,
                          // width: double.infinity,
                          child: Text(
                            '50% off',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                Colors.purpleAccent.withOpacity(0.2),
                                Colors.purpleAccent.withOpacity(0.5)
                              ])),
                        ),
                      )
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                  // aspectRatio: 16 / 9,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 200),
                  scrollDirection: Axis.horizontal,
                  autoPlayCurve: Curves.bounceIn,
                  viewportFraction: 0.8)),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
