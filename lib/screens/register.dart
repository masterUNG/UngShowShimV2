import 'package:flutter/material.dart';
import 'package:ungshowshim/screens/my_service.dart';
import 'package:ungshowshim/screens/my_style.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  String name, email, password;
  final formKey = GlobalKey<FormState>();

  // Method
  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      tooltip: 'Upload Value to my Database',
      onPressed: () {
        formKey.currentState.save();
        print('name = $name, email = $email, password = $password');
        registerThread();
      },
    );
  }

  Future<void> registerThread() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((response) {
          print('Register Success');
          setupDisplayName();
        })
        .catchError((response) {
          String title = response.code;
          String message = response.message;
          print('title = $title, massage = $message');
        });
  }

  Future<void> setupDisplayName()async{

    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.currentUser().then((response){
      UserUpdateInfo userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = name;
      response.updateProfile(userUpdateInfo);

      MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context).pushAndRemoveUntil(materialPageRoute, (Route<dynamic> route) => false);

    });

  }

  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.face,
          size: 36.0,
        ),
        labelText: 'Display Name :',
        helperText: 'Type Your Name',
      ),
      onSaved: (String value) {
        name = value.trim();
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(
          Icons.email,
          size: 36.0,
        ),
        labelText: 'Email :',
        helperText: 'Type Your Email',
      ),
      onSaved: (String value) {
        email = value.trim();
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.lock,
          size: 36.0,
        ),
        labelText: 'Password :',
        helperText: 'Type Your Password',
      ),
      onSaved: (String value) {
        password = value.trim();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().textColor,
        title: Text('Register'),
        actions: <Widget>[registerButton()],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(40.0),
          children: <Widget>[
            nameText(),
            emailText(),
            passwordText(),
          ],
        ),
      ),
    );
  }
}
