import 'package:bloc_contact_tutorial/src/models/contact.dart';
import 'package:rxdart/rxdart.dart';

class ContactsBloc{

  final _contacts = BehaviorSubject<List<Contact>>();
  
  //Get Data
  Stream<List<Contact>> get contacts => _contacts.stream;

  //Set Data
  Function(List<Contact>) get changeContacts => _contacts.sink.add;

  dispose(){
    _contacts.close();
  }

  

}