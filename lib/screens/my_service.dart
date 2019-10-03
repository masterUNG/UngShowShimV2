import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Explcit
  String nameLogin = '';

  // Method
  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Future<void> findDisplayName() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();

    setState(() {
      nameLogin = firebaseUser.displayName;
      print('nameLogin = $nameLogin');
    });
  }

  Widget showLogin() {
    return Column(
      children: <Widget>[
        Text('Welcome My App'),
        Text('Login by $nameLogin'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: showLogin(),
      ),
      body: Text('body'),
    );
  }
}
