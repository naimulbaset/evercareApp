import 'package:flutter/material.dart';
import 'package:evercare/screen/DoctorVisit/AppointmentStatus.dart';

class WriteUsScreen extends StatefulWidget {
  @override
  _WriteUsScreenState createState() => _WriteUsScreenState();
}

class _WriteUsScreenState extends State<WriteUsScreen> {
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
    super.initState();
    time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Write Us'),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/p1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text('Call Back',
                                style: TextStyle(
                                    fontFamily: 'Playfair Display',
                                    fontSize: 25,
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 30,
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
                                      color: Colors.white,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          icon: Icon(
                                              Icons.drive_file_rename_outline),
                                          hintText: 'Reg No:23456',
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 20.0, horizontal: 20.0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          icon: Icon(
                                              Icons.drive_file_rename_outline),
                                          hintText: 'Name: Mrs Xyz',
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 20.0, horizontal: 20.0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          icon: Icon(
                                              Icons.drive_file_rename_outline),
                                          hintText: 'Email: xyz@gmail.com',
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 20.0, horizontal: 20.0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          icon: Icon(
                                              Icons.drive_file_rename_outline),
                                          hintText: 'Mobile No:017595XXX',
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 20.0, horizontal: 20.0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      child: Container(
                                        //padding: EdgeInsets.all(8),
                                        color: Colors.white,
                                        //margin: EdgeInsets.fromLTRB(20, 130, 20, 50),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.all(16),
                                                child: DropdownButtonFormField(
                                                  isExpanded: true,
                                                  hint: Text(
                                                      'Preferred time for call back'),
                                                  onChanged: (val) {
                                                    print(val);
                                                    setState(() {
                                                      this.purpose = val;
                                                    });
                                                  },
                                                  value: this.purpose,
                                                  items: [
                                                    DropdownMenuItem(
                                                      child: Text('15-16PM'),
                                                      value: 'Consultancy',
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text('16-17PM'),
                                                      value: 'Follow up',
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text('18-19PM'),
                                                      value: 'Follow up',
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text('17-18PM'),
                                                      value: 'Follow up',
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                                Icons.calendar_today_outlined),
                                            onPressed: () {
                                              showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
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
                                            _dateTime == null
                                                ? 'Preferred date for call back'
                                                : '$todayDate',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: TextFormField(
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 8,
                                        maxLength: 1000,
                                        decoration: InputDecoration(
                                          icon: Icon(
                                              Icons.drive_file_rename_outline),
                                          hintText: 'Remarks',
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 20.0, horizontal: 20.0),
                                        ),
                                      ),
                                    ),
                                  ]),
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
                                      "Submit",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
