import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:flushbar/flushbar.dart';
//import 'package:vibrate/vibrate.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Container(
        child: new HomePage(),
      );
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  SharedPreferences prefs;
  final TextEditingController _controller = new TextEditingController();

  String Name = 'John';
  bool zeroPeriod = false;
  bool firstPeriod = false;
  bool secondPeriod = false;
  bool thirdPeriod = false;
  bool forthPeriod = false;
  bool fifthPeriod = false;
  bool sixthPeriod = false;
  bool seventhPeriod = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('zeroPeriod') == false) {
      zeroPeriod = prefs.getBool('zeroPeriod');
      firstPeriod = prefs.getBool('firstPeriod');
      secondPeriod = prefs.getBool('secondPeriod');
      thirdPeriod = prefs.getBool('thirdPeriod');
      forthPeriod = prefs.getBool('forthPeriod');
      fifthPeriod = prefs.getBool('fifthPeriod');
      sixthPeriod = prefs.getBool('sixthPeriod');
      seventhPeriod = prefs.getBool('seventhPeriod');
      Name = prefs.getString('Name');
    }
    if (prefs.getBool('zeroPeriod') == null) {
      Name = 'John';
      zeroPeriod = false;
      firstPeriod = false;
      secondPeriod = false;
      thirdPeriod = false;
      forthPeriod = false;
      fifthPeriod = false;
      sixthPeriod = false;
      seventhPeriod = false;
    }

    setState(() {
      zeroPeriod;
      firstPeriod;
      secondPeriod;
      thirdPeriod;
      forthPeriod;
      fifthPeriod;
      sixthPeriod;
      seventhPeriod;
      Name;
    });
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

    Flushbar(
      message: "Saved Classes",
      flushbarPosition: FlushbarPosition.BOTTOM, //Immutable
      reverseAnimationCurve: Curves.decelerate, //Immutable
      forwardAnimationCurve: Curves.elasticOut, //Immutable
      backgroundColor: Colors.black,
      isDismissible: false,
      duration: Duration(seconds: 4),
    );

//    bool canVibrate = await Vibrate.canVibrate;
//    if (canVibrate == true) {
//      Vibrate.feedback(FeedbackType.success);
//    }
  }

  void _onChanged(String val) {
    setState(() {
      Name = val;
    });
  }

  void saveName() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('Name', Name);

    Flushbar(
      message: "Saved Name",
      flushbarPosition: FlushbarPosition.BOTTOM, //Immutable
      reverseAnimationCurve: Curves.decelerate, //Immutable
      forwardAnimationCurve: Curves.elasticOut, //Immutable
      backgroundColor: Colors.black,
      isDismissible: false,
      duration: Duration(seconds: 4),
    );

//    bool canVibrate = await Vibrate.canVibrate;
//    if (canVibrate == true) {
//      Vibrate.feedback(FeedbackType.success);
//    }

  }

  bool classes_setup = false;

  Widget build(BuildContext context) =>
      new Scaffold(
        appBar: new AppBar(
          title: new Text(
            'Settings',
            style: new TextStyle(
              fontSize: Theme.of(context).platform == TargetPlatform.iOS
                  ? 17.0
                  : 20.0,
            ),
          ),
        ),

        //Content of tabs
        body: new ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.all(8.0),
                  child: new Material(
                    elevation: 5.0,
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(10.0)),
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new ListTile(
                          title: new Text('Your Profile'),
                          subtitle: new Text(
                            'This is where you edit your name',
                            style: new TextStyle(
                                color: Colors.grey.withOpacity(0.9),
                                fontSize: 12.0),
                          ),
                        ),
                        new ListTile(
                          title: new TextField(
                            decoration: new InputDecoration(
                              hintText: "Change your name here..",
                            ),
                            controller: _controller,
                            onChanged: (String value) {
                              _onChanged(value);
                            },
                          ),
                        ),
                        new Text(''),
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
                          onPressed: saveName,
                        ),
                        new Text("\n"),
                      ],
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(8.0),
                  child: new Material(
                    elevation: 5.0,
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(10.0)),
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new ListTile(
                          title: new Text('Your Classes'),
                          subtitle: new Text(
                            'Select the periods you have classes in.',
                            style: new TextStyle(
                                color: Colors.grey.withOpacity(0.9),
                                fontSize: 12.0),
                          ),
                        ),
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
                        new Text("\n"),
                      ],
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(8.0),
                  child: new Material(
                    elevation: 5.0,
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(10.0)),
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new ListTile(
                          title: new Text('Feedback'),
                          subtitle: new Text(
                            'Feedback help us better develop the app',
                            style: new TextStyle(
                                color: Colors.grey.withOpacity(0.9),
                                fontSize: 12.0),
                          ),
                        ),
                        new RaisedButton(
                          child: new Text(
                            'Send Feedback',
                            style: new TextStyle(
                                color: Colors.white.withOpacity(0.9)),
                          ),
                          color: Colors.red,
                          elevation: 4.0,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          splashColor: Colors.grey,
                          onPressed: FBURL,
                        ),
                        new Text('\n')
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
}

FBURL() {
  launch(
      'https://docs.google.com/forms/d/e/1FAIpQLScG_fu-2lpfdikypltPVxxVmpBJtpvcRYrD-n1V2frlQtS9IQ/viewform?usp=sf_link');
}
