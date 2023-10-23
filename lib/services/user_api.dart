import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:random_api_generator_app/models/user.dart';
import 'package:random_api_generator_app/models/user_dob.dart';
import 'package:random_api_generator_app/models/user_location.dart';
import 'package:random_api_generator_app/models/user_name.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    print("fetchUsers called");
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      return User.fromMap(e);
    }).toList();
    return users;
  }
}
