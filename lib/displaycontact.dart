
import 'package:contactmanagerflutter/database_helper.dart';
import 'package:flutter/material.dart';

class DisplayContactScreen extends StatefulWidget {

  @override
  _DisplayContactScreenState createState() => _DisplayContactScreenState();
}

class _DisplayContactScreenState extends State<DisplayContactScreen> {

  late Future<List<Map<String,dynamic>>> _contacts;

  @override
  void initState() {
    super.initState();
    _loadContacts();

  }

  Future<void> _loadContacts() async {
    _contacts = DatabaseHelper.instance.queryAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: FutureBuilder<List<Map<String,dynamic>>>(
        future: _contacts,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(!snapshot.hasData) {
            return Center (
              child: CircularProgressIndicator(),
            );
          }
          else {
            List<Map<String,dynamic>> contacts = snapshot.data!;

            return ListView.builder(
              itemCount: contacts.length,
                itemBuilder:(BuildContext context, int index) {
              Map<String,dynamic> contact = contacts[index];
              return ListTile(
                title: Text(contact['phone']),
              );

            });
          };
        },
      )
    );
  }
}

