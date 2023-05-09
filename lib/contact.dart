
import 'package:flutter/material.dart';
import 'database_helper.dart';


class Contact {
  final String id;
  final String name;
  final String email;
  final String phonenumber;

  Contact({
    required this.id, required this.name, required this.email, required this.phonenumber});

  Map<String,dynamic> toMap() {
    return {
      'id' :id,
      'name' : name,
      'email': email,
      'phone':phonenumber,

    };
  }

}


