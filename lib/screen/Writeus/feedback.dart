import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isChecked = false;
  int experienceIndex = 0;
  void _onTapEmoji(int index) {
    setState(() {
      experienceIndex = index;
    });
  }

  final Color activeColor = Colors.pink[400];
  final Color inActiveColor = Colors.black;
  Widget _buildEmoji() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Material(
          color: Colors.transparent,
          child: IconButton(
            onPressed: () => _onTapEmoji(1),
            icon: Icon(
              Icons.sentiment_very_satisfied,
              color: experienceIndex == 1 ? activeColor : inActiveColor,
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: Column(
            children: [
              IconButton(
                onPressed: () => _onTapEmoji(2),
                icon: Icon(
                  Icons.sentiment_satisfied_alt,
                  color: experienceIndex == 2 ? activeColor : inActiveColor,
                ),
              ),
            ],
          ),
        ),
        Material(
          color: Colors.transparent,
          child: IconButton(
            onPressed: () => _onTapEmoji(3),
            icon: Icon(
              Icons.sentiment_neutral_rounded,
              color: experienceIndex == 3 ? activeColor : inActiveColor,
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: IconButton(
            onPressed: () => _onTapEmoji(4),
            icon: Icon(
              Icons.sentiment_dissatisfied,
              color: experienceIndex == 4 ? activeColor : inActiveColor,
            ),
          ),
        ),
      ],
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
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
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(30, 30, 0, 30),
                  //height: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: (Colors.blue.withOpacity(0.3)),
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Reception services',
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
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(columns: <DataColumn>[
                            DataColumn(
                              label: Text('S.No'),
                            ),
                            DataColumn(
                              label: Text('Questioner'),
                            ),
                            DataColumn(
                              label: Text(''),
                            ),
                            DataColumn(
                              label: Text('Remarks'),
                            ),
                          ], rows: <DataRow>[
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('1')),
                                DataCell(
                                    Text('Courtesy of front office staff')),
                                DataCell(
                                  _buildEmoji(),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 20, top: 50),
                                    color: Colors.white,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'Remarks',
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 20.0, horizontal: 30.0),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('2')),
                                DataCell(Text('Timeliness of registration')),
                                DataCell(
                                  _buildEmoji(),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 20, top: 50),
                                    color: Colors.white,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'Remarks',
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 20.0, horizontal: 30.0),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('3')),
                                DataCell(Text(
                                    'Time taken of for admission (20-30 minutes)')),
                                DataCell(
                                  _buildEmoji(),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 20, top: 50),
                                    color: Colors.white,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'Remarks',
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 20.0, horizontal: 30.0),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ])),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(30, 30, 0, 30),
                  //height: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: (Colors.green.withOpacity(0.3)),
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Nursing services',
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
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(columns: <DataColumn>[
                            DataColumn(
                              label: Text('S.No'),
                            ),
                            DataColumn(
                              label: Text('Questioner'),
                            ),
                            DataColumn(
                              label: Text(''),
                            ),
                            DataColumn(
                              label: Text('Remarks'),
                            ),
                          ], rows: <DataRow>[
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('1')),
                                DataCell(Text('Friendliness / Courtesy')),
                                DataCell(
                                  _buildEmoji(),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 20, top: 50),
                                    color: Colors.white,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'Remarks',
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 20.0, horizontal: 30.0),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('2')),
                                DataCell(Text('Promptness to call')),
                                DataCell(
                                  _buildEmoji(),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 20, top: 50),
                                    color: Colors.white,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'Remarks',
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 20.0, horizontal: 30.0),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('3')),
                                DataCell(Text(
                                    'Timely administration of medications)')),
                                DataCell(
                                  _buildEmoji(),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 20, top: 50),
                                    color: Colors.white,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'Remarks',
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 20.0, horizontal: 30.0),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('4')),
                                DataCell(Text(
                                    'Service quality for sample collection)')),
                                DataCell(
                                  _buildEmoji(),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 20, top: 50),
                                    color: Colors.white,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'Remarks',
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 20.0, horizontal: 30.0),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ])),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(30, 30, 0, 30),
                  //height: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: (Colors.purple.withOpacity(0.3)),
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Radiology(Xray,Usg)',
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
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(columns: <DataColumn>[
                            DataColumn(
                              label: Text('S.No'),
                            ),
                            DataColumn(
                              label: Text('Questioner'),
                            ),
                            DataColumn(
                              label: Text(''),
                            ),
                            DataColumn(
                              label: Text('Remarks'),
                            ),
                          ], rows: <DataRow>[
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('1')),
                                DataCell(Text(
                                    'Transfer / Watting time for investigation')),
                                DataCell(
                                  _buildEmoji(),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 20, top: 50),
                                    color: Colors.white,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'Remarks',
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 20.0, horizontal: 30.0),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('2')),
                                DataCell(Text(
                                    'Preparation for investigations explained clearly')),
                                DataCell(
                                  _buildEmoji(),
                                ),
                                DataCell(
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 20, top: 50),
                                    color: Colors.white,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'Remarks',
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 20.0, horizontal: 30.0),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ])),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(30, 30, 0, 30),
                  //height: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: (Colors.teal.withOpacity(0.3)),
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'If you are regular customer, please specify your reasons for choosing our hospital',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 0,
                            fontFamily: 'Playfair Display'
                            // backgroundColor: Colors.indigoAccent
                            ),
                      ),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(columns: <DataColumn>[
                            DataColumn(
                              label: Text('S.No'),
                            ),
                            DataColumn(
                              label: Text('Questioner'),
                            ),
                            DataColumn(
                              label: Text(''),
                            ),
                          ], rows: <DataRow>[
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('1')),
                                DataCell(
                                    Text('-Reputation of specilalist doctors')),
                                DataCell(Checkbox(
                                  checkColor: Colors.white,
                                  focusColor: Colors.blue,
                                  value: isChecked,
                                  onChanged: (bool value) {
                                    setState(() {
                                      isChecked = value;
                                    });
                                  },
                                )),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('2')),
                                DataCell(Text('- Quantity of services')),
                                DataCell(Checkbox(
                                  checkColor: Colors.white,
                                  focusColor: Colors.blue,
                                  value: isChecked,
                                  onChanged: (bool value) {
                                    setState(() {
                                      isChecked = value;
                                    });
                                  },
                                )),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('3')),
                                DataCell(Text('- Convenient / Comfort')),
                                DataCell(Checkbox(
                                  checkColor: Colors.white,
                                  focusColor: Colors.blue,
                                  value: isChecked,
                                  onChanged: (bool value) {
                                    setState(() {
                                      isChecked = value;
                                    });
                                  },
                                )),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('4')),
                                DataCell(Text('- Reputation of Hospital')),
                                DataCell(Checkbox(
                                  checkColor: Colors.white,
                                  focusColor: Colors.blue,
                                  value: isChecked,
                                  onChanged: (bool value) {
                                    setState(() {
                                      isChecked = value;
                                    });
                                  },
                                )),
                              ],
                            ),
                          ])),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Feedback Remarks',
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
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.grey[300],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
                      ),
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
                          color: Colors.blue.withOpacity(0.9),
                          onPressed: () {},
                          child: Text(
                            "Save",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
