import 'package:flutter/material.dart';

class AppointmetStatus extends StatefulWidget {
  @override
  _AppointmetStatusState createState() => _AppointmetStatusState();
}

class _AppointmetStatusState extends State<AppointmetStatus> {
  List<bool> isSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appointment Status'),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
