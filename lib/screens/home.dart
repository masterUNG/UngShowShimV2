import 'package:flutter/material.dart';
import 'package:ungshowshim/screens/my_style.dart';
import 'package:ungshowshim/screens/register.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Explicit

  // Method

  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Ung Show Shim 123',
      style: TextStyle(
        fontSize: 30.0,
        color: MyStyle().textColor,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontFamily: 'Mansalva',
      ),
    );
  }

  Widget singInButton() {
    return RaisedButton(
      color: MyStyle().textColor,
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget signUpButton() {
    return OutlineButton(
      child: Text('Sign Up'),
      onPressed: () {
        print('You Click Sign Up');

        MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context) => Register()); //ภาษาไทยได้ครับ
        Navigator.of(context).push(materialPageRoute);

      },
    );
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        singInButton(),
        SizedBox(
          width: 4.0,
        ),
        signUpButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/wallpaper.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(padding: EdgeInsets.all(30.0),
              color: Color.fromRGBO(255, 255, 255, 0.6),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  showLogo(),
                  SizedBox(
                    height: 8.0,
                  ),
                  showAppName(),
                  SizedBox(
                    height: 8.0,
                  ),
                  showButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
