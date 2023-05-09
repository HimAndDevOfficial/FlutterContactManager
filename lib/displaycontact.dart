
import 'package:contactmanagerflutter/database_helper.dart';
import 'package:contactmanagerflutter/updatecontact.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'contact.dart';

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

  Future<int> _deleteContact(int id) async {
    Database db = await DatabaseHelper.instance.database;

    return await db.delete('Contacts',where: 'id= ?', whereArgs: [id]);
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
              return GestureDetector(
                child: ListTile(
                  title: Text("${contact['id']}). ${contact['name']} "),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone: ${contact['phone']}"),
                      Text("Email: ${contact['email']}")
                    ],
                  ),
                  trailing: IconButton(
                    icon:Icon(Icons.delete),
                    onPressed: () async {
                      await _deleteContact(contact['id']);
                      setState(() {
                        _loadContacts();
                      });
                    },
                  ),
                ),
                onTap: () {
                  Contact contactModel = Contact(id: contact['id'].toString(),name:contact['name'],email:contact['email'],phonenumber:contact['phone']);
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> UpdateContactScreen(contact: contactModel,)
                  ));
                },
              );

            });
          };
        },
      )
    );
  }
}

