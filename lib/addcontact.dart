
import 'package:flutter/material.dart';

import 'database_helper.dart';

class AddContactScreen extends StatelessWidget {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();


  Future<void> _addcontact() async {
  await DatabaseHelper.instance;
}

  @override
  Widget build(BuildContext context) {
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


