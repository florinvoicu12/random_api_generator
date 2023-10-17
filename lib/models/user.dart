import 'package:random_api_generator_app/models/user_name.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;

  User({
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.gender,
    required this.name,
  });
}