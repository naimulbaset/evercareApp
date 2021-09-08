import 'package:flutter/material.dart';
import 'package:evercare/screen/start/login.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/p1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                        child: Text(
                          "Welcome",
                          style: TextStyle(
                              fontFamily: 'Playfair Display',
                              fontSize: 60,
                              letterSpacing: 2,
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
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
                    SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.blue[200], Colors.blue[900]],
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        child: Center(
                            child: Text(
                          "START",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0,
                            fontSize: 20,
                            fontFamily: 'Playfair Display',
                          ),
                        )),
                      ),
                    ),
                    // Center(
                    //     child: Container(
                    //   margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                    //   height: 120.0,
                    //   child: SizedBox.fromSize(
                    //     size: Size(120, 100), // button width and height
                    //     child: ClipOval(
                    //       child: Material(
                    //         color: Colors.blue[500], // button color
                    //         child: InkWell(
                    //           splashColor: Colors.purple,
                    //           // splash color
                    //           onTap: () {
                    //             Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                 builder: (context) {
                    //                   return LoginScreen();
                    //                 },
                    //               ),
                    //             );
                    //           },
                    //           // button pressed
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: <Widget>[
                    //               Icon(
                    //                 Icons.arrow_forward,
                    //                 color: Colors.white,
                    //               ), // icon
                    //               Text(
                    //                 "START",
                    //                 style: TextStyle(
                    //                   fontFamily: 'Playfair Display',
                    //                   letterSpacing: 2,
                    //                   fontSize: 18,
                    //                   fontWeight: FontWeight.bold,
                    //                   color: Colors.white,
                    //                 ),
                    //               ), // text
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
