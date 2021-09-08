import 'package:flutter/material.dart';
import 'package:evercare/screen/DoctorVisit/AppointmentStatus.dart';

class AppointmentRequestScreen extends StatefulWidget {
  @override
  _AppointmentRequestScreenState createState() =>
      _AppointmentRequestScreenState();
}

class _AppointmentRequestScreenState extends State<AppointmentRequestScreen> {
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
            //isScrollable: true,
            tabs: [
              Tab(
                  child: Text(
                'New Appointment',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )),
              Tab(
                  child: Text(
                'Appointment Status',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              )),
            ],
          ),
          title: const Text('Appointment Request'),
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
                              fontFamily: 'Source Sans Pro',
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
                                  hint: Text('Specialization'),
                                  onChanged: (val) {
                                    print(val);
                                    setState(() {
                                      this.purpose = val;
                                    });
                                  },
                                  value: this.purpose,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text('Acute Pain Service'),
                                      value: 'Consultancy',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Child Development'),
                                      value: 'Follow up',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Dermatology'),
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
                                  hint: Text('Doctor Name'),
                                  onChanged: (val) {
                                    print(val);
                                    setState(() {
                                      this.purpose = val;
                                    });
                                  },
                                  value: this.purpose,
                                  items: [
                                    DropdownMenuItem(
                                      child:
                                          Text('Prof Dr Kazi Hasinur Rahman'),
                                      value: 'Consultancy',
                                    ),
                                    DropdownMenuItem(
                                      child:
                                          Text('Prof Dr Matiur rahman Molla'),
                                      value: 'Follow up',
                                    ),
                                    DropdownMenuItem(
                                      child: Text('Dr Fahmida Feousy'),
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
                      padding: EdgeInsets.all(16),
                      color: Colors.white,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.calendar_today_outlined),
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
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      color: Colors.white,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 8,
                        maxLength: 1000,
                        decoration: InputDecoration(
                          icon: Icon(Icons.drive_file_rename_outline),
                          hintText: 'Remarks',
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
                              onPressed: () {},
                              child: Text(
                                "Make Appointment",
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
                    'Latest Appointments',
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
                              label: Text('Appointment Date'),
                            ),
                            DataColumn(
                              label: Text('Facility name'),
                            ),
                            DataColumn(
                              label: Text('Doctor Name'),
                            ),
                            DataColumn(
                              label: Text('Status'),
                            ),
                            DataColumn(
                              label: Text('Payment'),
                            ),
                            DataColumn(
                              label: Text('Cancel'),
                            ),
                          ], rows: <DataRow>[
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('1')),
                                DataCell(Text('08/31/2021')),
                                DataCell(Text('Evercare Hospital Dhaka')),
                                DataCell(
                                    Text('Dr.K F M Ayaz , Internal Medicine')),
                                DataCell(Text('Approve')),
                                DataCell(Text('Paid')),
                                DataCell(Text('No')),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('2')),
                                DataCell(Text('09/01/2021')),
                                DataCell(Text('Evercare Hospital Dhaka')),
                                DataCell(
                                    Text('Dr.K F M Ayaz , Internal Medicine')),
                                DataCell(Text('Pending')),
                                DataCell(Text('Unpaid')),
                                DataCell(Text('No')),
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
