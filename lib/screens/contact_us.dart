import 'package:flutter/material.dart';
import 'package:shopping_application/model/user_model.dart';
import 'package:shopping_application/services/api_services.dart';
import 'package:shopping_application/shared_preferences/shared_pref.dart';
//import 'package:shopping_application/src/api/api_service.dart';
import 'package:shopping_application/widgets/my_drawer.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController ageController = TextEditingController();
  Future<dynamic> pref = SharedPrefs.getPref();
  bool preferences;
  String userName;
  String email;
  String age;
  NetworkServices apiService;
  @override
  void initState() {
    super.initState();
    apiService = NetworkServices();
    pref.then((value) {
      setState(() {
        preferences = value;
      });
    });
    //print(SharedPrefs.getPref());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        actions: [
          GestureDetector(
              onTap: () {
                showAddDialogue(context);
              },
              child: Icon(Icons.add))
        ],
      ),
      drawer: MyDrawer(),
      body: FutureBuilder(
        future: apiService.getProfile(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<UserModel> users = snapshot.data;
            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 20.0,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  maxRadius: 40,
                                  child: Text('${users[index].id}'),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('User Name:  ${users[index].name}'),
                                    Text('Email:  ${users[index].email}'),
                                    Text('Age:  ${users[index].age}'),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: preferences == true
                                ? [Container()]
                                : [
                                    TextButton(
                                        onPressed: () {
                                          // setState(() {

                                          // });
                                          nameController.text =
                                              users[index].name;
                                          emailController.text =
                                              users[index].email;
                                          ageController.text =
                                              users[index].age.toString();
                                          showUpdateDialogue(
                                              context, users[index]);
                                        },
                                        child: Text(
                                          'Update',
                                          style: TextStyle(color: Colors.blue),
                                        )),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            apiService
                                                .deleteProfile(users[index].id);
                                          });
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ))
                                  ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  showAddDialogue(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              RaisedButton(
                  child: Text('ADD'),
                  onPressed: () {
                    setState(() {
                      UserModel model = UserModel(
                        name: nameController.text,
                        email: emailController.text,
                        age: int.parse(ageController.text),
                      );
                      NetworkServices().postProfile(model);
                    });
                    nameController.clear();
                    emailController.clear();
                    ageController.clear();
                    Navigator.pop(context);
                  }),
              RaisedButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
            title: Text('Add Contacts'),
            contentPadding: EdgeInsets.all(10),
            content: Form(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: 'Enter Name'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: 'Enter Email'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: ageController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: 'Enter Age'),
                )
              ],
            )),
          );
        });
  }

  showUpdateDialogue(BuildContext context, UserModel userModel) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              RaisedButton(
                  child: Text('UPDATE'),
                  onPressed: () {
                    print(userModel.id);
                    // UserModel model = UserModel(
                    //   name: nameController.text,
                    //   email: emailController.text,
                    //   age: int.parse(ageController.text),
                    // );
                    setState(() {
                      UserModel model = UserModel(
                        name: nameController.text,
                        email: emailController.text,
                        age: int.parse(ageController.text),
                      );
                      NetworkServices().updateProfile(model, userModel.id);
                    });
                    //NetworkServices().updateProfile(model, userModel.id);
                    nameController.clear();
                    emailController.clear();
                    ageController.clear();
                    Navigator.pop(context);
                  }),
              RaisedButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
            title: Text('Update Contacts'),
            contentPadding: EdgeInsets.all(10),
            content: Form(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  //initialValue: model.name,
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: 'Enter Name'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: 'Enter Email'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: ageController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: 'Enter Age'),
                )
              ],
            )),
          );
        });
  }
}
