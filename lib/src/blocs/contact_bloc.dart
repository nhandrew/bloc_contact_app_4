import 'package:bloc_contact_tutorial/src/models/contact.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ContactsBloc{

  final _contacts = BehaviorSubject<List<Contact>>();
  
  //Get Data
  Stream<List<Contact>> get contacts => _contacts.stream;

  //Set Data
  Function(List<Contact>) get changeContacts => _contacts.sink.add;

  dispose(){
    _contacts.close();
  }

  Future<void> fetchContacts() async {
    var response = await http.get("https://jsonplaceholder.typicode.com/users");
    var jsonResponse = convert.jsonDecode(response.body);
    var contactsJson = jsonResponse as List;
    List<Contact> contacts = List<Contact>();

    contactsJson.forEach((contact) => {contacts.add(Contact.fromJson(contact))});

    changeContacts(contacts);

  }

  

}