import 'package:flutter/material.dart';
import 'package:evercare/screen/DoctorVisit/AppointmentStatus.dart';
import 'package:evercare/screen/payment/paymentSuccess.dart';
import 'package:evercare/screen/api/pdf_api.dart';
import 'package:evercare/screen/api/pdf_api.dart';
import 'package:evercare/screen/api/pdf_invoice_api.dart';
import 'package:evercare/screen/model/customer.dart';
import 'package:evercare/screen/model/invoice.dart';
import 'package:evercare/screen/model/supplier.dart';
import 'package:flutter/services.dart';
import 'package:sslcommerz_flutter/model/SSLCAdditionalInitializer.dart';
import 'package:sslcommerz_flutter/model/SSLCCustomerInfoInitializer.dart';
import 'package:sslcommerz_flutter/model/SSLCEMITransactionInitializer.dart';
import 'package:sslcommerz_flutter/model/SSLCSdkType.dart';
import 'package:sslcommerz_flutter/model/SSLCShipmentInfoInitializer.dart';
import 'package:sslcommerz_flutter/model/SSLCTransactionInfoModel.dart';
import 'package:sslcommerz_flutter/model/SSLCommerzInitialization.dart';
import 'package:sslcommerz_flutter/model/SSLCurrencyType.dart';
import 'package:sslcommerz_flutter/model/sslproductinitilizer/General.dart';
import 'package:sslcommerz_flutter/model/sslproductinitilizer/SSLCProductInitializer.dart';
import 'package:sslcommerz_flutter/sslcommerz.dart';

class AdvancePaymentScreen extends StatefulWidget {
  @override
  _AdvancePaymentScreenState createState() => _AdvancePaymentScreenState();
}

class _AdvancePaymentScreenState extends State<AdvancePaymentScreen> {
  List<bool> isSelected;
  TimeOfDay time;
  TimeOfDay picked;
  String timee;
  int sl;
  String name;
  String phone;
  String purpose;
  String fee;

  DateTime _dateTime;
  String todayDate;
  String todayDate2;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
    time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                  child: Text(
                'Advance Payment',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )),
              Tab(
                  child: Text(
                'Advance Payment Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              )),
            ],
          ),
          title: const Text('Advance Payment'),
        ),
        resizeToAvoidBottomInset: false,
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text('ENTER DETAILS',
                          style: TextStyle(
                              fontFamily: 'Playfair Display',
                              fontSize: 20,
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Container(
                        //padding: EdgeInsets.all(8),
                        color: Colors.white,
                        //margin: EdgeInsets.fromLTRB(20, 130, 20, 50),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(16),
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  hint: Text('Facility Name'),
                                  onChanged: (val) {
                                    print(val);
                                    setState(() {
                                      this.purpose = val;
                                    });
                                  },
                                  value: this.purpose,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text('Evercare Hospital Dhaka'),
                                      value: 'Consultancy',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Evercare Hospital Dhaka'),
                                      value: 'Follow up',
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      child: Container(
                        //padding: EdgeInsets.all(8),
                        color: Colors.white,
                        //margin: EdgeInsets.fromLTRB(20, 130, 20, 50),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(16),
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  hint: Text('Advanced Type'),
                                  onChanged: (val) {
                                    print(val);
                                    setState(() {
                                      this.purpose = val;
                                    });
                                  },
                                  value: this.purpose,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text('OPD Advance'),
                                      value: 'Consultancy',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('IP Collection'),
                                      value: 'Follow up',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Booking Advance'),
                                      value: 'Follow up',
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      color: Colors.white,
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.money_outlined),
                          hintText: 'Amount',
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
                              color: Colors.blue.withOpacity(0.9),
                              onPressed: () async {
                                sslCommerzCustomizedCall().then((value) async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return PaymentSuccessScreen();
                                      },
                                    ),
                                  );
                                }).catchError((e) {
                                  print('error caught');
                                  print(e.message);
                                });
                              },
                              child: Text(
                                "Advance Payment",
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
                              color: Colors.red[400].withOpacity(0.9),
                              onPressed: () {},
                              child: Text(
                                "Cancel",
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
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Advance Payment List',
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
                              label: Text('Facility name'),
                            ),
                            DataColumn(
                              label: Text('Receipt No'),
                            ),
                            DataColumn(
                              label: Text('Receipt Date'),
                            ),
                            DataColumn(
                              label: Text('Amount'),
                            ),
                            DataColumn(
                              label: Text('Type'),
                            ),
                            DataColumn(
                              label: Text('Action'),
                            ),
                          ], rows: <DataRow>[
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('1')),
                                DataCell(Text('Evercare Hospital Dhaka')),
                                DataCell(Text('456')),
                                DataCell(Text('08/31/2021')),
                                DataCell(Text('70,000')),
                                DataCell(Text('Card')),
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

Future<void> sslCommerzCustomizedCall() async {
  Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
          ipn_url: "www.ipnurl.com",
          currency: SSLCurrencyType.BDT,
          product_category: "Food",
          sdkType: SSLCSdkType.TESTBOX,
          store_id: 'mstec602216c516812',
          store_passwd: 'mstec602216c516812@ssl',
          total_amount: 20000,
          tran_id: "1231321321321312"));

  sslcommerz
      .addCustomerInfoInitializer(
          customerInfoInitializer: SSLCCustomerInfoInitializer(
              customerName: null,
              customerEmail: null,
              customerAddress1: null,
              customerCity: null,
              customerPostCode: null,
              customerCountry: null,
              customerPhone: ''))
      .addProductInitializer(
          sslcProductInitializer: SSLCProductInitializer(
              productName: "Parking Booking",
              productCategory: "Parking",
              general: General(
                  general: "General Purpose",
                  productProfile: "Product Profile")));
  var result = await sslcommerz.payNow();
  if (result is PlatformException) {
    print("the response is: " + result.message + " code: " + result.code);
  } else {
    SSLCTransactionInfoModel model = result;
  }
}
