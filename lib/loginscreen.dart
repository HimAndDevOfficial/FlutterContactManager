
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'dashboardscreen.dart';


class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FlutterLogo(
              size: 100,
            ),
            SizedBox(height: 50,),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Enter your email",
                prefixIcon: Icon(Icons.email),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none
                )
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Enter your password",
                  prefixIcon: Icon(Icons.lock),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none
                  )
              ),
            ),
            const SizedBox(height: 24,),
            ElevatedButton(
                onPressed: () {

                  if(_emailController.text.toString().isNotEmpty && _passwordController.text.toString().isNotEmpty)
                    {

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>Dasboard()));

                    }else {
                    final snackBar = SnackBar(content: Text("Please Enter All Fields"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                   fontWeight: FontWeight.bold
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}

