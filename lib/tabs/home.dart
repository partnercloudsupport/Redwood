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
  void _showMondayTuesdayFriday() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            color: Colors.white,
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 70.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '0 Period 7:05-7:55',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 61.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '1st Period 8:00-8:48',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 58.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '2nd Period 8:55-9:43',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 68.0, top: 5.0, right: 68.0, bottom: 5.0),
                          child: const Text(
                            'Break 9:43-9:53',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 49.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '3rd Period 10:00-10:48',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 49.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '4th Period 10:55-11:43',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 70.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            'Lunch 11:43-12:18',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 56.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '5th Period 12:25-1:13',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 59.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '6th Period 1:20-2:08',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 59.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '7th Period 2:15-3:03',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          );
        });
  }

  void _showWednesday() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            color: Colors.white,
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 70.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '0 Period 7:05-7:55',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 61.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '4th Period 8:00-9:30',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 68.0, top: 5.0, right: 68.0, bottom: 5.0),
                          child: const Text(
                            'Break 9:30-9:40',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 53.0, top: 5.0, right: 54.0, bottom: 5.0),
                          child: const Text(
                            '5th Period 9:47-11:17',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 63.0, top: 5.0, right: 58.0, bottom: 5.0),
                          child: const Text(
                            'Lunch 11:17-11:53',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 58.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '6th Period 12:00-1:30',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 63.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '7th Period 1:37-3:07',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          );
        });
  }

  void _showThursday() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            color: Colors.white,
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 70.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '0 Period 7:05-7:55',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 61.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '1st Period 8:00-9:30',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 51.0, top: 5.0, right: 53.0, bottom: 5.0),
                          child: const Text(
                            'Homeroom 9:37-9:47',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 62.0, top: 5.0, right: 64.0, bottom: 5.0),
                          child: const Text(
                            'Smart 9:47-10:30',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 63.0, top: 5.0, right: 58.0, bottom: 5.0),
                          child: const Text(
                            'Break 10:30-10:40',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 46.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '2nd Period 10:47-12:17',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 66.0, top: 5.0, right: 56.0, bottom: 5.0),
                          child: const Text(
                            'Lunch 12:17-12:55',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 63.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '3rd Period 1:02-2:32',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 46.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            'Staff Meeting 2:42-3:37',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          );
        });
  }

  void _showRALLYThursday() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            color: Colors.white,
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 70.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '0 Period 7:05-7:53',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 61.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '1st Period 8:00-9:30',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 68.0, top: 5.0, right: 68.0, bottom: 5.0),
                          child: const Text(
                            'Break 9:30-9:40',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 52.0, top: 5.0, right: 52.0, bottom: 5.0),
                          child: const Text(
                            '2nd Period 9:47-11:17',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 67.0, top: 5.0, right: 62.0, bottom: 5.0),
                          child: const Text(
                            'Rally 11:22-12:07',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 62.0, top: 5.0, right: 53.0, bottom: 5.0),
                          child: const Text(
                            'Lunch 12:07 - 12:52',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 57.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '3rd Period 12:59-2:29',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          );
        });
  }

  void _showASSEMBLYThursday() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            color: Colors.white,
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 70.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '0 Period 7:05-7:53',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 61.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '1st Period 8:00-9:30',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 68.0, top: 5.0, right: 68.0, bottom: 5.0),
                          child: const Text(
                            'Break 9:30-9:40',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 52.0, top: 5.0, right: 52.0, bottom: 5.0),
                          child: const Text(
                            '2nd Period 9:47-11:17',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 51.0, top: 5.0, right: 52.0, bottom: 5.0),
                          child: const Text(
                            'Assembly 11:22-12:17',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 62.0, top: 5.0, right: 53.0, bottom: 5.0),
                          child: const Text(
                            'Lunch 12:17 - 12:52',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 57.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '3rd Period 12:59-2:29',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          );
        });
  }

  void _showDOUBLEASSEMBLYThursday() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            color: Colors.white,
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 70.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '0 Period 7:05-7:53',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 42.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '1st Period (A) 8:00-9:15',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 66.0, top: 5.0, right: 68.0, bottom: 5.0),
                          child: const Text(
                            'Break 9:15-9:25',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 45.0, top: 5.0, right: 40.0, bottom: 5.0),
                          child: const Text(
                            '1st Period (B) 9:32-10:47',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 62.0, top: 5.0, right: 59.0, bottom: 5.0),
                          child: const Text(
                            'Break 10:47-11:02',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 41.0, top: 5.0, right: 53.0, bottom: 5.0),
                          child: const Text(
                            '2nd Period 11:09-12:19',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 68.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            'Lunch 12:19-12:59',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 58.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '3rd Period 1:06-2:21',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          );
        });
  }

  void _showDOUBLEASSEMBLYThursdaywithSMART() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            color: Colors.white,
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 70.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '0 Period 7:05-7:53',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 42.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '1st Period (A) 8:00-9:00',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 66.0, top: 5.0, right: 68.0, bottom: 5.0),
                          child: const Text(
                            'Break 9:00-9:10',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 45.0, top: 5.0, right: 40.0, bottom: 5.0),
                          child: const Text(
                            '1st Period (B) 9:17-10:17',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 53.0, top: 5.0, right: 59.0, bottom: 5.0),
                          child: const Text(
                            'SMART 10:24-11:09',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 41.0, top: 5.0, right: 53.0, bottom: 5.0),
                          child: const Text(
                            '2nd Period 11:16-12:21',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 72.0, top: 5.0, right: 55.0, bottom: 5.0),
                          child: const Text(
                            'Lunch 12:21-1:06',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Card(
                    color: Colors.blue,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(
                              left: 58.0, top: 5.0, right: 50.0, bottom: 5.0),
                          child: const Text(
                            '3rd Period 1:13-2:18',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          );
        });
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
                        splashColor: Colors.grey,
                        onPressed: _showMondayTuesdayFriday,
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
                        splashColor: Colors.grey,
                        onPressed: _showMondayTuesdayFriday,
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
                        elevation: 4.0,
                        splashColor: Colors.grey,
                        onPressed: _showWednesday,
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
                        splashColor: Colors.grey,
                        onPressed: _showThursday,
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
                        splashColor: Colors.grey,
                        onPressed: _showMondayTuesdayFriday,
                      ),
                    ),
                    new Text('\n'),
                  ],
                ),
              ),
              new Card(
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
                        splashColor: Colors.grey,
                        onPressed: FirstWeek,
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
                        splashColor: Colors.grey,
                        onPressed: _showRALLYThursday,
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
                        splashColor: Colors.grey,
                        onPressed: _showASSEMBLYThursday,
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
                        splashColor: Colors.grey,
                        onPressed: _showDOUBLEASSEMBLYThursday,
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
                        splashColor: Colors.grey,
                        onPressed: _showDOUBLEASSEMBLYThursdaywithSMART,
                      ),
                    ),
                    new Text('\n'),
                  ],
                ),
              ),
              new Text('\n'),
              new Card(
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ListTile(
                      title: new Text('For weeks with three or fewer student days, there will be no block periods (only 7-period days).'),

                    ),
                    new ListTile(
                      title: new Text('* Week with a Minimum Wednesday or Minimum Friday day has an altered Wednesday and Thursday or Friday and Thursday schedule as listed.'),

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

FirstWeek() {
  launch('https://storage.googleapis.com/pt04-2/messages/attachments/0fd4b187cefd59ba4f06e78bc4fbbdf2e6f02e71/2Info_FirstDay%252C8_23_18_and_8_24_18Schedule.pdf');
}
