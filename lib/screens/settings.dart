import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:native_widgets/native_widgets.dart';
import 'package:meta/meta.dart';

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
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool _value_0 = false;
  bool _value_1 = true;
  bool _value_2 = true;
  bool _value_3 = true;
  bool _value_4 = true;
  bool _value_5 = true;
  bool _value_6 = true;
  bool _value_7 = true;

  void _onChanged_0(bool value0) {
    setState(() {
      _0_Period;
      //0 Period
      if (_value_0 == true) {
        _value_0 = false;
      } else {
        _value_0 = true;
      }
      _0_Period();
    });
  }

  void _onChanged_1(bool value1) {
    setState(() {
      //1st Period
      if (_value_1 == true) {
        _value_1 = false;
      } else {
        _value_1 = true;
      }
    });
  }

  void _onChanged_2(bool value2) {
    setState(() {
      //2nd Period
      if (_value_2 == true) {
        _value_2 = false;
      } else {
        _value_2 = true;
      }
    });
  }

  void _onChanged_3(bool value3) {
    setState(() {
      //3rd Period
      if (_value_3 == true) {
        _value_3 = false;
      } else {
        _value_3 = true;
      }
    });
  }

  void _onChanged_4(bool value4) {
    setState(() {
      //4th Period
      if (_value_4 == true) {
        _value_4 = false;
      } else {
        _value_4 = true;
      }
    });
  }

  void _onChanged_5(bool value5) {
    setState(() {
      //5th Period
      if (_value_5 == true) {
        _value_5 = false;
      } else {
        _value_5 = true;
      }
    });
  }

  void _onChanged_6(bool value6) {
    setState(() {
      //6th Period
      if (_value_6 == true) {
        _value_6 = false;
      } else {
        _value_6 = true;
      }
    });
  }

  void _onChanged_7(bool value7) {
    setState(() {
      //7th Period
      if (_value_7 == true) {
        _value_7 = false;
      } else {
        _value_7 = true;
      }
    });
  }

  Widget build(BuildContext context) => new Scaffold(
        //App Bar
        appBar: new AppBar(
          title: new Text(
            'Settings',
            style: new TextStyle(
              fontSize: Theme.of(context).platform == TargetPlatform.iOS
                  ? 17.0
                  : 20.0,
            ),
          ),
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),

        //Content of tabs
        body: new ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Text('\nThis page is not working yet! 😢',
                    style: new TextStyle(color: Colors.red.withOpacity(0.9))),
                new Card(
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
                        title: new Text('0 Period'),
                        activeColor: Colors.red,
                        value: _value_0,
                        onChanged: (bool value0) {
                          _onChanged_0(value0);
                        },
                      ),
                      new SwitchListTile(
                        title: new Text('1st Period'),
                        activeColor: Colors.red,
                        value: _value_1,
                        onChanged: (bool value1) {
                          _onChanged_1(value1);
                        },
                      ),
                      new SwitchListTile(
                        title: new Text('2nd Period'),
                        activeColor: Colors.red,
                        value: _value_2,
                        onChanged: (bool value2) {
                          _onChanged_2(value2);
                        },
                      ),
                      new SwitchListTile(
                        title: new Text('3rd Period'),
                        activeColor: Colors.red,
                        value: _value_3,
                        onChanged: (bool value3) {
                          _onChanged_3(value3);
                        },
                      ),
                      new SwitchListTile(
                        title: new Text('4th Period'),
                        activeColor: Colors.red,
                        value: _value_4,
                        onChanged: (bool value4) {
                          _onChanged_4(value4);
                        },
                      ),
                      new SwitchListTile(
                        title: new Text('5th Period'),
                        activeColor: Colors.red,
                        value: _value_5,
                        onChanged: (bool value5) {
                          _onChanged_5(value5);
                        },
                      ),
                      new SwitchListTile(
                        title: new Text('6th Period'),
                        activeColor: Colors.red,
                        value: _value_6,
                        onChanged: (bool value6) {
                          _onChanged_6(value6);
                        },
                      ),
                      new SwitchListTile(
                        title: new Text('7th Period'),
                        activeColor: Colors.red,
                        value: _value_7,
                        onChanged: (bool value7) {
                          _onChanged_7(value7);
                        },
                      ),
                    ],
                  ),
                ),
                new Card(
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
                      new NativeButton(
                        child: new Text(
                          'Send Feedback',
                          style: new TextStyle(
                              color: Colors.white.withOpacity(0.9)),
                        ),
                        buttonColor: Colors.red,
                        onPressed: FBURL,
                      ),
                      new Text('\n')
                    ],
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

_0_Period() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool period = prefs.getBool('0_period');

  if (prefs.getInt('0_period') == true) {
    period = false;
  } else {
    period = true;
  }
  await prefs.setBool('0_period', period);
}
