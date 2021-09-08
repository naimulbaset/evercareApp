import 'package:flutter/material.dart';

class FAQscreen extends StatefulWidget {
  @override
  _FAQscreenState createState() => _FAQscreenState();
}

class _FAQscreenState extends State<FAQscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('FAQ',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.bold,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // drawer: DriverDrawer(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/p1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                color: Colors.blue[200],
                margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
                child: ExpansionTile(
                  title: Text(
                    "OPD Management",
                    style: TextStyle(
                        fontFamily: 'Playfair Display',
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Column(
                        children: [
                          Text(
                            'An organized OPD for handling large number of patients to be attended by multiple Doctors in an OPD. The complete cycle of an effective OPD from Registration, Patient History, Patient Diagnosis, and Prescription etc. is stored and managed effectively.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                color: Colors.blue[200],
                margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
                child: ExpansionTile(
                  title: Text(
                    "IPD Management",
                    style: TextStyle(
                        fontFamily: 'Playfair Display',
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Column(
                        children: [
                          Text(
                            'Complete Inpatient Management Module that manages all your hospital inpatient functionality from Patient registration to the billing with a complete tracking of Patient records.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                color: Colors.blue[200],
                margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
                child: ExpansionTile(
                  title: Text(
                    "OT Management",
                    style: TextStyle(
                        fontFamily: 'Playfair Display',
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Column(
                        children: [
                          Text(
                            'Operation theater module caters to the scheduling of operation theaters, surgery team, patient tracking, operation theater consumable management, accounting and Operation theater roster and notes with Death and Birth certificates.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                color: Colors.blue[200],
                margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
                child: ExpansionTile(
                  title: Text(
                    "Pathology Software",
                    style: TextStyle(
                        fontFamily: 'Playfair Display',
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Column(
                        children: [
                          Text(
                            'Pathology Lab Management facilitates definition of laboratory tests supporting fully configurable laboratory tests reports that are ordered in outpatient or Inpatient instantaneously.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                color: Colors.blue[200],
                margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
                child: ExpansionTile(
                  title: Text(
                    "TPA Management",
                    style: TextStyle(
                        fontFamily: 'Playfair Display',
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Column(
                        children: [
                          Text(
                            'Aarogya comes with an integrated TPA module offering seamless insurance management to process the bills settlement of the patients covered under insurance.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )
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
