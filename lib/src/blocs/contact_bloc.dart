import 'package:bloc_contact_tutorial/src/data/repository.dart';
import 'package:bloc_contact_tutorial/src/models/contact.dart';
import 'package:rxdart/rxdart.dart';

class ContactsBloc{

  ContactsBloc(){
    _fetchContacts();
  }

  final _contacts = BehaviorSubject<List<Contact>>();
  final Repository _repository=Repository();
  
  //Get Data
  Stream<List<Contact>> get contacts => _contacts.stream;

  //Set Data
  Function(List<Contact>) get changeContacts => _contacts.sink.add;

  dispose(){
    _contacts.close();
  }

  _fetchContacts() => _repository.fetchContacts().then((contacts) => changeContacts(contacts));



  

}