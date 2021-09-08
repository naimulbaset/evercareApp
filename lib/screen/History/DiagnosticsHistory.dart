import 'package:flutter/material.dart';
import 'package:evercare/screen/api/pdf_api.dart';
import 'package:evercare/screen/api/pdf_api.dart';
import 'package:evercare/screen/api/pdf_invoice_api.dart';
import 'package:evercare/screen/model/customer.dart';
import 'package:evercare/screen/model/invoice.dart';
import 'package:evercare/screen/model/supplier.dart';

class DiagnosticsHistoryScreen extends StatefulWidget {
  @override
  _DiagnosticsHistoryScreenState createState() =>
      _DiagnosticsHistoryScreenState();
}

class _DiagnosticsHistoryScreenState extends State<DiagnosticsHistoryScreen> {
  List<bool> isSelected;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TimeOfDay time;
  TimeOfDay picked;
  DateTime _dateTime;
  String category;
  String brand;
  String subCategory;
  String model;
  String date;
  String supplier;
  String order;
  String todayDate;
  String todayDate2;

  @override
  void initState() {
    isSelected = [true, false];
    super.initState();

    time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                  child: Text(
                'Laboratory Report',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              )),
              Tab(
                  child: Text(
                'Radiology Other',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              )),
              Tab(
                  child: Text(
                'Attached Report',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              )),
            ],
          ),
          title: const Text('Diagnostics History'),
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
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    padding: EdgeInsets.fromLTRB(10, 10, 50, 10),
                    //height: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: (Colors.blue.withOpacity(0.3)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            RaisedButton(
                              child: Text('From Date'),
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(3000))
                                    .then((date) {
                                  setState(() {
                                    _dateTime = date;

                                    todayDate =
                                        "${_dateTime.day.toString().padLeft(2, '0')}/${_dateTime.month.toString().padLeft(2, '0')}/${_dateTime.year.toString()}";
                                  });
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            Text(
                              _dateTime == null ? 'Select Date' : '$todayDate',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            RaisedButton(
                              child: Text('To Date'),
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(3000))
                                    .then((date) {
                                  setState(() {
                                    _dateTime = date;

                                    todayDate2 =
                                        "${_dateTime.day.toString().padLeft(2, '0')}/${_dateTime.month.toString().padLeft(2, '0')}/${_dateTime.year.toString()}";
                                  });
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            Text(
                              _dateTime == null ? 'Select Date' : '$todayDate2',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        DropdownButton(
                          isExpanded: true,
                          hint: Text(
                            'Report type',
                            style: TextStyle(color: Colors.black),
                          ),
                          onChanged: (val) {
                            supplier = val;
                            print(val);
                            setState(() {
                              this.supplier = val;
                            });
                          },
                          value: this.supplier,
                          items: [
                            DropdownMenuItem(
                              child: Text('OPD'),
                              value: 'Walton',
                            ),
                            DropdownMenuItem(
                              child: Text('IPD'),
                              value: 'Samsung',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              height: 40.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
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
                                color: Colors.blue[900],
                                textColor: Colors.white,
                                child: Text("Search",
                                    style: TextStyle(fontSize: 10)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              height: 40.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
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
                                color: Colors.red[400],
                                textColor: Colors.white,
                                child: Text("Clear",
                                    style: TextStyle(fontSize: 10)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Laboratory Report',
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
                              label: Text('LabNo'),
                            ),
                            DataColumn(
                              label: Text('Invoice No'),
                            ),
                            DataColumn(
                              label: Text('Date'),
                            ),
                            DataColumn(
                              label: Text('Service Name'),
                            ),
                            DataColumn(
                              label: Text('Status'),
                            ),
                            DataColumn(
                              label: Text('Action'),
                            ),
                          ], rows: <DataRow>[])),
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
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    padding: EdgeInsets.fromLTRB(10, 10, 50, 10),
                    //height: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: (Colors.blue.withOpacity(0.3)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            RaisedButton(
                              child: Text('From Date'),
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(3000))
                                    .then((date) {
                                  setState(() {
                                    _dateTime = date;

                                    todayDate =
                                        "${_dateTime.day.toString().padLeft(2, '0')}/${_dateTime.month.toString().padLeft(2, '0')}/${_dateTime.year.toString()}";
                                  });
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            Text(
                              _dateTime == null ? 'Select Date' : '$todayDate',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            RaisedButton(
                              child: Text('To Date'),
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(3000))
                                    .then((date) {
                                  setState(() {
                                    _dateTime = date;

                                    todayDate2 =
                                        "${_dateTime.day.toString().padLeft(2, '0')}/${_dateTime.month.toString().padLeft(2, '0')}/${_dateTime.year.toString()}";
                                  });
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            Text(
                              _dateTime == null ? 'Select Date' : '$todayDate2',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        DropdownButton(
                          isExpanded: true,
                          hint: Text(
                            'Report type',
                            style: TextStyle(color: Colors.black),
                          ),
                          onChanged: (val) {
                            supplier = val;
                            print(val);
                            setState(() {
                              this.supplier = val;
                            });
                          },
                          value: this.supplier,
                          items: [
                            DropdownMenuItem(
                              child: Text('OPD'),
                              value: 'Walton',
                            ),
                            DropdownMenuItem(
                              child: Text('IPD'),
                              value: 'Samsung',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              height: 40.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
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
                                color: Colors.blue[900],
                                textColor: Colors.white,
                                child: Text("Search",
                                    style: TextStyle(fontSize: 10)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              height: 40.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
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
                                color: Colors.red[400],
                                textColor: Colors.white,
                                child: Text("Clear",
                                    style: TextStyle(fontSize: 10)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Radiology Other',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Playfair Display',
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
                              label: Text('LabNo'),
                            ),
                            DataColumn(
                              label: Text('Invoice No'),
                            ),
                            DataColumn(
                              label: Text('Date'),
                            ),
                            DataColumn(
                              label: Text('Service Name'),
                            ),
                            DataColumn(
                              label: Text('Status'),
                            ),
                            DataColumn(
                              label: Text('Action'),
                            ),
                          ], rows: <DataRow>[])),
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
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    padding: EdgeInsets.fromLTRB(10, 10, 50, 10),
                    //height: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: (Colors.blue.withOpacity(0.3)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            RaisedButton(
                              child: Text('From Date'),
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(3000))
                                    .then((date) {
                                  setState(() {
                                    _dateTime = date;

                                    todayDate =
                                        "${_dateTime.day.toString().padLeft(2, '0')}/${_dateTime.month.toString().padLeft(2, '0')}/${_dateTime.year.toString()}";
                                  });
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            Text(
                              _dateTime == null ? 'Select Date' : '$todayDate',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            RaisedButton(
                              child: Text('To Date'),
                              onPressed: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(3000))
                                    .then((date) {
                                  setState(() {
                                    _dateTime = date;

                                    todayDate2 =
                                        "${_dateTime.day.toString().padLeft(2, '0')}/${_dateTime.month.toString().padLeft(2, '0')}/${_dateTime.year.toString()}";
                                  });
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            Text(
                              _dateTime == null ? 'Select Date' : '$todayDate2',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        DropdownButton(
                          isExpanded: true,
                          hint: Text(
                            'Report type',
                            style: TextStyle(color: Colors.black),
                          ),
                          onChanged: (val) {
                            supplier = val;
                            print(val);
                            setState(() {
                              this.supplier = val;
                            });
                          },
                          value: this.supplier,
                          items: [
                            DropdownMenuItem(
                              child: Text('OPD'),
                              value: 'Walton',
                            ),
                            DropdownMenuItem(
                              child: Text('IPD'),
                              value: 'Samsung',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              height: 40.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
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
                                color: Colors.blue[900],
                                textColor: Colors.white,
                                child: Text("Search",
                                    style: TextStyle(fontSize: 10)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              height: 40.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
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
                                color: Colors.red[400],
                                textColor: Colors.white,
                                child: Text("Clear",
                                    style: TextStyle(fontSize: 10)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Attached Report',
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
                              label: Text('LabNo'),
                            ),
                            DataColumn(
                              label: Text('Invoice No'),
                            ),
                            DataColumn(
                              label: Text('Date'),
                            ),
                            DataColumn(
                              label: Text('Service Name'),
                            ),
                            DataColumn(
                              label: Text('Status'),
                            ),
                            DataColumn(
                              label: Text('Action'),
                            ),
                          ], rows: <DataRow>[
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('1')),
                                DataCell(Text('56')),
                                DataCell(Text('0989')),
                                DataCell(Text('08/07/2021')),
                                DataCell(Text('PNS')),
                                DataCell(Text('Ready')),
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
                                            name: 'EverCare Hospital Dhaka',
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
                                      child: Text("Download",
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
          ],
        ),
      ),
    );
  }
}
