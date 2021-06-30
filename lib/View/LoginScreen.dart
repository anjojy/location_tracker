import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location_tracker/Constants/StaticText.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 20),
                child: Center(
                  child: Container(
                      width: size.width * 0.3,
                      height: size.height * 0.3,
                      child: Image.network(StaticText.imageIcon)),
                ),
              ),
              TextField(
                onChanged: (email) => StaticText.userName = email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter Your Email'),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                obscureText: true,
                onChanged: (password) => StaticText.password = password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter Your Password'),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: size.height * 0.065,
                width: size.width * 0.6,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(7)),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      if (StaticText.userName == "admin" &&
                          StaticText.password == "admin")
                        Navigator.of(context).pushReplacementNamed("/homepage");
                      else {
                        Fluttertoast.showToast(
                            msg: StaticText.validationErrorText,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    });
                  },
                  child: Text(
                    StaticText.loginBtnText,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
