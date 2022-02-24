import 'package:flutter/material.dart';
import 'package:evercare/screen/api/pdf_api.dart';
import 'package:evercare/screen/api/pdf_api.dart';
import 'package:evercare/screen/api/pdf_invoice_api.dart';
import 'package:evercare/screen/model/customer.dart';
import 'package:evercare/screen/model/invoice.dart';
import 'package:evercare/screen/model/supplier.dart';
import 'package:evercare/screen/DoctorVisit/DoctorVisitDetails.dart';

class RecentDoctorVisitScreen extends StatefulWidget {
  @override
  _RecentDoctorVisitScreenState createState() =>
      _RecentDoctorVisitScreenState();
}

class _RecentDoctorVisitScreenState extends State<RecentDoctorVisitScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            //isScrollable: true,
            tabs: [
              Tab(
                  child: Text(
                'Option 1',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )),
              Tab(
                  child: Text(
                'Option 2',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              )),
            ],
          ),
          title: const Text('Recent Doctor Visit'),
        ),
        resizeToAvoidBottomInset: false,
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'View Details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 0,
                      // backgroundColor: Colors.indigoAccent
                    ),
                  ),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(columns: <DataColumn>[
                            DataColumn(
                              label: Text('S.No'),
                            ),
                            DataColumn(
                              label: Text('Date & Time'),
                            ),
                            DataColumn(
                              label: Text('Doctor Name,Specialization'),
                            ),
                            DataColumn(
                              label: Text('OP/IP'),
                            ),
                            DataColumn(
                              label: Text('Prescription/ Discharge Summary'),
                            ),
                          ], rows: <DataRow>[
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('1')),
                                DataCell(Text('08/07/2021 3:04PM')),
                                DataCell(Text('Dr.Rahman, Internal Medicine')),
                                DataCell(Text('OutPatient')),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    height: 40.0,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(
                                              color: Color.fromRGBO(
                                                  0, 160, 227, 1))),
                                      onPressed: () async {
                                        final date = DateTime.now();
                                        final dueDate =
                                            date.add(Duration(days: 7));
                                        Text('kkkk');

                                        final invoice = Invoice(
                                          supplier: Supplier(
                                            name: 'Xyz Hospital',
                                            // address: 'Sarah Street 9, Beijing, China',
                                            // paymentInfo: 'https://paypal.me/sarahfieldzz',
                                          ),
                                          customer: Customer(
                                            name: 'Mr Xyz',
                                            address: 'Phone No:0159840',
                                          ),
                                          info: InvoiceInfo(
                                            date: date,
                                            dueDate: dueDate,
                                            description: '',
                                            number:
                                                '${DateTime.now().year}-9999',
                                          ),
                                          items: [
                                            InvoiceItem(
                                              description: '2345',
                                              //date: DateTime.now(),
                                              quantity: 5,
                                              vat: 0.19,
                                              unitPrice: 0.99,
                                            ),
                                          ],
                                        );

                                        final pdfFile =
                                            await PdfInvoiceApi.generate(
                                                invoice);

                                        PdfApi.openFile(pdfFile);
                                      },
                                      padding: EdgeInsets.all(6.0),
                                      color: Color.fromRGBO(0, 160, 227, 1),
                                      textColor: Colors.white,
                                      child: Text("View",
                                          style: TextStyle(fontSize: 10)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('2')),
                                DataCell(Text('03/05/2021 3:20PM')),
                                DataCell(Text('Dr.Wilson , Dermatology')),
                                DataCell(Text('OutPatient')),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    height: 40.0,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(
                                              color: Color.fromRGBO(
                                                  0, 160, 227, 1))),
                                      onPressed: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) {
                                        //       return HomeScreen();
                                        //     },
                                        //   ),
                                        // );
                                      },
                                      padding: EdgeInsets.all(6.0),
                                      color: Color.fromRGBO(0, 160, 227, 1),
                                      textColor: Colors.white,
                                      child: Text("View",
                                          style: TextStyle(fontSize: 10)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('3')),
                                DataCell(Text('19/01/2021 10:18AM')),
                                DataCell(Text('Dr.Kathy Smith, Dermatology')),
                                DataCell(Text('OutPatient')),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    height: 40.0,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(
                                              color: Color.fromRGBO(
                                                  0, 160, 227, 1))),
                                      onPressed: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) {
                                        //       return HomeScreen();
                                        //     },
                                        //   ),
                                        // );
                                      },
                                      padding: EdgeInsets.all(6.0),
                                      color: Color.fromRGBO(0, 160, 227, 1),
                                      textColor: Colors.white,
                                      child: Text("View",
                                          style: TextStyle(fontSize: 10)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ])),
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Option 2',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 0,
                      // backgroundColor: Colors.indigoAccent
                    ),
                  ),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(columns: <DataColumn>[
                            DataColumn(
                              label: Text('Date & Time'),
                            ),
                            DataColumn(
                              label: Text('Doctor Name, \nSpecialization'),
                            ),
                          ], rows: <DataRow>[
                            DataRow(
                              cells: <DataCell>[
                                DataCell(FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return DoctorVisitDetails();
                                          },
                                        ),
                                      );
                                    },
                                    child: Text(
                                      '08/07/2021 3:04PM',
                                      style: TextStyle(color: Colors.black),
                                    ))),
                                DataCell(Wrap(
                                  children: [
                                    Text(
                                      'Dr.Rahman , \n Internal Medicine',
                                      style: TextStyle(),
                                    )
                                  ],
                                )),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(FlatButton(
                                    onPressed: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) {
                                      //       return TruckDetailsScreen();
                                      //     },
                                      //   ),
                                      // );
                                    },
                                    child: Text(
                                      '09/07/2021 3:34PM',
                                      style: TextStyle(color: Colors.black),
                                    ))),
                                DataCell(Text('Dr.Wilson , \n Dermatology')),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(FlatButton(
                                    onPressed: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) {
                                      //       return TruckDetailsScreen();
                                      //     },
                                      //   ),
                                      // );
                                    },
                                    child: Text(
                                      '10/07/2021 2:00PM',
                                      style: TextStyle(color: Colors.black),
                                    ))),
                                DataCell(
                                    Text('Dr.Kathy Smith , \n Dermatology')),
                              ],
                            ),
                          ])),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
