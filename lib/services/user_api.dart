import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:random_api_generator_app/models/user.dart';
import 'package:random_api_generator_app/models/user_name.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    print("fetchUsers called");
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
          first: e['name']['first'],
          title: e['name']['title'],
          last: e['name']['last']);
      return User(
        name: name,
        cell: e['cell'],
        email: e['email'],
        phone: e['phone'],
        nat: e['nat'],
        gender: e['gender'],
      );
    }).toList();
    return users;
  }
}
