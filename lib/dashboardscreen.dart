
import 'package:flutter/material.dart';

import 'MyDrawer.dart';
import 'addcontact.dart';
import 'displaycontact.dart';

class Dasboard extends StatefulWidget {

  @override
  _DasboardState createState() => _DasboardState();
}

class _DasboardState extends State<Dasboard> {

  int _selectedIndex=0;
  static List<Widget> _widgetOptions =  <Widget>[
    AddContactScreen(),
    DisplayContactScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex= index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "Add Contact"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Display Contact"
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    drawer: MyDrawer(),
    );
  }
}

