import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:connectivity/connectivity.dart';
import 'package:native_ui/native_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_villains/villain.dart';

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

  void checkInfo() async {
    if (zeroPeriod == true || firstPeriod == true || secondPeriod == true || thirdPeriod == true || forthPeriod == true || fifthPeriod == true || sixthPeriod == true || seventhPeriod == true)
    {
      classes_setup = true;

      setState(() {
        classes_setup;
      });
    }

  }

  void _Setup() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new setUp();
        },
        fullscreenDialog: true));
  }

  @override
  void initState() {
    super.initState();
    init();

    checkInfo();
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();

    zeroPeriod = prefs.getBool('zeroPeriod');
    firstPeriod = prefs.getBool('firstPeriod');
    secondPeriod = prefs.getBool('secondPeriod');
    thirdPeriod = prefs.getBool('thirdPeriod');
    forthPeriod = prefs.getBool('forthPeriod');
    fifthPeriod = prefs.getBool('fifthPeriod');
    sixthPeriod = prefs.getBool('sixthPeriod');
    seventhPeriod = prefs.getBool('seventhPeriod');

    setState(() {
      zeroPeriod;
      firstPeriod;
      secondPeriod;
      thirdPeriod;
      forthPeriod;
      fifthPeriod;
      sixthPeriod;
      seventhPeriod;
    });

  }

  String nextclassstart = '5';

  @override
  Widget build(BuildContext context) {
    if (page == true && classes_setup == true) {
      return new Column(
        children: <Widget>[
          new Text(""),
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(
                  title: new Text('Your Next Class Starts in ' +
                      nextclassstart +
                      ' minutes'),
                ),
              ],
            ),
          ),
          new Divider(
            height: 10.0,
            color: Colors.grey,
          ),
        ],
      );
    }

    if (page == true && classes_setup == false) {
      return new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Text('Select the classes you have.'),
          new RaisedButton(
            child: new Text(
              'Select Classes',
              style: new TextStyle(color: Colors.white.withOpacity(0.9)),
            ),
            color: Theme.of(context).accentColor,
            elevation: 4.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            splashColor: Colors.grey,
            onPressed: _Setup,
          ),
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
