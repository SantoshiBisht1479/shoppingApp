import 'dart:convert';

import 'package:http/http.dart';
import 'package:shopping_application/model/user_model.dart';

class NetworkServices {
  final String baseUrl = 'http://api.bengkelrobot.net:8001';

  Future<List<UserModel>> getProfile() async {
    var response = await get(Uri.encodeFull('$baseUrl/api/profile'));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      var users = list.map((data) => UserModel.fromJson(data)).toList();
      //return UserModel.fromJson(json.decode(response.body));
      return users;
    } else {
      throw Exception('Error retrieving data');
    }
  }

  Future<bool> postProfile(UserModel model) async {
    var response = await post('$baseUrl/api/profile',
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, dynamic>{
          'name': model.name,
          'email': model.email,
          'age': model.age
        }));
    if (response.statusCode == 201) {
      print('submitted');
      return true;
    } else {
      throw Exception('Error retrieving data');
    }
  }

  Future<bool> updateProfile(UserModel datamodel, int id) async {
    var response = await put('$baseUrl/api/profile/$id',
        headers: {"content-type": "application/json"},
        //body: userModelToJson(datamodel)
        body: jsonEncode(<String, dynamic>{
          'name': datamodel.name,
          'email': datamodel.email,
          'age': datamodel.age
        }));
    print(datamodel.id);
    print(datamodel.email);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('updated');

      return true;
    } else {
      //return false;
      throw Exception('Error retrieving data');
    }
  }

  Future<bool> deleteProfile(int id) async {
    final response = await delete(
      "$baseUrl/api/profile/$id",
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
