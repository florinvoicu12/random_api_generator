import 'package:random_api_generator_app/models/user_dob.dart';
import 'package:random_api_generator_app/models/user_location.dart';
import 'package:random_api_generator_app/models/user_name.dart';
import 'package:random_api_generator_app/models/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;

  User(
      {required this.email,
      required this.phone,
      required this.cell,
      required this.nat,
      required this.gender,
      required this.name,
      required this.dob,
      required this.location});

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName(
        first: e['name']['first'],
        title: e['name']['title'],
        last: e['name']['last']);
    final date = e['dob']['date'];
    final dob = UserDob(age: e['dob']['age'], date: DateTime.parse(date));
    final street = LocationStreet(
        name: e['location']['street']['name'],
        number: e['location']['street']['number']);
    final coordinates = LocationCoordinate(
        latitude: e['location']['coordinates']['latitude'].toString(),
        longitude: e['location']['coordinates']['longitude'].toString());
    final timezone = LocationTimezone(
        description: e['location']['timezone']['description'],
        offset: e['location']['timezone']['offset']);
    final picture = UserPicture(
        large: e['picture']['large'],
        medium: e['picture']['medium'],
        thumbnail: e['picture']['thumbnail']);
    final location = UserLocation(
        street: street,
        city: e['location']['city'],
        state: e['location']['state'],
        country: e['location']['country'],
        postcode: e['location']['postcode'].toString(),
        coordinates: coordinates,
        timezone: timezone);
    return User(
      location: location,
      name: name,
      dob: dob,
      cell: e['cell'],
      email: e['email'],
      phone: e['phone'],
      nat: e['nat'],
      gender: e['gender'],
    );
  }

  String get fullName {
    return "${name.title} ${name.first} ${name.last}";
  }
}
