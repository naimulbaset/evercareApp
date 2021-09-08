import 'package:flutter/material.dart';
import 'package:evercare/screen/DoctorVisit/AppointmentStatus.dart';

class AppointmentRequestScreen extends StatefulWidget {
  @override
  _AppointmentRequestScreenState createState() =>
      _AppointmentRequestScreenState();
}

class _AppointmentRequestScreenState extends State<AppointmentRequestScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];
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
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          title: const Text('Tabs Demo'),
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: _widgetOptions.elementAt(_selectedIndex),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ToggleButtons(
                      borderColor: Colors.black,
                      fillColor: Colors.grey,
                      borderWidth: 2,
                      selectedBorderColor: Colors.black,
                      selectedColor: Colors.white,
                      borderRadius: BorderRadius.circular(0),
                      children: <Widget>[
                        TextButton(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'New Appointment',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        TextButton(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Appointment Status',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                      onPressed: (int index) {
                        setState(() {
                          for (int i = 0; i < isSelected.length; i++) {
                            isSelected[i] = i == index;
                          }
                        });
                      },
                      isSelected: isSelected,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
                            child: Text('ENTER DETAILS',
                                style: TextStyle(
                                    fontFamily: 'Source Sans Pro',
                                    fontSize: 20,
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
                                            child:
                                                Text('Evercare Hospital Dhaka'),
                                            value: 'Consultancy',
                                          ),
                                          DropdownMenuItem(
                                            child:
                                                Text('Evercare Hospital Dhaka'),
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
                                            child: Text(
                                                'Prof Dr Kazi Hasinur Rahman'),
                                            value: 'Consultancy',
                                          ),
                                          DropdownMenuItem(
                                            child: Text(
                                                'Prof Dr Matiur rahman Molla'),
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
                            height: 30,
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            color: Colors.white,
                            child: Row(
                              children: [
                                IconButton(
                                  icon:
                                      const Icon(Icons.calendar_today_outlined),
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
                                  _dateTime == null
                                      ? 'Select Date'
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
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
              backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.pink,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
