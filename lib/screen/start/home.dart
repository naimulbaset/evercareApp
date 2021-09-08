import 'package:flutter/material.dart';
import 'package:evercare/screen/DoctorVisit/recentDoctorVisit.dart';
import 'package:evercare/screen/History/DiagnosticsHistory.dart';
import 'package:evercare/screen/DoctorVisit/AppointmentRequest.dart';
import 'package:evercare/screen/Writeus/writeus.dart';
import 'package:evercare/screen/paymenthistory.dart';
import 'package:evercare/screen/Writeus/feedback.dart';
import 'package:evercare/screen/payment/AdvancePayment.dart';
import 'package:evercare/screen/Writeus/FAQ.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/p1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            primary: false,
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(15),
                sliver: SliverGrid.count(
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 30,
                  crossAxisCount: 2,
                  children: <Widget>[
                    Material(
                      elevation: 18.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: FlatButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.info_outline,
                                size: 80,
                                color: Colors.white,
                              ),
                            ),
                            // IconButton(
                            //   icon:
                            //   iconSize: 80,
                            //   color: Colors.white,
                            //   onPressed: () {},
                            // ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: const Text(
                                "Patient Portal Info",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Playfair Display',
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      color: Colors.deepPurple[300],
                    ),
                    Material(
                      elevation: 18.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RecentDoctorVisitScreen();
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.history,
                                size: 80,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: const Text(
                                "Recent Doctor Visit",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Playfair Display',
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      color: Colors.teal[600],
                    ),
                    Material(
                      elevation: 18.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DiagnosticsHistoryScreen();
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.filter_alt,
                                size: 80,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: const Text(
                                "Diagnostics History",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Playfair Display',
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      color: Colors.purpleAccent[100],
                    ),
                    Material(
                      elevation: 18.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return AppointmentRequestScreen();
                                },
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.medical_services_outlined,
                                  size: 80,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                child: const Text(
                                  "Appointment Request",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Playfair Display',
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      color: Colors.purple[600],
                    ),
                    Material(
                      elevation: 18.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return WriteUsScreen();
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.question_answer,
                                size: 80,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: const Text(
                                "Write Us",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Playfair Display',
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      color: Colors.amber[400],
                    ),
                    Material(
                      elevation: 18.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return PaymentHistory();
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.payment_outlined,
                                size: 80,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: const Text(
                                "payment history",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Playfair Display',
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      color: Colors.blue[300],
                    ),
                    Material(
                      elevation: 18.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return FeedbackScreen();
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.feedback_outlined,
                                size: 80,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: const Text(
                                "Feedback",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Playfair Display',
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      color: Colors.green[300],
                    ),
                    Material(
                      elevation: 18.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return FAQscreen();
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.chat_bubble_outline,
                                size: 80,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: const Text(
                                "FAQ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Playfair Display',
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      color: Colors.deepOrange[500],
                    ),
                    Material(
                      elevation: 18.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AdvancePaymentScreen();
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.payments,
                                size: 80,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: const Text(
                                "Advance Payment",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Playfair Display',
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      color: Colors.deepOrangeAccent[100],
                    ),
                    Material(
                      elevation: 18.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: FlatButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return AdvancePaymentScreen();
                          //     },
                          //   ),
                          // );
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.miscellaneous_services_sharp,
                                size: 80,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: const Text(
                                "Services",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Playfair Display',
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      color: Colors.cyanAccent[400],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
