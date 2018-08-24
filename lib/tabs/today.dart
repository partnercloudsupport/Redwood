import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:connectivity/connectivity.dart';
import 'package:native_ui/native_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:native_widgets/native_widgets.dart';
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


  bool zeroPeriod = false;

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
    _loadData;

  }

  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      zeroPeriod = (prefs.getBool('zeroPeriod') ?? null);
    });
  }


  bool page = true;
  bool classes_setup = false;
  String nextclassstart = '5';

  @override
  Widget build(BuildContext context) {
    if (page == true && classes_setup == true) {
      return new Column(
        children: <Widget>[
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
          new Text('$zeroPeriod'),
          new RaisedButton(
            child: new Text(
              'Setup your classes',
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

}

  bool zeroPeriod = false;
  bool firstPeriod = false;
  bool secondPeriod = false;
  bool thirdPeriod = false;
  bool forthPeriod = false;
  bool fifthPeriod = false;
  bool sixthPeriod = false;
  bool seventhPeriod = false;

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
                      new Card(
                        child: new Column(
                          children: <Widget>[
                            new Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text("   0 Period"),
                                new Checkbox(
                                  value: zeroPeriod,
                                  onChanged: (bool value) {
                                    setState(() {
                                      zeroPeriod = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      new Card(
                        child: new Column(
                          children: <Widget>[
                            new Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text("   1st Period"),
                                new Checkbox(
                                  value: firstPeriod,
                                  onChanged: (bool value) {
                                    setState(() {
                                      firstPeriod = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      new Card(
                        child: new Column(
                          children: <Widget>[
                            new Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text("   2nd Period"),
                                new Checkbox(
                                  value: secondPeriod,
                                  onChanged: (bool value) {
                                    setState(() {
                                      secondPeriod = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      new Card(
                        child: new Column(
                          children: <Widget>[
                            new Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text("   3rd Period"),
                                new Checkbox(
                                  value: thirdPeriod,
                                  onChanged: (bool value) {
                                    setState(() {
                                      thirdPeriod = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      new Card(
                        child: new Column(
                          children: <Widget>[
                            new Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text("   4th Period"),
                                new Checkbox(
                                  value: forthPeriod,
                                  onChanged: (bool value) {
                                    setState(() {
                                      forthPeriod = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      new Card(
                        child: new Column(
                          children: <Widget>[
                            new Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text("   5th Period"),
                                new Checkbox(
                                  value: fifthPeriod,
                                  onChanged: (bool value) {
                                    setState(() {
                                      fifthPeriod = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      new Card(
                        child: new Column(
                          children: <Widget>[
                            new Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text("   6th Period"),
                                new Checkbox(
                                  value: sixthPeriod,
                                  onChanged: (bool value) {
                                    setState(() {
                                      sixthPeriod = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      new Card(
                        child: new Column(
                          children: <Widget>[
                            new Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text("   7th Period"),
                                new Checkbox(
                                  value: seventhPeriod,
                                  onChanged: (bool value) {
                                    setState(() {
                                      seventhPeriod = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      new Text("\n"),
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
