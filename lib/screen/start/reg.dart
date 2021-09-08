import 'package:flutter/material.dart';

class UserRegScreen extends StatefulWidget {
  @override
  _UserRegScreenState createState() => _UserRegScreenState();
}

class _UserRegScreenState extends State<UserRegScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String designation;
  String registerAs;
  String username;
  String email;
  String phone;
  String password;
  String TruckDriver;
  String TruckOwner;
  String Sender;
  String Admin;
  bool isLoading = false;

  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.deepPurple.withOpacity(0.3),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/p1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: <Widget>[
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
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        color: Colors.white,
                        child: TextFormField(
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Field cannot be empty";
                            }

                            return null;
                          },
                          onChanged: (value) {
                            username = value;
                            //Do something with the user input.
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.person_outline),
                            hintText: 'User Name',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20.0),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        color: Colors.white,
                        child: TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.mail_outline),
                            hintText: 'Enter your email',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20.0),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        color: Colors.white,
                        child: TextFormField(
                          validator: (String value) {
                            if (value.isNotEmpty) {
                              if (value.length != 11) {
                                return "Enter Valid Number";
                              }
                              if (!RegExp('^[0-9]{11}').hasMatch(value)) {
                                return "Please enter 11 digit";
                              }
                            }

                            return null;
                          },
                          onChanged: (value) {
                            phone = value;
                            //Do something with the user input.
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.phone_android),
                            hintText: 'Enter your mobile No',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20.0),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        color: Colors.white,
                        child: TextFormField(
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Field cannot be empty";
                            }
                            if (value.length < 6) {
                              return "Minimum 6 Digits required";
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
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        color: Colors.white,
                        child: TextFormField(
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Field cannot be empty";
                            }
                            if (value.length < 6) {
                              return "Minimum 6 Digits required";
                            }

                            return null;
                          },
                          obscureText: true,
                          onChanged: (value) {
                            password = value;
                            //Do something with the user input.
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.security),
                            hintText: 'Re-Type Password',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        //margin: EdgeInsets.fromLTRB(20, 550, 20, 60),
                        child: Column(
                          children: [
                            Center(
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 50),
                                color: Colors.blue[700],
                                onPressed: () async {},
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      fontFamily: 'Source Sans Pro',
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
