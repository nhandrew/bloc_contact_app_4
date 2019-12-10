import 'package:bloc_contact_tutorial/src/models/company.dart';

class Contact {
  final int id;
  final String name;
  final String username;
  final String email;
  final Company company;

  Contact({this.id,this.name,this.username,this.email,this.company});

  Contact.fromJson(Map<String,dynamic> parsedJson)
    : id = parsedJson['id'],
     name = parsedJson['name'],
     username = parsedJson['username'],
     email = parsedJson['email'],
     company = Company.fromJson(parsedJson['company']);
}