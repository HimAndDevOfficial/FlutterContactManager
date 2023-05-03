
import 'package:flutter/material.dart';

class DisplayContactScreen extends StatefulWidget {

  @override
  _DisplayContactScreenState createState() => _DisplayContactScreenState();
}

class _DisplayContactScreenState extends State<DisplayContactScreen> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: Text("i will display contact"),
      )
    );
  }
}

