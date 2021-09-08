import 'package:flutter/material.dart';
import 'package:evercare/screen/widgets/header_container.dart';
import 'package:evercare/screen/start/home.dart';
import 'package:evercare/screen/start/reg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String email;
  String password;
  String registerAs;
  String designation;

  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/p1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            children: <Widget>[
              // HeaderContainer(
              //   "",
              // ),
              Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: Stack(
                    children: [
                      Container(
                        width: 280,
                        height: 170,
                        decoration: BoxDecoration(
                            // border: Border.all(
                            //   width: 4,
                            //   color: Colors.green[900],
                            // ),
                            //shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("images/e1.png"))),
                      ),
                    ],
                  ),
                ),
              ),

              Form(
                key: _formkey,
                child: Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          color: Colors.white,
                          child: TextFormField(
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Field cannot be empty";
                              }
                              if (!RegExp(
                                      '^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]+.[com]')
                                  .hasMatch(value)) {
                                return "example@gmail.com";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              email = value.trim();
                              //Do something with the user input.
                            },
                            decoration: InputDecoration(
                              icon: Icon(Icons.rate_review),
                              hintText: 'Enter your UHID',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          color: Colors.white,
                          child: TextFormField(
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Field cannot be empty";
                              }

                              return null;
                            },
                            obscureText: true,
                            onChanged: (value) {
                              password = value;
                              //Do something with the user input.
                            },
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              hintText: 'Enter your Password',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20.0),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 50,
                        // ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                            onPressed: () async {},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 15),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 50.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(
                                    color: Color.fromRGBO(0, 160, 227, 1))),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return HomeScreen();
                                  },
                                ),
                              );
                            },
                            padding: EdgeInsets.all(10.0),
                            color: Color.fromRGBO(0, 160, 227, 1),
                            textColor: Colors.white,
                            child:
                                Text("Log In", style: TextStyle(fontSize: 15)),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Don't have an account ? ",
                                style: TextStyle(
                                    fontFamily: 'Source Sans Pro',
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ]),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 50.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(
                                    color: Color.fromRGBO(0, 160, 227, 1))),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return UserRegScreen();
                                  },
                                ),
                              );
                            },
                            padding: EdgeInsets.all(10.0),
                            color: Colors.white,
                            textColor: Color.fromRGBO(0, 160, 227, 1),
                            child:
                                Text("Sign Up", style: TextStyle(fontSize: 15)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _textInput({controller, hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
