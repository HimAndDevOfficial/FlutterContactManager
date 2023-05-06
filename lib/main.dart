import 'package:contactmanagerflutter/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboardscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthenticationWrapper(
        authenticatedBuilder: (_) => Dasboard(),
        unauthenticatedBuilder: (_)=> LogInScreen(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatefulWidget {
  final Widget Function(BuildContext) authenticatedBuilder;
  final Widget Function(BuildContext) unauthenticatedBuilder;

  const AuthenticationWrapper({
    Key? key,
    required this.authenticatedBuilder,
    required this.unauthenticatedBuilder,
}): super(key:key);

  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();

}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {

  bool _isLoggedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoginStatus();
  }

  // save login status
  Future<void> saveLoginStatus(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", isLoggedIn);
  }

  //fetch login status
  Future<bool> getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
  //checking your login status
  Future<void> checkLoginStatus() async {
    bool isLoggedIn = await getLoginStatus();
    print("isLoggedInStatus $isLoggedIn");
    setState(() {
      _isLoggedIn = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
   if(_isLoggedIn) {
     return widget.authenticatedBuilder(context);
   } else {
     return widget.unauthenticatedBuilder(context);
   }

  }

}


