import 'package:flutter/material.dart';
import 'package:shopping_application/Database/database_helper.dart';
import 'package:shopping_application/model/plan.dart';

class TenPlusOne extends StatefulWidget {
  @override
  _TenPlusOneState createState() => _TenPlusOneState();
}

class _TenPlusOneState extends State<TenPlusOne> {
  bool enable = true;
  var totalamount;
  TextEditingController amount = TextEditingController();
  TextEditingController firstEMIController = TextEditingController();
  TextEditingController nineEMIController = TextEditingController();
  TextEditingController elevenEMIController = TextEditingController();
  TextEditingController totalPurchaseController = TextEditingController();
  TextEditingController yourSavingsController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('10+1 PLAN'),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        //height: double.infinity,
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            amountWidget(),
            firstEMI(),
            nineEMI(),
            elevenEMI(),
            totalPurchaseAmount(),
            savings(),
            buyButton()
          ],
        )),
      ),
    );
  }

  Widget amountWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            Text('Amount: '),
            Flexible(
              child: TextFormField(
                controller: amount,
                onChanged: (value) {
                  setState(() {
                    print(value);
                    totalamount = value;
                    enable = true;
                  });
                },
                onEditingComplete: () {
                  firstEMIController.text = calculateFirstEmi(totalamount);
                  nineEMIController.text = calculateNineEmi(totalamount);
                  elevenEMIController.text = '$totalamount';
                  totalPurchaseController.text =
                      calculateTotalPurchaseValue(totalamount);
                  yourSavingsController.text = calculateSavings(totalamount);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Enter Amount'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget firstEMI() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            Text('First EMI: '),
            Flexible(
              child: TextFormField(
                controller: firstEMIController,
                /*
                                  onTap: () {
                                    print(int.parse(totalamount) / 2);
                                    setState(() {
                                      //firstEMIController.text = int.parse(totalamount) / 2;
                                      firstEMIController.text = calculateFirstEmi(totalamount);
                                      //enable = false;
                                    });
                                  },
                                  */
                //initialValue: '${calculateFirstEmi(totalamount)}',
                enabled: false,
                decoration: InputDecoration(
                  prefixText: '50% off',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget nineEMI() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            Text('Nine EMI: '),
            Flexible(
              child: TextFormField(
                controller: nineEMIController,
                /*
                                  onTap: () {
                                    //print(int.parse(totalamount) / 2);
                                    setState(() {
                                      nineEMIController.text = calculateNineEmi(totalamount);
                                      //enable = false;
                                    });
                                  },
                                  */
                //initialValue: '${calculateFirstEmi(totalamount)}',
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget elevenEMI() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            Text('Eleven EMI: '),
            Flexible(
              child: TextFormField(
                controller: elevenEMIController,
                enabled: false,
                decoration: InputDecoration(
                  prefixText: '100 % off',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget totalPurchaseAmount() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            Flexible(flex: 2, child: Text('Total Purchase Amount: ')),
            Flexible(
              flex: 3,
              child: TextFormField(
                controller: totalPurchaseController,
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget savings() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            Flexible(flex: 2, child: Text('Your Savings: ')),
            Flexible(
              flex: 3,
              child: TextFormField(
                controller: yourSavingsController,
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buyButton() {
    return RaisedButton(
      elevation: 10.0,
      color: Color(0xff9900cc),
      onPressed: () async {
        if (totalamount != null) {
          PlanDetailModel planDetailModel = PlanDetailModel(
              amount: amount.text,
              firstEmi: firstEMIController.text,
              nineEMI: nineEMIController.text,
              elevenEMI: elevenEMIController.text,
              totalPurchase: totalPurchaseController.text,
              savings: yourSavingsController.text);
          int i = await DataBaseHelper.instance.insertData(planDetailModel);
          print(i);
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(
              'Successfully Purchased Plan',
              style: TextStyle(color: Colors.green),
            ),
            duration: Duration(seconds: 2),
          ));
          amount.clear();
          firstEMIController.clear();
          nineEMIController.clear();
          elevenEMIController.clear();
          totalPurchaseController.clear();
          yourSavingsController.clear();
        } else {
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(
              'Enter Amount',
              style: TextStyle(color: Colors.red),
            ),
            duration: Duration(seconds: 2),
          ));
        }
      },
      child: Text(
        'Buy Plan',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  calculateFirstEmi(var amount) {
    var amountValue = int.parse(amount);
    print(amountValue);
    return '${amountValue ~/ 2}';
  }

  calculateNineEmi(var amount) {
    var amountValue = int.parse(amount);
    return '${amountValue * 9}';
  }

  calculateTotalPurchaseValue(var amount) {
    // return int.parse(amount.text) +
    //     int.parse(amount.text) +
    //     int.parse(nineEMIController.text) +
    //     int.parse(amount.text);
    var amountValue = int.parse(amount);
    return '${amountValue * 11}';
  }

  calculateSavings(var amount) {
    var amountValue = int.parse(amount);
    return '${(amountValue) + (amountValue / 2)}';
  }
}
