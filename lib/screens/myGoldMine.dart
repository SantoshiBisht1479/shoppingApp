import 'package:flutter/material.dart';
import 'package:shopping_application/Database/database_helper.dart';
import 'package:shopping_application/model/plan.dart';

class MyGoldMine extends StatefulWidget {
  @override
  _MyGoldMineState createState() => _MyGoldMineState();
}

class _MyGoldMineState extends State<MyGoldMine> {
  Future<List<PlanDetailModel>> planDetailModel;
  //DataBaseHelper.instance.getTask();

  //List<PlanDetailModel> model;
  @override
  void initState() {
    super.initState();
    planDetailModel = DataBaseHelper.instance.getTask();
    // planDetailModel.then((value) {
    //   setState(() {
    //     model = value;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY GOLDMINE'),
      ),
      body: Container(
        child: FutureBuilder<List<PlanDetailModel>>(
          future: planDetailModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10.0,
                          child: ListTile(
                            onTap: () {
                              showDetailDialogue(context, snapshot.data[index]);
                            },
                            leading: CircleAvatar(
                              backgroundColor: Color(0xff9900ac),
                              radius: 80.0,
                              child: Text('${snapshot.data[index].id}'),
                            ),
                            //title: Text('${snapshot.data[index].id}'),
                            title: Text(
                              'Puchased Plan Amount: ${snapshot.data[index].amount}',
                            ),
                          ),
                        ),
                      );
                    });
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
          //     child: ListView.builder(
          // itemCount: model?.length,
          // itemBuilder: (context, index) {
          //   return ListTile(
          //     title: Text('${model[index].id}'),
          //     subtitle: Text('${model[index].amount}'),
          //   );
          // }),
        ),
      ),
    );
  }

  showDetailDialogue(BuildContext context, PlanDetailModel data) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              RaisedButton(
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
            content: showDialogueContent(data),
          );
        });
  }

  Widget showDialogueContent(PlanDetailModel data) {
    return Form(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Purchased Plan Detail For id ${data.id}',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        SizedBox(
          height: 15,
        ),
        TextFormField(
          enabled: false,
          initialValue: data.amount,
          decoration: InputDecoration(
              prefixText: 'Amount  ',
              prefixStyle:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        TextFormField(
          enabled: false,
          initialValue: data.firstEmi,
          decoration: InputDecoration(
              prefixText: 'First EMI(50% OFF)  ',
              prefixStyle:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        TextFormField(
          enabled: false,
          initialValue: data.nineEMI,
          decoration: InputDecoration(
              prefixText: 'Nine EMI  ',
              prefixStyle:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        TextFormField(
          enabled: false,
          initialValue: data.elevenEMI,
          decoration: InputDecoration(
              prefixText: 'Eleven EMI  ',
              prefixStyle:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        TextFormField(
          enabled: false,
          initialValue: data.totalPurchase,
          decoration: InputDecoration(
              prefixText: 'Total Purchase  ',
              prefixStyle:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        TextFormField(
          enabled: false,
          initialValue: data.savings,
          decoration: InputDecoration(
              prefixText: 'Savings  ',
              prefixStyle:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
      ],
    ));
  }
}
