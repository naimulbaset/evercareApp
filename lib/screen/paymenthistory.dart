import 'package:flutter/material.dart';
import 'package:evercare/screen/api/pdf_api.dart';
import 'package:evercare/screen/api/pdf_api.dart';
import 'package:evercare/screen/api/pdf_invoice_api.dart';
import 'package:evercare/screen/model/customer.dart';
import 'package:evercare/screen/model/invoice.dart';
import 'package:evercare/screen/model/supplier.dart';

class PaymentHistory extends StatefulWidget {
  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment History'),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
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
                          label: Text('Date'),
                        ),
                        DataColumn(
                          label: Text('Invoice No'),
                        ),
                        DataColumn(
                          label: Text('Amount'),
                        ),
                        DataColumn(
                          label: Text('Action'),
                        ),
                      ], rows: <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('1')),
                            DataCell(Text('08/07/2021')),
                            DataCell(Text('23456')),
                            DataCell(Text('20,000')),
                            DataCell(
                              Container(
                                margin: EdgeInsets.all(10),
                                height: 40.0,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color:
                                              Color.fromRGBO(0, 160, 227, 1))),
                                  onPressed: () async {
                                    final date = DateTime.now();
                                    final dueDate = date.add(Duration(days: 7));
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
                                        number: '${DateTime.now().year}-9999',
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
                                        await PdfInvoiceApi.generate(invoice);

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
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('2')),
                            DataCell(Text('09/07/2021')),
                            DataCell(Text('23490')),
                            DataCell(Text('80,000')),
                            DataCell(
                              Container(
                                margin: EdgeInsets.all(10),
                                height: 40.0,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color:
                                              Color.fromRGBO(0, 160, 227, 1))),
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
      ),
    );
  }
}
