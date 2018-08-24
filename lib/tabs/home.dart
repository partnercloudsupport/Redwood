import 'package:flutter/material.dart';
import 'package:native_widgets/native_widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_villains/villain.dart';

class Home extends StatelessWidget {
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

  void _openMonday() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new showMonday();
        },
        fullscreenDialog: true));
  }

  void _openTuesday() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new showTuesday();
        },
        fullscreenDialog: true));
  }

  void _openWednesday() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new showWednesday();
        },
        fullscreenDialog: true));
  }

  void _openThursday() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new showThursday();
        },
        fullscreenDialog: true));
  }

  void _openFriday() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new showFriday();
        },
        fullscreenDialog: true));
  }

  void _openRALLYThursday() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new showRALLYThursday();
        },
        fullscreenDialog: true));
  }

  void _openASSEMBLYThursday() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new showASSEMBLYThursday();
        },
        fullscreenDialog: true));
  }

  void _openMinimumDay() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new showMinimumDay();
        },
        fullscreenDialog: true));
  }

  void _openFllowingAMin() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new showFollowingaMinimumday();
        },
        fullscreenDialog: true));
  }

  void _openFirstWeek() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new showStart();
        },
        fullscreenDialog: true));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Card(
                elevation: 3.0,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ListTile(
                      title: new Text('Normal School Week'),
                    ),
                    new ListTile(
                      title: new RaisedButton(
                        child: new Text(
                          'Monday (All Periods)',
                          style: new TextStyle(
                              color: Colors.white.withOpacity(0.9)),
                        ),
                        color: Theme.of(context).accentColor,
                        elevation: 4.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        splashColor: Colors.grey,
                        onPressed: _openMonday,
                      ),
                    ),
                    new ListTile(
                      title: new RaisedButton(
                        child: new Text(
                          'Tuesday (All Periods)',
                          style: new TextStyle(
                              color: Colors.white.withOpacity(0.9)),
                        ),
                        color: Theme.of(context).accentColor,
                        elevation: 4.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        splashColor: Colors.grey,
                        onPressed: _openTuesday,
                      ),
                    ),
                    new ListTile(
                      title: new RaisedButton(
                        child: new Text(
                          'Wednesday (Block Schedule)',
                          style: new TextStyle(
                              color: Colors.white.withOpacity(0.9)),
                        ),
                        color: Theme.of(context).accentColor,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        elevation: 4.0,
                        splashColor: Colors.grey,
                        onPressed: _openWednesday,
                      ),
                    ),
                    new ListTile(
                      title: new RaisedButton(
                        child: new Text(
                          'Thursday (Block Schedule)',
                          style: new TextStyle(
                              color: Colors.white.withOpacity(0.9)),
                        ),
                        color: Theme.of(context).accentColor,
                        elevation: 4.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        splashColor: Colors.grey,
                        onPressed: _openThursday,
                      ),
                    ),
                    new ListTile(
                      title: new RaisedButton(
                        child: new Text(
                          'Friday (All Periods)',
                          style: new TextStyle(
                              color: Colors.white.withOpacity(0.9)),
                        ),
                        color: Theme.of(context).accentColor,
                        elevation: 4.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        splashColor: Colors.grey,
                        onPressed: _openFriday,
                      ),
                    ),
                    new Text('\n'),
                  ],
                ),
              ),
              new Card(
                elevation: 3.0,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ListTile(
                      title: new Text('Special Days'),
                      subtitle: new Text(
                        '',
                        style: new TextStyle(
                            color: Colors.grey.withOpacity(0.9),
                            fontSize: 12.0),
                      ),
                    ),
                    new ListTile(
                      title: new RaisedButton(
                        child: new Text(
                          'First Week of School',
                          style: new TextStyle(
                              color: Colors.white.withOpacity(0.9)),
                        ),
                        color: Theme.of(context).accentColor,
                        elevation: 4.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        splashColor: Colors.grey,
                        onPressed: _openFirstWeek,
                      ),
                    ),
                    new ListTile(
                      title: new RaisedButton(
                        child: new Text(
                          'RALLY Thursday',
                          style: new TextStyle(
                              color: Colors.white.withOpacity(0.9)),
                        ),
                        color: Theme.of(context).accentColor,
                        elevation: 4.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        splashColor: Colors.grey,
                        onPressed: _openRALLYThursday,
                      ),
                    ),
                    new ListTile(
                      title: new RaisedButton(
                        child: new Text(
                          'ASSEMBLY Thursday',
                          style: new TextStyle(
                              color: Colors.white.withOpacity(0.9)),
                        ),
                        color: Theme.of(context).accentColor,
                        elevation: 4.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        splashColor: Colors.grey,
                        onPressed: _openASSEMBLYThursday,
                      ),
                    ),
                    new ListTile(
                      title: new RaisedButton(
                        child: new Text(
                          'Minimum Day (Wednesday or Friday) *',
                          style: new TextStyle(
                              color: Colors.white.withOpacity(0.9)),
                        ),
                        color: Theme.of(context).accentColor,
                        elevation: 4.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        splashColor: Colors.grey,
                        onPressed: _openMinimumDay,
                      ),
                    ),
                    new ListTile(
                      title: new RaisedButton(
                        child: new Text(
                          'Thursday following a Minimum Wed. or before a Minimum Friday*',
                          style: new TextStyle(
                              color: Colors.white.withOpacity(0.9)),
                        ),
                        color: Theme.of(context).accentColor,
                        elevation: 4.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        splashColor: Colors.grey,
                        onPressed: _openFllowingAMin,
                      ),
                    ),
                    new Text('\n'),
                  ],
                ),
              ),
              new Text('\n'),
              new Card(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                elevation: 3.0,
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ListTile(
                      title: new Text(
                          'For weeks with three or fewer student days, there will be no block periods (only 7-period days).'),
                    ),
                    new ListTile(
                      title: new Text(
                          '* Week with a Minimum Wednesday or Minimum Friday day has an altered Wednesday and Thursday or Friday and Thursday schedule as listed.'),
                    ),
                    new Text('\n'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class showMonday extends StatefulWidget {
  @override
  showMondayState createState() => new showMondayState();
}

class showMondayState extends State<showMonday> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Monday'),
        ),
        body: Column(
          children: <Widget>[
            new Text(""),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '0 Period 7:05 - 7:55\n\n'
                              '1st Period 8:00 - 8:48\n\n'
                              '2nd Period 8:55 - 9:43',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.lightBlueAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Break 9:43 - 9:53',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '3rd Period 10:00 - 10:48\n\n'
                              '4th Period 10:55 - 11:43',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.lightBlueAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Lunch 11:43 - 12:18',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.2,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '5th Period 12:25 - 1:13\n\n'
                              '6th Period 1:20 - 2:08\n\n'
                              '7th Period 2:15 - 3:03',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class showTuesday extends StatefulWidget {
  @override
  showTuesdayState createState() => new showTuesdayState();
}

class showTuesdayState extends State<showTuesday> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Tuesday'),
        ),
        body: Column(
          children: <Widget>[
            new Text(""),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '0 Period 7:05 - 7:55\n\n'
                              '1st Period 8:00 - 8:48\n\n'
                              '2nd Period 8:55 - 9:43',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.lightBlueAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Break 9:43 - 9:53',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '3rd Period 10:00 - 10:48\n\n'
                              '4th Period 10:55 - 11:43',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.lightBlueAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Lunch 11:43 - 12:18',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.2,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '5th Period 12:25 - 1:13\n\n'
                              '6th Period 1:20 - 2:08\n\n'
                              '7th Period 2:15 - 3:03',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class showWednesday extends StatefulWidget {
  @override
  showWednesdayState createState() => new showWednesdayState();
}

class showWednesdayState extends State<showWednesday> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Wednesday'),
        ),
        body: Column(
          children: <Widget>[
            new Text(""),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.2,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '0 Period 7:05 - 7:53\n\n'
                              '4th Period 8:00 - 9:30',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.2,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.lightBlueAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Break 9:30 - 9:40',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.2,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '5th Period 9:47 - 11:17',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.2,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.lightBlueAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Lunch 11:17 - 11:53',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.2,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '6th Period 12:00 - 1:30\n\n'
                              '7th Period 1:37 - 3:07',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class showThursday extends StatefulWidget {
  @override
  showThursdayState createState() => new showThursdayState();
}

class showThursdayState extends State<showThursday> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Thursday'),
        ),
        body: Column(
          children: <Widget>[
            new Text(""),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.2,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '0 Period 7:05 - 7:53\n\n'
                              '1st Period 8:00 - 9:30',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.2,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.redAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Homeroom 9:37 - 9:47\n\n'
                              'SMART 9:47 - 10:30',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.2,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.lightBlueAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Break 10:30 - 10:40',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.2,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '2nd Period 10:47 - 12:17',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.2,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.lightBlueAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Lunch 12:17 - 12:55',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.2,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '3rd Period 1:02 - 2:32',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class showFriday extends StatefulWidget {
  @override
  showFridayState createState() => new showFridayState();
}

class showFridayState extends State<showFriday> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Friday'),
        ),
        body: Column(
          children: <Widget>[
            new Text(""),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '0 Period 7:05 - 7:55\n\n'
                              '1st Period 8:00 - 8:48\n\n'
                              '2nd Period 8:55 - 9:43',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.lightBlueAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Break 9:43 - 9:53',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '3rd Period 10:00 - 10:48\n\n'
                              '4th Period 10:55 - 11:43',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.lightBlueAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Lunch 11:43 - 12:18',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.2,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '5th Period 12:25 - 1:13\n\n'
                              '6th Period 1:20 - 2:08\n\n'
                              '7th Period 2:15 - 3:03',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

//Special Days

class showRALLYThursday extends StatefulWidget {
  @override
  showRALLYThursdayState createState() => new showRALLYThursdayState();
}

class showRALLYThursdayState extends State<showRALLYThursday> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('RALLY Thursday'),
        ),
        body: Column(
          children: <Widget>[
            new Text(""),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '0 Period 7:05 - 7:53\n\n'
                              '1st Period 8:00 - 9:30',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.lightBlueAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Break 9:30 - 9:40',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '2nd Period 9:47 - 11:17',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.redAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Rally 11:22 - 12:07',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.lightBlueAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Lunch 12:07 - 12:52',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '3rd Period 12:59 - 2:29',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class showASSEMBLYThursday extends StatefulWidget {
  @override
  showASSEMBLYThursdayState createState() => new showASSEMBLYThursdayState();
}

class showASSEMBLYThursdayState extends State<showASSEMBLYThursday> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('ASSEMBLY Thursday'),
        ),
        body: Column(
          children: <Widget>[
            new Text(""),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '0 Period 7:05 - 7:53\n\n'
                              '1st Period 8:00 - 9:30',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.lightBlueAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Break 9:30 - 9:40',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '2nd Period 9:47 - 11:17',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.redAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Assembly 11:22 - 12:17',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.lightBlueAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Lunch 12:17 - 12:52',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '3rd Period 12:59 - 2:29',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class showMinimumDay extends StatefulWidget {
  @override
  showMinimumDayState createState() => new showMinimumDayState();
}

class showMinimumDayState extends State<showMinimumDay> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Minimum Day'),
        ),
        body: Column(
          children: <Widget>[
            new Text(""),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '0 Period 7:05 - 7:53\n\n'
                              '1st Period 8:00 - 9:10',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.redAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'SMART Period 9:17 - 9:57',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.lightBlueAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Break 9:57 - 10:07',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '2nd Period 10:14 - 11:24',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.lightBlueAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Break 11:24 - 11:34',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '3rd Period 11:41 - 12:51',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class showFollowingaMinimumday extends StatefulWidget {
  @override
  showFollowingaMinimumdayState createState() =>
      new showFollowingaMinimumdayState();
}

class showFollowingaMinimumdayState extends State<showFollowingaMinimumday> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Following a Minimum Day'),
        ),
        body: ListView(
          children: <Widget>[
            new Text(""),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '0 Period 7:05 - 7:53\n\n'
                              '4th Period 8:00 - 9:15',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.lightBlueAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Break 9:15 - 9:25',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '5th Period 9:32 - 10:47',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.lightBlueAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Break 10:47 - 10:57',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '6th Period 11:04 - 12:19',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.lightBlueAccent,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          'Lunch 12:19 - 12:59',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new ListTile(
                title: new Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.blue,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: const Text(
                          '7th Period 1:06 - 2:21',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class showStart extends StatefulWidget {
  @override
  showStartState createState() => new showStartState();
}

class showStartState extends State<showStart> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('First Week'),
        ),
        body: ListView(
          children: <Widget>[
            new Text(""),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new Center(child: new Image.asset('Day1.png')),
            ),
            Villain(
              villainAnimation: VillainAnimation.fromBottom(
                relativeOffset: 0.3,
                from: Duration(milliseconds: 0),
                to: Duration(milliseconds: 175),
              ),
              animateExit: true,
              child: new Center(child: new Image.asset('Day2.png')),
            ),
          ],
        ));
  }
}
