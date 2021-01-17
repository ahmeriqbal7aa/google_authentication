import 'package:flutter/material.dart';
import 'Users.dart';

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Out Page'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // here signOutFunction() method will be called
            signOutFunction();
            Navigator.pop(context);
          },
          child: Text('Sign out'),
        ),
      ),
    );
  }
}
