
import 'package:contactmanagerflutter/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'database_helper.dart';

class MyDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // save login status
    Future<void> saveLoginStatus(bool isLoggedIn) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isLoggedIn", isLoggedIn);
    }

    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(accountName: Text("User"), accountEmail: Text("user@gmail.com")),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Log Out"),
            onTap: () {
              saveLoginStatus(false);
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => LogInScreen()), (route) => false);
            },
          )
        ],
      ),
    );
  }

}



