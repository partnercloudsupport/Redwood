import 'package:flutter/material.dart';
import 'package:native_widgets/native_widgets.dart';

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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                            style: const TextStyle(fontSize: 12.0, color: Colors.white),
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
                      subtitle: new Text(
                        '',
                        style: new TextStyle(
                            color: Colors.grey.withOpacity(0.9),
                            fontSize: 12.0),
                      ),
                    ),
                    new NativeButton(
                      child: new Text(
                        'Monday (All Periods)',
                        style:
                            new TextStyle(color: Colors.white.withOpacity(0.9)),
                      ),
                      buttonColor: Colors.red,
                      onPressed: _showMondayTuesdayFriday,
                    ),
                    new Text('\n'),
                    new NativeButton(
                      child: new Text(
                        'Tuesday (All Periods)',
                        style:
                            new TextStyle(color: Colors.white.withOpacity(0.9)),
                      ),
                      buttonColor: Colors.red,
                      onPressed: _showMondayTuesdayFriday,
                    ),
                    new Text('\n'),
                    new NativeButton(
                      child: new Text(
                        'Wednesday (Block Schedule)',
                        style:
                            new TextStyle(color: Colors.white.withOpacity(0.9)),
                      ),
                      buttonColor: Colors.red,
                      onPressed: _showWednesday,
                    ),
                    new Text('\n'),
                    new NativeButton(
                      child: new Text(
                        'Thursday (Block Schedule)',
                        style:
                            new TextStyle(color: Colors.white.withOpacity(0.9)),
                      ),
                      buttonColor: Colors.red,
                      onPressed: _showThursday,
                    ),
                    new Text('\n'),
                    new NativeButton(
                      child: new Text(
                        'Friday (All Periods)',
                        style:
                            new TextStyle(color: Colors.white.withOpacity(0.9)),
                      ),
                      buttonColor: Colors.red,
                      onPressed: _showMondayTuesdayFriday,
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
