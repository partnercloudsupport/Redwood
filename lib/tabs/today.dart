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
  //--This is for the info cards for users--
  String WeekDay = 'Monday';
  String WeekDayTime = 'No Info';
  String WeekDayTimeEnd = 'No Info';
  String SchoolStart = '8:00 AM';
  String SchoolEnd = '3:03 PM';
  //--

  //--This is the bools that cached version overrides
  String Name = 'John';
  bool zeroPeriod = false;
  bool firstPeriod = false;
  bool secondPeriod = false;
  bool thirdPeriod = false;
  bool forthPeriod = false;
  bool fifthPeriod = false;
  bool sixthPeriod = false;
  bool seventhPeriod = false;
  //--

  //Puts the page in lockdown
  bool page = true;
  //--

  //-- if this is true the user has setup there profile
  bool classes_setup = false;
  //--

  void _Setup() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new setUp();
        },
        fullscreenDialog: true));
  }

  @override
  void initState() {
    //-- Lets cached info load in before it overrides the page defaults
    Timer _timer, _timertwo;
    _timer = new Timer(const Duration(milliseconds: 100), () {
      checkinfo();
    });
    //--

    super.initState();
    init();
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();

    var now = new DateTime.now();
    var formatter = new DateFormat.E();
    String formatted = formatter.format(now);

    //-- Gets the cached info from SharedPreferences
    zeroPeriod = prefs.getBool('zeroPeriod');
    firstPeriod = prefs.getBool('firstPeriod');
    secondPeriod = prefs.getBool('secondPeriod');
    thirdPeriod = prefs.getBool('thirdPeriod');
    forthPeriod = prefs.getBool('forthPeriod');
    fifthPeriod = prefs.getBool('fifthPeriod');
    sixthPeriod = prefs.getBool('sixthPeriod');
    seventhPeriod = prefs.getBool('seventhPeriod');
    Name = prefs.getString('Name');
    //--

    WeekDay = formatted;

    //-- overrides the default info and replaces it with the cached info
    this.setState(() {
      zeroPeriod;
      firstPeriod;
      secondPeriod;
      thirdPeriod;
      forthPeriod;
      fifthPeriod;
      sixthPeriod;
      seventhPeriod;
      Name;
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

    //-- Sets up the info section bools and strings depending on the day
    if (zeroPeriod == true ||
        firstPeriod == true ||
        secondPeriod == true ||
        thirdPeriod == true ||
        forthPeriod == true ||
        fifthPeriod == true ||
        sixthPeriod == true ||
        seventhPeriod == true) {
      classes_setup = true;

      WeekDay = formatted;
      //-- Sets the Strings
      if (WeekDay == 'Mon') {
        if (zeroPeriod == true) {
          SchoolStart = '7:05 AM';
        } else {
          if (firstPeriod == true) {
            SchoolStart = '8:00 AM';
          } else {
            if (secondPeriod == true) {
              SchoolStart = '8:55 AM';
            } else {
              if (thirdPeriod == true) {
                SchoolStart = '10:00 AM';
              }
            }
          }
        }
        if (seventhPeriod == true) {
          SchoolEnd = '3:03 PM';
        } else {
          if (sixthPeriod == true) {
            SchoolEnd = '2:08 PM';
          } else {
            if (fifthPeriod == true) {
              SchoolEnd = '1:13 PM';
            }
          }
        }

        WeekDayTime = '11:43 AM';
        WeekDayTimeEnd = '12:18 PM';
      }

      if (WeekDay == 'Tue') {
        if (zeroPeriod == true) {
          SchoolStart = '7:05 AM';
        } else {
          if (firstPeriod == true) {
            SchoolStart = '8:00 AM';
          } else {
            if (secondPeriod == true) {
              SchoolStart = '8:55 AM';
            } else {
              if (thirdPeriod == true) {
                SchoolStart = '10:00 AM';
              }
            }
          }
        }
        if (seventhPeriod == true) {
          SchoolEnd = '3:03 PM';
        } else {
          if (sixthPeriod == true) {
            SchoolEnd = '2:08 PM';
          } else {
            if (fifthPeriod == true) {
              SchoolEnd = '1:13 PM';
            }
          }
        }

        WeekDayTime = '11:43 AM';
        WeekDayTimeEnd = '12:18 PM';
      }

      if (WeekDay == 'Wed') {
        if (forthPeriod == true) {
          SchoolStart = '8:00 AM';
        } else {
          if (fifthPeriod == true) {
            SchoolStart = '9:47 AM';
          } else {
            if (sixthPeriod == true) {
              SchoolStart = '12:00 PM';
            } else {
              if (seventhPeriod == true) {
                SchoolStart = '1:37 PM';
              }
            }
          }
        }
        if (seventhPeriod == true) {
          SchoolEnd = '3:07 PM';
        } else {
          if (sixthPeriod == true) {
            SchoolEnd = '1:30 PM';
          } else {
            if (fifthPeriod == true) {
              SchoolStart = '11:17 AM';
            }
          }
        }
        WeekDayTime = '11:17 AM';
        WeekDayTimeEnd = '11:53 AM';
      }

      if (WeekDay == 'Thu') {
        if (zeroPeriod == true) {
          SchoolStart = '7:05 AM';
        } else {
          if (firstPeriod == true) {
            SchoolStart = '8:00 AM';
          } else {
            if (secondPeriod == true) {
              SchoolStart = '10:47 AM';
            } else {
              if (thirdPeriod == true) {
                SchoolStart = '1:02 PM';
              }
            }
          }
        }
        if (thirdPeriod == true) {
          SchoolEnd = '2:32 PM';
        } else {
          if (secondPeriod == true) {
            SchoolEnd = '12:17 PM';
          }
        }

        WeekDayTime = '12:17 PM';
        WeekDayTimeEnd = '12:55 PM';
      }

      if (WeekDay == 'Fri') {
        if (zeroPeriod == true) {
          SchoolStart = '7:05 AM';
        } else {
          if (firstPeriod == true) {
            SchoolStart = '8:00 AM';
          } else {
            if (secondPeriod == true) {
              SchoolStart = '8:55 AM';
            } else {
              if (thirdPeriod == true) {
                SchoolStart = '10:00 AM';
              }
            }
          }
        }
        if (seventhPeriod == true) {
          SchoolEnd = '3:03 PM';
        } else {
          if (sixthPeriod == true) {
            SchoolEnd = '2:08 PM';
          } else {
            if (fifthPeriod == true) {
              SchoolEnd = '1:13 PM';
            }
          }
        }

        WeekDayTime = '11:43 AM';
        WeekDayTimeEnd = '12:18 PM';
      }


      setState(() {
        classes_setup;
        WeekDay;
        WeekDayTime;
        WeekDayTimeEnd;
        SchoolStart;
        SchoolEnd;
      });
    }
  }

  //-- This is not used yet
  String nextclassstart = '5';
  //--

  var day = new DateFormat.EEEE();

  @override
  Widget build(BuildContext context) {
    //-- If a user set up there classes it displays the today page
    if (page == true && classes_setup == true) {
      //If its the weekend it shows this
      if (WeekDay == 'Sun' || WeekDay == 'Sat'){
        return new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text('No School Today! 😄',
              style: new TextStyle(
                  fontSize: 19.0),),
          ],
        );
      } else {
        //If its during the week displays this
        return new Column(
          children: <Widget>[
            new Text(""),
            new ListTile(
              title: new Text('Hello, ' + Name,
                style: new TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 20.0),),
            ),
            new Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            new ListTile(
              title: new Text('Info about your day.'),
            ),
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
            new Card(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new ListTile(
                    title: new Text('School will start for you at ' + '$SchoolStart' + ' and will end at ' + '$SchoolEnd'),
                  ),
                ],
              ),
            ),
          ],
        );
      }
    }

    if (page == true && classes_setup == false) {
      return new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Text('If you have set up your profile\n'
          'leave this tab and come back',style: new TextStyle(
              color: Colors.red.withOpacity(0.7),),),
          new CircularProgressIndicator(),
          new FlatButton(
            textColor: Colors.red,
            onPressed: _Setup,
            child: new Text("Setup Today Page"),
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

  final TextEditingController _controller = new TextEditingController();
  String Name = "";


  void _onChanged(String val) {
    setState(() {
      Name = val;
    });
  }


  void saveData() async {
    final prefs = await SharedPreferences.getInstance();

    //-- This sets the cached values
    prefs.setBool('zeroPeriod', zeroPeriod);
    prefs.setBool('firstPeriod', firstPeriod);
    prefs.setBool('secondPeriod', secondPeriod);
    prefs.setBool('thirdPeriod', thirdPeriod);
    prefs.setBool('forthPeriod', forthPeriod);
    prefs.setBool('fifthPeriod', fifthPeriod);
    prefs.setBool('sixthPeriod', sixthPeriod);
    prefs.setBool('seventhPeriod', seventhPeriod);
    prefs.setString('Name', Name);


    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    //-- This is the today page setup PopUp
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Today Setup'),
          actions: <Widget>[],
        ),
        body: ListView(
          children: <Widget>[
            new Align(
                alignment: const Alignment(0.0, -0.2),
                child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new ListTile(
                        title: new Text('Add your Name'),
                        ),
                      new ListTile(
                        title: new TextField(
                          decoration: new InputDecoration(
                            hintText: "Type your name..",
                          ),
                          controller: _controller,
                          onChanged: (String value) {
                            _onChanged(value);
                          },

                        ),
                      ),
                      new Text(''),
                      new Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      new ListTile(
                        title: new Text('Add your Classes'),
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
                        onPressed: saveData,
                      ),
                      new Text('\n'),
                    ])),
          ],
        ));
  }
}
