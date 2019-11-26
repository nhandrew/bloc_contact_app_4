
import 'package:bloc_contact_tutorial/src/data/jsonplaceholder_provider.dart';
import 'package:bloc_contact_tutorial/src/models/contact.dart';

class Repository {
  final JsonPlaceHolderProvider jsonProvider=JsonPlaceHolderProvider();

  Future<List<Contact>> fetchContacts() async => await jsonProvider.fetchContacts();
}