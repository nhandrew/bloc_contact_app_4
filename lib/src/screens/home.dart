import 'package:bloc_contact_tutorial/src/blocs/contact_provider.dart';
import 'package:bloc_contact_tutorial/src/models/contact.dart';
import 'package:bloc_contact_tutorial/src/screens/contact.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = ContactsProvider.of(context);
    return Scaffold(
        body: StreamBuilder<List<Contact>>(
      stream: bloc.contacts,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(snapshot.data[index].name),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContactPage(
                              contact: snapshot.data[index],
                            )));
              },
            );
          },
        );
      },
    ));
  }
}
