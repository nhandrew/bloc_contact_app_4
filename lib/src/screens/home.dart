import 'package:bloc_contact_tutorial/src/blocs/contact_provider.dart';
import 'package:bloc_contact_tutorial/src/models/contact.dart';
import 'package:bloc_contact_tutorial/src/screens/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class HomePage extends StatefulWidget {
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      final bloc = ContactsProvider.of(context);
      bloc.fetchContacts();
    });

    super.initState();
  }
}
