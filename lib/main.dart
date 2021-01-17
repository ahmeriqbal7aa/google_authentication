import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:google_authentication/Logout.dart';
import 'Users.dart';

final fireStore = FirebaseFirestore.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.orange),
      routes: {'/logout': (context) => LogoutPage()},
      home: GooglePage(),
    );
  }
}

class GooglePage extends StatefulWidget {
  @override
  _GooglePageState createState() => _GooglePageState();
}

class _GooglePageState extends State<GooglePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign In Page'),
      ),
      body: Center(
        child: GoogleSignInButton(
          darkMode: true,
          onPressed: () {
            signInWithGoogle().then((value) {
              fireStore
                  .collection('users')
                  .doc('auth')
                  .collection('googleUsers')
                  .add({'name': name, 'imageUrl': imageUrl, 'email': email});
            }).catchError((e) {
              print(e);
            }).then((value) {
              Navigator.pushNamed(context, '/logout');
            }).catchError((e) {
              print(e);
            });
          },
        ),
      ),
    );
  }
}
