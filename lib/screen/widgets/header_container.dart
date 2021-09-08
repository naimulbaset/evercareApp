import 'package:flutter/material.dart';

class HeaderContainer extends StatelessWidget {
  var text = "Login";

  HeaderContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.white],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                text,
                style: TextStyle(color: Colors.black, fontSize: 20),
              )),
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
        ],
      ),
    );
  }
}
