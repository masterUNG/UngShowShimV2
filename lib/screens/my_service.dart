import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ungshowshim/screens/home.dart';

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

  Widget signOutButton() {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        mySignOut();
      },
    );
  }

  Future<void> mySignOut()async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut().then((response){
      MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context) => Home());
      Navigator.of(context).pushAndRemoveUntil(materialPageRoute, (Route<dynamic> route) => false);
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
        title: showLogin(),actions: <Widget>[signOutButton()],
      ),
      body: Text('body'),
    );
  }
}
