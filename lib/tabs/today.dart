import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:connectivity/connectivity.dart';
import 'package:native_ui/native_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_villains/villain.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


class Today extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Container(
        child: new HomePage(),
      );
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  SharedPreferences prefs;

  int time = 0;
  String WeekDay = 'Monday';
  String WeekDayTime = 'No Info';
  String WeekDayTimeEnd = 'No Info';

  bool zeroPeriod = false;
  bool firstPeriod = false;
  bool secondPeriod = false;
  bool thirdPeriod = false;
  bool forthPeriod = false;
  bool fifthPeriod = false;
  bool sixthPeriod = false;
  bool seventhPeriod = false;

  bool page = true;
  bool classes_setup = false;

  void _Setup() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new setUp();
        },
        fullscreenDialog: true));
  }

  @override
  void initState() {
    Timer _timer, _timertwo;
    _timer = new Timer(const Duration(milliseconds: 200), () {
      checkinfo();
    });

//    _timertwo = new Timer(const Duration(milliseconds: 200), () {
//      checkinfo();
//    });

    super.initState();
    init();
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();

    var now = new DateTime.now();
    var formatter = new DateFormat.E();
    String formatted = formatter.format(now);

    zeroPeriod = prefs.getBool('zeroPeriod');
    firstPeriod = prefs.getBool('firstPeriod');
    secondPeriod = prefs.getBool('secondPeriod');
    thirdPeriod = prefs.getBool('thirdPeriod');
    forthPeriod = prefs.getBool('forthPeriod');
    fifthPeriod = prefs.getBool('fifthPeriod');
    sixthPeriod = prefs.getBool('sixthPeriod');
    seventhPeriod = prefs.getBool('seventhPeriod');

    WeekDay = formatted;

    this.setState(() {
      zeroPeriod;
      firstPeriod;
      secondPeriod;
      thirdPeriod;
      forthPeriod;
      fifthPeriod;
      sixthPeriod;
      seventhPeriod;
      WeekDay;
    });

  }


  void checkinfo() async {

    var now = new DateTime.now();
    var formatter = new DateFormat.E();
    String formatted = formatter.format(now);

    if ((zeroPeriod == false &&
        firstPeriod == false &&
        secondPeriod == false &&
        thirdPeriod == false &&
        forthPeriod == false &&
        fifthPeriod == false &&
        sixthPeriod == false &&
        seventhPeriod == false)) {
      Navigator.of(context).push(new MaterialPageRoute<Null>(
          builder: (BuildContext context) {
            return new setUp();
          },
          fullscreenDialog: true));
    }

    if (zeroPeriod == false ||
        firstPeriod == true ||
        secondPeriod == true ||
        thirdPeriod == true ||
        forthPeriod == true ||
        fifthPeriod == true ||
        sixthPeriod == true ||
        seventhPeriod == true) {
      classes_setup = true;

      WeekDay = formatted;
      //Cal
      if (WeekDay == 'Mon') {
        WeekDayTime = '11:43 AM';
        WeekDayTimeEnd = '12:18 PM';
      }

      if (WeekDay == 'Tue') {
        WeekDayTime = '11:43 AM';
        WeekDayTimeEnd = '12:18 PM';
      }

      if (WeekDay == 'Wed') {
        WeekDayTime = '11:17 AM';
        WeekDayTimeEnd = '11:53 AM';
      }

      if (WeekDay == 'Thu') {
        WeekDayTime = '12:17 PM';
        WeekDayTimeEnd = '12:55 PM';
      }

      if (WeekDay == 'Fri') {
        WeekDayTime = '11:43 AM';
        WeekDayTimeEnd = '12:18 PM';
      }

      setState(() {
        classes_setup;
        WeekDay;
        WeekDayTime;
        WeekDayTimeEnd;
      });
    }
  }

  String nextclassstart = '5';

  var day = new DateFormat.EEEE();



  @override
  Widget build(BuildContext context) {
    if (page == true && classes_setup == true) {
      if (WeekDay == 'Sun' || WeekDay == 'Sat'){
        return new Column(
          children: <Widget>[
            new Card(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new ListTile(
                    title: new Text('No School Today!'),
                  ),
                ],
              ),
            ),
          ],
        );
      } else {
        return new Column(
          children: <Widget>[
            new Text(""),
            new Card(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new ListTile(
                    title: new Text('Lunch will be at ' + '$WeekDayTime' + ' and will end at ' + '$WeekDayTimeEnd'),
                  ),
                ],
              ),
            ),
//            new Card(
//              child: new Column(
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
//                  new ListTile(
//                    title: new Text('Day ' + '$WeekDay'),
//                  ),
//                ],
//              ),
//            ),
          ],
        );
      }
    }

    if (page == true && classes_setup == false) {
      return new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new CircularProgressIndicator(),
        ],
      );
    }

    if (page == false) {
      return new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Icon(FontAwesomeIcons.bolt, size: 150.0, color: Colors.black12),
          new Text('Today Page Coming Soon')
        ],
      );
    }
  }
}

class setUp extends StatefulWidget {
  @override
  setUpState createState() => new setUpState();
}

class setUpState extends State<setUp> {
  bool zeroPeriod = false;
  bool firstPeriod = false;
  bool secondPeriod = false;
  bool thirdPeriod = false;
  bool forthPeriod = false;
  bool fifthPeriod = false;
  bool sixthPeriod = false;
  bool seventhPeriod = false;

  Future<Null> _savingDone() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Classes Saved'),
//          content: new SingleChildScrollView(
//            child: new ListBody(
//              children: <Widget>[
//                new Text('You will never be satisfied.'),
//                new Text('You\’re like me. I’m never satisfied.'),
//              ],
//            ),
//          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void saveData() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setBool('zeroPeriod', zeroPeriod);
    prefs.setBool('firstPeriod', firstPeriod);
    prefs.setBool('secondPeriod', secondPeriod);
    prefs.setBool('thirdPeriod', thirdPeriod);
    prefs.setBool('forthPeriod', forthPeriod);
    prefs.setBool('fifthPeriod', fifthPeriod);
    prefs.setBool('sixthPeriod', sixthPeriod);
    prefs.setBool('seventhPeriod', seventhPeriod);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Classes Setup - BETA'),
          actions: <Widget>[],
        ),
        body: ListView(
          children: <Widget>[
            new Align(
                alignment: const Alignment(0.0, -0.2),
                child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new SwitchListTile(
                        title: const Text('0 Period'),
                        value: zeroPeriod,
                        onChanged: (bool value) {
                          setState(() {
                            zeroPeriod = value;
                          });
                        },
                        //secondary: const Icon(Icons.lightbulb_outline),
                      ),
                      new SwitchListTile(
                        title: const Text('1st Period'),
                        value: firstPeriod,
                        onChanged: (bool value) {
                          setState(() {
                            firstPeriod = value;
                          });
                        },
                        //secondary: const Icon(Icons.lightbulb_outline),
                      ),
                      new SwitchListTile(
                        title: const Text('2nd Period'),
                        value: secondPeriod,
                        onChanged: (bool value) {
                          setState(() {
                            secondPeriod = value;
                          });
                        },
                        //secondary: const Icon(Icons.lightbulb_outline),
                      ),
                      new SwitchListTile(
                        title: const Text('3rd Period'),
                        value: thirdPeriod,
                        onChanged: (bool value) {
                          setState(() {
                            thirdPeriod = value;
                          });
                        },
                        //secondary: const Icon(Icons.lightbulb_outline),
                      ),
                      new SwitchListTile(
                        title: const Text('4th Period'),
                        value: forthPeriod,
                        onChanged: (bool value) {
                          setState(() {
                            forthPeriod = value;
                          });
                        },
                        //secondary: const Icon(Icons.lightbulb_outline),
                      ),
                      new SwitchListTile(
                        title: const Text('5th Period'),
                        value: fifthPeriod,
                        onChanged: (bool value) {
                          setState(() {
                            fifthPeriod = value;
                          });
                        },
                        //secondary: const Icon(Icons.lightbulb_outline),
                      ),
                      new SwitchListTile(
                        title: const Text('6th Period'),
                        value: sixthPeriod,
                        onChanged: (bool value) {
                          setState(() {
                            sixthPeriod = value;
                          });
                        },
                        //secondary: const Icon(Icons.lightbulb_outline),
                      ),
                      new SwitchListTile(
                        title: const Text('7th Period'),
                        value: seventhPeriod,
                        onChanged: (bool value) {
                          setState(() {
                            seventhPeriod = value;
                          });
                        },
                        //secondary: const Icon(Icons.lightbulb_outline),
                      ),
                      new RaisedButton(
                        child: new Text(
                          'Save',
                          style: new TextStyle(
                              color: Colors.white.withOpacity(0.9)),
                        ),
                        color: Colors.blue,
                        elevation: 4.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        splashColor: Colors.grey,
                        onPressed: saveData,
                      ),
                    ])),
          ],
        ));
  }
}
