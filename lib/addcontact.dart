
import 'package:flutter/material.dart';
import 'database_helper.dart';


class AddContactScreen extends StatelessWidget {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    Future<void> _addcontact() async {
      final name = _nameController.text;
      final email = _emailController.text;
      final phone = _phoneController.text;


      //Insert the new contact into the database
      await DatabaseHelper.instance.insert({
        'name' : name,
        'email': email,
        'phone':phone,
      });

      //display success message to user
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Contact Added"),duration: Duration(seconds: 2),),);
    }


    return Scaffold(
      appBar: AppBar(
        title :Text("Add Contacts")
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
                  _addcontact();
            },
                child: Text("Add Contact")
            ),
          ],
        ),
      ),
    );
  }
}


