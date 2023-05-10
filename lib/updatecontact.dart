
import 'package:flutter/material.dart';
import 'contact.dart';
import 'database_helper.dart';


class UpdateContactScreen extends StatefulWidget {

  final Contact contact;

  UpdateContactScreen({required this.contact});

  @override
  _UpdateContactScreenState createState() => _UpdateContactScreenState();


}

class _UpdateContactScreenState extends State<UpdateContactScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _nameController.text = widget.contact.name;
    _emailController.text = widget.contact.email;
    _phoneController.text= widget.contact.phonenumber;
  }

  Future<void> _updatecontact(Contact contact) async {
    final db = await DatabaseHelper.instance.database;

    await db.update('Contacts',contact.toMap(),where: 'id= ?', whereArgs: [contact.id]);

    Navigator.pop(context,true);
    //display success message to user
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Contact Updated"),duration: Duration(seconds: 2),),);
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title :Text("Update Contacts")
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height:20),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height:20),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Phone',
              ),
            ),
            SizedBox(height:20),
            ElevatedButton(
                onPressed: () {
                  Contact contactModel = Contact(id: widget.contact.id,name:_nameController.text.toString(),email:_emailController.text.toString(),phonenumber:_phoneController.text.toString());
                  _updatecontact(contactModel);

                },
                child: Text("Update Contact")
            ),
          ],
        ),
      ),
    );
  }

}


