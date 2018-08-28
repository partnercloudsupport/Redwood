import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:native_widgets/native_widgets.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart';
import 'package:package_info/package_info.dart';

class Dev extends StatelessWidget {

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


  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = new Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<int> _counter;

  Future<Null> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;

    final bool _value0 = true;
    prefs.setBool("_0_Period", _value0);

  }

  @override
  void initState() {
    super.initState();

    _counter = _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('counter') ?? 0);
    });

    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() => _connectionStatus = result.toString());
    });

    init();
  }

  SharedPreferences prefs;

  String Name = 'John';
  bool zeroPeriod = false;
  bool firstPeriod = false;
  bool secondPeriod = false;
  bool thirdPeriod = false;
  bool forthPeriod = false;
  bool fifthPeriod = false;
  bool sixthPeriod = false;
  bool seventhPeriod = false;

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
    Name = prefs.getString('Name');

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

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<Null> initConnectivity() async {
    String connectionStatus;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      connectionStatus = (await _connectivity.checkConnectivity()).toString();
    } on PlatformException catch (e) {
      print(e.toString());
      connectionStatus = 'Failed to get connectivity.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return;
    }

    setState(() {
      _connectionStatus = connectionStatus;
    });
  }

  @override
  Widget build(BuildContext context) => new Scaffold(
        //App Bar
        appBar: new AppBar(
          title: new Text(
            'Dev Page'
          ),
        ),

        //Content of tabs
        body: new Container(
          // Add box decoration
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              // new
              // Where the linear gradient begins and ends
              begin: Alignment.topRight, // new
              end: Alignment.bottomLeft, // new
              // Add one stop for each color.
              // Stops should increase
              // from 0 to 1
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's
                // Colors class.
                Colors.blue[800],
                Colors.indigo[700],
                Colors.indigo[600],
                Colors.deepPurple[400],
              ],
            ),
          ),
          child: new ListView(
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text('\n'),
                  new Text(
                    'For Dev\'s no use for normal users ',
                    style: new TextStyle(
                        color: Colors.white.withOpacity(0.9), fontSize: 12.0),
                  ),
                  new Text('\n'),
                  new Text('$Name'),
                  new Text('$_connectionStatus',
                      style: new TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 12.0)),
                  new FutureBuilder<int>(
                      future: _counter,
                      builder:
                          (BuildContext context, AsyncSnapshot<int> snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return const CircularProgressIndicator();
                          default:
                            if (snapshot.hasError)
                              return new Text('Error: ${snapshot.error}');
                            else
                              return new Text('${snapshot.data} \n\n');
                        }
                      }),
                  new GestureDetector(
                    onTap: () {
                      _incrementCounter;
                    },
                    child: new Text(
                      'isontic',
                      style: new TextStyle(
                          color: Colors.white.withOpacity(1.0),
                          fontSize: 55.0,
                          fontFamily: 'Pacifico'),
                    ),
                  ),
//                  new RaisedButton(
//                    onPressed: _incrementCounter,
//                    child: new Text('Increment Counter'),
//                  ),
                  new FutureBuilder<int>(
                      future: _counter,
                      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return const CircularProgressIndicator();
                          default:
                            if (snapshot.hasError)
                              return new Text('Error: ${snapshot.error}');
                            else
                              return new Text(
                                'Button tapped ${snapshot.data} time${ snapshot.data == 1 ? '' : 's' }.\n\n'
                                    'This should persist across restarts.',
                              );
                        }
                      }),
                ],
              )
            ],
          ),
        ),
      );
}
