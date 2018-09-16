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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:holding_gesture/holding_gesture.dart';

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
  int ST = 0;
  String annBody = 'No announcements today! 😃';
  String annLink = 'null';

  //--This is for the info cards for users--
  String WeekDay = 'Monday';
  String WeekDayTime = 'No Info';
  String WeekDayTimeEnd = 'No Info';
  String SchoolStart = '8:00 AM';
  String SchoolEnd = '3:03 PM';
  String CurrentClass = 'First Period';
  String CurrentClassStart = '8:00 AM';
  String CurrentClassEnd = '8:48 AM';
  String Date;

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

  _STinson() {
    ST = ST + 1;
    if (ST >= 26){
      ST = 0;
      final snackBar = new SnackBar(
        content: new Text("sUper STinson sLimey Bois"),
        duration: new Duration(seconds: 3),
        backgroundColor: Colors.black,
        action: new SnackBarAction(label: 'YEET', onPressed: (){
        }),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }

    setState(() {
      ST;
    });
  }

  void _Setup() {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
              builder: (context) => setUp(), fullscreenDialog: true),
        )
        .then((result) => setState(() {
              init();
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Profile Saved!')));
              Timer _timer;
              _timer = new Timer(const Duration(milliseconds: 100), () {
                checkinfo();
              });
            }));
  }

  StreamSubscription<DocumentSnapshot> subscription;

  final DocumentReference documentReference =
      Firestore.instance.document("a/post1");

  void _fetch() {
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
          annBody = datasnapshot.data['body'];
          annLink = datasnapshot.data['link'];
        });
      }
    });
  }

  @override
  void initState() {
    //-- Lets cached info load in before it overrides the page defaults
    Timer _timer;
    _timer = new Timer(const Duration(milliseconds: 100), () {
      checkinfo();
    });
    //--
    this._fetch();
    super.initState();
    init();
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();

    var now = new DateTime.now();
    var formatter = new DateFormat.E();
    var formatterDate = new DateFormat('MM.dd.yyyy');
    String formatted = formatter.format(now);
    String formattedDate = formatterDate.format(now);

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
    Date = formattedDate;

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
      Date;
    });
  }

  void checkinfo() async {
    var now = new DateTime.now();
    var formatterDayWeek = new DateFormat.E();
    var formatter24Hour = new DateFormat.H();
    var formatter24Min = new DateFormat.Hm();
    String formattedDayWeek = formatterDayWeek.format(now);
    String formatted24Hour = formatter24Hour.format(now);
    String formatted24Min = formatter24Hour.format(now);
    int min = int.tryParse(formatted24Min) ?? 00;

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

      WeekDay = formattedDayWeek;
      //-- Sets the Strings
      if (WeekDay == 'Mon') {
        //Current Class Card
        // Zero Period **
        if (formatted24Hour == '07') {
          if (min >= 05) {
            if (min <= 55) {
              CurrentClass = 'Zero Period';
              CurrentClassStart = '7:05 AM';
              CurrentClassEnd = '7:55 AM';
            }
          }
        }
        // ** First Period **
        if (formatted24Hour == '08') {
          if (min >= 00) {
            if (min <= 48) {
              CurrentClass = 'First Period';
              CurrentClassStart = '8:00 AM';
              CurrentClassEnd = '8:48 AM';
            }
          }
        }
        //** Second Period **
        if (formatted24Hour == '08') {
          if (min >= 55) {
            if (min <= 59) {
              CurrentClass = 'Second Period';
              CurrentClassStart = '8:55 AM';
              CurrentClassEnd = '9:43 AM';
            }
          }
        }
        if (formatted24Hour == '09') {
          if (min >= 00) {
            if (min <= 42) {
              CurrentClass = 'Second Period';
              CurrentClassStart = '8:55 AM';
              CurrentClassEnd = '9:43 AM';
            }
          }
        }
        // ** Break **
        if (formatted24Hour == '09') {
          if (min >= 43) {
            if (min <= 53) {
              CurrentClass = 'Break';
              CurrentClassStart = '9:43 AM';
              CurrentClassEnd = '9:53 AM';
            }
          }
        }
        // ** Third Period
        if (formatted24Hour == '10') {
          if (min >= 00) {
            if (min <= 48) {
              CurrentClass = 'Third Period';
              CurrentClassStart = '10:00 AM';
              CurrentClassEnd = '10:48 AM';
            }
          }
        }
        // ** Fourth Period
        if (formatted24Hour == '10') {
          if (min >= 55) {
            if (min <= 59) {
              CurrentClass = 'Fourth Period';
              CurrentClassStart = '10:55 AM';
              CurrentClassEnd = '11:43 AM';
            }
          }
        }
        if (formatted24Hour == '10') {
          if (min >= 00) {
            if (min <= 43) {
              CurrentClass = 'Fourth Period';
              CurrentClassStart = '10:55 AM';
              CurrentClassEnd = '11:43 AM';
            }
          }
        }
        // ** Lunch **
        if (formatted24Hour == '11') {
          if (min >= 43) {
            if (min <= 59) {
              CurrentClass = 'Lunch';
              CurrentClassStart = '11:43 AM';
              CurrentClassEnd = '12:18 PM';
            }
          }
        }
        if (formatted24Hour == '12') {
          if (min >= 00) {
            if (min <= 18) {
              CurrentClass = 'Fourth Period';
              CurrentClassStart = '11:43 AM';
              CurrentClassEnd = '12:18 PM';
            }
          }
        }
        // ** Fifth Period **
        if (formatted24Hour == '12') {
          if (min >= 25) {
            if (min <= 59) {
              CurrentClass = 'Fifth Period';
              CurrentClassStart = '12:25 PM';
              CurrentClassEnd = '1:13 PM';
            }
          }
        }
        if (formatted24Hour == '13') {
          if (min >= 00) {
            if (min <= 13) {
              CurrentClass = 'Fifth Period';
              CurrentClassStart = '12:25 PM';
              CurrentClassEnd = '1:13 PM';
            }
          }
        }
        // ** Sixth Period **
        if (formatted24Hour == '13') {
          if (min >= 20) {
            if (min <= 59) {
              CurrentClass = 'Sixth Period';
              CurrentClassStart = '1:20 PM';
              CurrentClassEnd = '2:08 PM';
            }
          }
        }
        if (formatted24Hour == '14') {
          if (min >= 00) {
            if (min <= 08) {
              CurrentClass = 'Sixth Period';
              CurrentClassStart = '1:20 PM';
              CurrentClassEnd = '2:08 PM';
            }
          }
        }
        // ** Seventh Period **
        if (formatted24Hour == '14') {
          if (min >= 15) {
            if (min <= 59) {
              CurrentClass = 'Seventh Period';
              CurrentClassStart = '2:15 PM';
              CurrentClassEnd = '3:03 PM';
            }
          }
        }
        if (formatted24Hour == '15') {
          if (min >= 00) {
            if (min <= 03) {
              CurrentClass = 'Seventh Period';
              CurrentClassStart = '2:15 PM';
              CurrentClassEnd = '3:03 PM';
            }
          }
        }
        // **

        //School starting __ card
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
        //Current Class Card
        // Zero Period **
        if (formatted24Hour == '07') {
          if (min >= 05) {
            if (min <= 55) {
              CurrentClass = 'Zero Period';
              CurrentClassStart = '7:05 AM';
              CurrentClassEnd = '7:55 AM';
            }
          }
        }
        // ** First Period **
        if (formatted24Hour == '08') {
          if (min >= 00) {
            if (min <= 48) {
              CurrentClass = 'First Period';
              CurrentClassStart = '8:00 AM';
              CurrentClassEnd = '8:48 AM';
            }
          }
        }
        //** Second Period **
        if (formatted24Hour == '08') {
          if (min >= 55) {
            if (min <= 59) {
              CurrentClass = 'Second Period';
              CurrentClassStart = '8:55 AM';
              CurrentClassEnd = '9:43 AM';
            }
          }
        }
        if (formatted24Hour == '09') {
          if (min >= 00) {
            if (min <= 42) {
              CurrentClass = 'Second Period';
              CurrentClassStart = '8:55 AM';
              CurrentClassEnd = '9:43 AM';
            }
          }
        }
        // ** Break **
        if (formatted24Hour == '09') {
          if (min >= 43) {
            if (min <= 53) {
              CurrentClass = 'Break';
              CurrentClassStart = '9:43 AM';
              CurrentClassEnd = '9:53 AM';
            }
          }
        }
        // ** Third Period
        if (formatted24Hour == '10') {
          if (min >= 00) {
            if (min <= 48) {
              CurrentClass = 'Third Period';
              CurrentClassStart = '10:00 AM';
              CurrentClassEnd = '10:48 AM';
            }
          }
        }
        // ** Fourth Period
        if (formatted24Hour == '10') {
          if (min >= 55) {
            if (min <= 59) {
              CurrentClass = 'Fourth Period';
              CurrentClassStart = '10:55 AM';
              CurrentClassEnd = '11:43 AM';
            }
          }
        }
        if (formatted24Hour == '10') {
          if (min >= 00) {
            if (min <= 43) {
              CurrentClass = 'Fourth Period';
              CurrentClassStart = '10:55 AM';
              CurrentClassEnd = '11:43 AM';
            }
          }
        }
        // ** Lunch **
        if (formatted24Hour == '11') {
          if (min >= 43) {
            if (min <= 59) {
              CurrentClass = 'Lunch';
              CurrentClassStart = '11:43 AM';
              CurrentClassEnd = '12:18 PM';
            }
          }
        }
        if (formatted24Hour == '12') {
          if (min >= 00) {
            if (min <= 18) {
              CurrentClass = 'Fourth Period';
              CurrentClassStart = '11:43 AM';
              CurrentClassEnd = '12:18 PM';
            }
          }
        }
        // ** Fifth Period **
        if (formatted24Hour == '12') {
          if (min >= 25) {
            if (min <= 59) {
              CurrentClass = 'Fifth Period';
              CurrentClassStart = '12:25 PM';
              CurrentClassEnd = '1:13 PM';
            }
          }
        }
        if (formatted24Hour == '13') {
          if (min >= 00) {
            if (min <= 13) {
              CurrentClass = 'Fifth Period';
              CurrentClassStart = '12:25 PM';
              CurrentClassEnd = '1:13 PM';
            }
          }
        }
        // ** Sixth Period **
        if (formatted24Hour == '13') {
          if (min >= 20) {
            if (min <= 59) {
              CurrentClass = 'Sixth Period';
              CurrentClassStart = '1:20 PM';
              CurrentClassEnd = '2:08 PM';
            }
          }
        }
        if (formatted24Hour == '14') {
          if (min >= 00) {
            if (min <= 08) {
              CurrentClass = 'Sixth Period';
              CurrentClassStart = '1:20 PM';
              CurrentClassEnd = '2:08 PM';
            }
          }
        }
        // ** Seventh Period **
        if (formatted24Hour == '14') {
          if (min >= 15) {
            if (min <= 59) {
              CurrentClass = 'Seventh Period';
              CurrentClassStart = '2:15 PM';
              CurrentClassEnd = '3:03 PM';
            }
          }
        }
        if (formatted24Hour == '15') {
          if (min >= 00) {
            if (min <= 03) {
              CurrentClass = 'Seventh Period';
              CurrentClassStart = '2:15 PM';
              CurrentClassEnd = '3:03 PM';
            }
          }
        }
        // **

        //School starting __ card
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
        //Current Class Card
        //Zero Period **
        if (formatted24Hour == '07') {
          if (min >= 05) {
            if (min <= 53) {
              CurrentClass = 'Zero Period';
              CurrentClassStart = '7:05 AM';
              CurrentClassEnd = '7:53 AM';
            }
          }
        }
        //** Forth Period **
        if (formatted24Hour == '8') {
          if (min >= 00) {
            if (min <= 59) {
              CurrentClass = 'Forth Period';
              CurrentClassStart = '8:00 AM';
              CurrentClassEnd = '9:30 AM';
            }
          }
        }
        if (formatted24Hour == '9') {
          if (min >= 00) {
            if (min <= 29) {
              CurrentClass = 'Forth Period';
              CurrentClassStart = '8:00 AM';
              CurrentClassEnd = '9:30 AM';
            }
          }
        }
        // ** Break **
        if (formatted24Hour == '9') {
          if (min >= 30) {
            if (min <= 40) {
              CurrentClass = 'Break';
              CurrentClassStart = '9:40 AM';
              CurrentClassEnd = '9:40 AM';
            }
          }
        }
        // ** Fifth Period **
        if (formatted24Hour == '9') {
          if (min >= 47) {
            if (min <= 59) {
              CurrentClass = 'Fifth Period';
              CurrentClassStart = '9:47 AM';
              CurrentClassEnd = '11:17 AM';
            }
          }
        }
        if (formatted24Hour == '10') {
          if (min >= 00) {
            if (min <= 59) {
              CurrentClass = 'Fifth Period';
              CurrentClassStart = '9:47 AM';
              CurrentClassEnd = '11:17 AM';
            }
          }
        }
        if (formatted24Hour == '11') {
          if (min >= 00) {
            if (min <= 16) {
              CurrentClass = 'Fifth Period';
              CurrentClassStart = '9:47 AM';
              CurrentClassEnd = '11:17 AM';
            }
          }
        }
        // ** Lunch **
        if (formatted24Hour == '11') {
          if (min >= 17) {
            if (min <= 53) {
              CurrentClass = 'Fifth Period';
              CurrentClassStart = '11:17 AM';
              CurrentClassEnd = '11:53 AM';
            }
          }
        }
        // ** Sixth Period **
        if (formatted24Hour == '12') {
          if (min >= 00) {
            if (min <= 59) {
              CurrentClass = 'Sixth Period';
              CurrentClassStart = '12:00 PM';
              CurrentClassEnd = '1:30 PM';
            }
          }
        }
        if (formatted24Hour == '13') {
          if (min >= 00) {
            if (min <= 30) {
              CurrentClass = 'Sixth Period';
              CurrentClassStart = '12:00 PM';
              CurrentClassEnd = '1:30 PM';
            }
          }
        }
        // ** Seventh Period **
        if (formatted24Hour == '13') {
          if (min >= 37) {
            if (min <= 59) {
              CurrentClass = 'Seventh Period';
              CurrentClassStart = '1:37 PM';
              CurrentClassEnd = '3:07 PM';
            }
          }
        }
        if (formatted24Hour == '14') {
          if (min >= 00) {
            if (min <= 59) {
              CurrentClass = 'Seventh Period';
              CurrentClassStart = '1:37 PM';
              CurrentClassEnd = '3:07 PM';
            }
          }
        }
        if (formatted24Hour == '15') {
          if (min >= 00) {
            if (min <= 07) {
              CurrentClass = 'Seventh Period';
              CurrentClassStart = '1:37 PM';
              CurrentClassEnd = '3:07 PM';
            }
          }
        }

        //School starting __ card
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
        //Current Class Card
        //Zero Period
        if (formatted24Hour == '07') {
          if (min >= 05) {
            if (min <= 53) {
              CurrentClass = 'Seventh Period';
              CurrentClassStart = '7:05 AM';
              CurrentClassEnd = '7:53 AM';
            }
          }
        }
        // ** First Period **
        if (formatted24Hour == '08') {
          if (min >= 00) {
            if (min <= 59) {
              CurrentClass = 'First Period';
              CurrentClassStart = '8:00 AM';
              CurrentClassEnd = '9:30 AM';
            }
          }
        }
        if (formatted24Hour == '09') {
          if (min >= 00) {
            if (min <= 30) {
              CurrentClass = 'First Period';
              CurrentClassStart = '8:00 AM';
              CurrentClassEnd = '9:30 AM';
            }
          }
        }
        // ** Homeroom **
        if (formatted24Hour == '09') {
          if (min >= 37) {
            if (min <= 46) {
              CurrentClass = 'Homeroom';
              CurrentClassStart = '9:37 AM';
              CurrentClassEnd = '9:47 AM';
            }
          }
        }
        // ** SMART **
        if (formatted24Hour == '09') {
          if (min >= 47) {
            if (min <= 59) {
              CurrentClass = 'SMART';
              CurrentClassStart = '9:47 AM';
              CurrentClassEnd = '10:30 AM';
            }
          }
        }
        if (formatted24Hour == '10') {
          if (min >= 00) {
            if (min <= 29) {
              CurrentClass = 'SMART';
              CurrentClassStart = '9:47 AM';
              CurrentClassEnd = '10:30 AM';
            }
          }
        }
        // ** Break **
        if (formatted24Hour == '10') {
          if (min >= 30) {
            if (min <= 40) {
              CurrentClass = 'Break';
              CurrentClassStart = '10:30 AM';
              CurrentClassEnd = '10:40 AM';
            }
          }
        }
        // ** Second Period **
        if (formatted24Hour == '10') {
          if (min >= 47) {
            if (min <= 40) {
              CurrentClass = 'Second Period';
              CurrentClassStart = '10:47 AM';
              CurrentClassEnd = '12:17 PM';
            }
          }
        }
        if (formatted24Hour == '11') {
          if (min >= 00) {
            if (min <= 59) {
              CurrentClass = 'Second Period';
              CurrentClassStart = '10:47 AM';
              CurrentClassEnd = '12:17 PM';
            }
          }
        }
        if (formatted24Hour == '12') {
          if (min >= 00) {
            if (min <= 16) {
              CurrentClass = 'Second Period';
              CurrentClassStart = '10:47 AM';
              CurrentClassEnd = '12:17 PM';
            }
          }
        }
        // ** Lunch **
        if (formatted24Hour == '12') {
          if (min >= 17) {
            if (min <= 55) {
              CurrentClass = 'Lunch';
              CurrentClassStart = '12:17 PM';
              CurrentClassEnd = '12:55 PM';
            }
          }
        }
        // ** Third Period **
        if (formatted24Hour == '13') {
          if (min >= 02) {
            if (min <= 59) {
              CurrentClass = 'Third Period';
              CurrentClassStart = '1:02 PM';
              CurrentClassEnd = '2:32 PM';
            }
          }
        }
        if (formatted24Hour == '14') {
          if (min >= 00) {
            if (min <= 32) {
              CurrentClass = 'Third Period';
              CurrentClassStart = '1:02 PM';
              CurrentClassEnd = '2:32 PM';
            }
          }
        }

        //School starting __ card
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
        //Current Class Card
        // Zero Period **
        if (formatted24Hour == '07') {
          if (min >= 05) {
            if (min <= 55) {
              CurrentClass = 'Zero Period';
              CurrentClassStart = '7:05 AM';
              CurrentClassEnd = '7:55 AM';
            }
          }
        }
        // ** First Period **
        if (formatted24Hour == '08') {
          if (min >= 00) {
            if (min <= 48) {
              CurrentClass = 'First Period';
              CurrentClassStart = '8:00 AM';
              CurrentClassEnd = '8:48 AM';
            }
          }
        }
        //** Second Period **
        if (formatted24Hour == '08') {
          if (min >= 55) {
            if (min <= 59) {
              CurrentClass = 'Second Period';
              CurrentClassStart = '8:55 AM';
              CurrentClassEnd = '9:43 AM';
            }
          }
        }
        if (formatted24Hour == '09') {
          if (min >= 00) {
            if (min <= 42) {
              CurrentClass = 'Second Period';
              CurrentClassStart = '8:55 AM';
              CurrentClassEnd = '9:43 AM';
            }
          }
        }
        // ** Break **
        if (formatted24Hour == '09') {
          if (min >= 43) {
            if (min <= 53) {
              CurrentClass = 'Break';
              CurrentClassStart = '9:43 AM';
              CurrentClassEnd = '9:53 AM';
            }
          }
        }
        // ** Third Period
        if (formatted24Hour == '10') {
          if (min >= 00) {
            if (min <= 48) {
              CurrentClass = 'Third Period';
              CurrentClassStart = '10:00 AM';
              CurrentClassEnd = '10:48 AM';
            }
          }
        }
        // ** Fourth Period
        if (formatted24Hour == '10') {
          if (min >= 55) {
            if (min <= 59) {
              CurrentClass = 'Fourth Period';
              CurrentClassStart = '10:55 AM';
              CurrentClassEnd = '11:43 AM';
            }
          }
        }
        if (formatted24Hour == '10') {
          if (min >= 00) {
            if (min <= 43) {
              CurrentClass = 'Fourth Period';
              CurrentClassStart = '10:55 AM';
              CurrentClassEnd = '11:43 AM';
            }
          }
        }
        // ** Lunch **
        if (formatted24Hour == '11') {
          if (min >= 43) {
            if (min <= 59) {
              CurrentClass = 'Lunch';
              CurrentClassStart = '11:43 AM';
              CurrentClassEnd = '12:18 PM';
            }
          }
        }
        if (formatted24Hour == '12') {
          if (min >= 00) {
            if (min <= 18) {
              CurrentClass = 'Fourth Period';
              CurrentClassStart = '11:43 AM';
              CurrentClassEnd = '12:18 PM';
            }
          }
        }
        // ** Fifth Period **
        if (formatted24Hour == '12') {
          if (min >= 25) {
            if (min <= 59) {
              CurrentClass = 'Fifth Period';
              CurrentClassStart = '12:25 PM';
              CurrentClassEnd = '1:13 PM';
            }
          }
        }
        if (formatted24Hour == '13') {
          if (min >= 00) {
            if (min <= 13) {
              CurrentClass = 'Fifth Period';
              CurrentClassStart = '12:25 PM';
              CurrentClassEnd = '1:13 PM';
            }
          }
        }
        // ** Sixth Period **
        if (formatted24Hour == '13') {
          if (min >= 20) {
            if (min <= 59) {
              CurrentClass = 'Sixth Period';
              CurrentClassStart = '1:20 PM';
              CurrentClassEnd = '2:08 PM';
            }
          }
        }
        if (formatted24Hour == '14') {
          if (min >= 00) {
            if (min <= 08) {
              CurrentClass = 'Sixth Period';
              CurrentClassStart = '1:20 PM';
              CurrentClassEnd = '2:08 PM';
            }
          }
        }
        // ** Seventh Period **
        if (formatted24Hour == '14') {
          if (min >= 15) {
            if (min <= 59) {
              CurrentClass = 'Seventh Period';
              CurrentClassStart = '2:15 PM';
              CurrentClassEnd = '3:03 PM';
            }
          }
        }
        if (formatted24Hour == '15') {
          if (min >= 00) {
            if (min <= 03) {
              CurrentClass = 'Seventh Period';
              CurrentClassStart = '2:15 PM';
              CurrentClassEnd = '3:03 PM';
            }
          }
        }
        // **

        //School starting __ card
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
        CurrentClass;
        CurrentClassStart;
        CurrentClassEnd;
      });
    }
  }

  //-- This is not used yet
  String nextclassstart = '5';

  //--

  @override
  Widget build(BuildContext context) {
    //-- If a user set up there classes it displays the today page
    if (page == true && classes_setup == true) {
      //If its the weekend it shows this
      if (WeekDay == 'Sun' ||
          WeekDay == 'Sat' ||
          Date == '09.19.2018' ||
          Date == '11.19.2018' ||
          Date == '11.20.2018' ||
          Date == '11.21.2018' ||
          Date == '11.22.2018' ||
          Date == '11.23.2018') {
        return new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Text(
              'No School Today! 😄',
              style: new TextStyle(fontSize: 19.0),
            ),
          ],
        );
      } else {
        //If its during the week displays this
        return new ListView(
          children: <Widget>[
            new Text(""),
            new ListTile(
              title:
              HoldDetector(
                onHold: _STinson,
                holdTimeout: Duration(milliseconds: 500),
                enableHapticFeedback: false,
                child: new Text(
                  'Hello, ' + Name,
                  style: new TextStyle(
                      color: Colors.black.withOpacity(0.8), fontSize: 20.0),
                ),
              ),
            ),
            new Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            new GestureDetector(
              onTap: () {
                launch(annLink);
              },
              child:
              new Padding(
                padding: new EdgeInsets.only(
                  left: 8.0, right: 8.0, top: 7.0, bottom: 7.0,),
                child: new Material(
                  elevation: 3.0,
                  borderRadius:
                  new BorderRadius.all(new Radius.circular(10.0)),
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new ListTile(
                        title: new Text('Announcements 💬'),
                        subtitle: new Text(
                          '$annBody',
                          style:
                          new TextStyle(color: Colors.black.withOpacity(1.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            new Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            new ListTile(
              title: new Text('Info about your day.'),
            ),
            new Padding(
              padding: new EdgeInsets.only(left: 8.0, right: 8.0, top: 7.0, bottom: 7.0,),
              child: new Material(
                elevation: 3.0,
                borderRadius:
                new BorderRadius.all(new Radius.circular(10.0)),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ListTile(
                      title: new Text('Lunch will be at ' +
                          '$WeekDayTime' +
                          ' and will end at ' +
                          '$WeekDayTimeEnd'),
                    ),
                  ],
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(left: 8.0, right: 8.0, top: 7.0, bottom: 7.0,),
              child: new Material(
                elevation: 3.0,
                borderRadius:
                new BorderRadius.all(new Radius.circular(10.0)),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ListTile(
                      title: new Text('School will start for you at ' +
                          '$SchoolStart' +
                          ' and will end at ' +
                          '$SchoolEnd'),
                    ),
                  ],
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(left: 8.0, right: 8.0, top: 7.0, bottom: 7.0,),
              child: new Material(
                elevation: 3.0,
                borderRadius:
                new BorderRadius.all(new Radius.circular(10.0)),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ListTile(
                      title: new Text('It is currently ' +
                          '$CurrentClass' +
                          ' and started at ' +
                          '$CurrentClassStart' +
                          ' and it will end at ' +
                          '$CurrentClassEnd' +
                          ''),
                    ),
                  ],
                ),
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
