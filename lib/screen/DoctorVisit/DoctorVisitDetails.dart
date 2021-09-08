import 'package:flutter/material.dart';
import 'package:evercare/screen/api/pdf_api.dart';
import 'package:evercare/screen/api/pdf_api.dart';
import 'package:evercare/screen/api/pdf_invoice_api.dart';
import 'package:evercare/screen/model/customer.dart';
import 'package:evercare/screen/model/invoice.dart';
import 'package:evercare/screen/model/supplier.dart';
import 'package:evercare/screen/DoctorVisit/DoctorVisitDetails.dart';

class DoctorVisitDetails extends StatefulWidget {
  @override
  _DoctorVisitDetailsState createState() => _DoctorVisitDetailsState();
}

class _DoctorVisitDetailsState extends State<DoctorVisitDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text('Doctor Visit Details',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.bold,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'View Details',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                  letterSpacing: 0,
                  // backgroundColor: Colors.indigoAccent
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                padding: EdgeInsets.fromLTRB(30, 30, 0, 30),
                //height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue[900]),
                  color: (Colors.blue.withOpacity(0.3)),
                ),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          'Date & Time:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '08/07/2021 3:04PM',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            'Doctor Name,Specialization:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '08/07/2021 3:04PM',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'OP/IP:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'OutPatient',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
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
                              child: Text(
                                "Prescription Summary",
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
