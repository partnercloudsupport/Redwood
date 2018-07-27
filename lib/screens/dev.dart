import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:native_widgets/native_widgets.dart';

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
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    setState(() {
      _counter = prefs.setInt("counter", counter).then((bool success) {
        return counter;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
          setState(() => _connectionStatus = result.toString());
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
  Widget build (BuildContext context) => new Scaffold(

    //App Bar
    appBar: new AppBar(
      title: new Text(
        'Dev Page',
        style: new TextStyle(
          fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
        ),
      ),
      elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
    ),

    //Content of tabs
    body: new Container(
      // Add box decoration
      decoration: new BoxDecoration(
        gradient: new LinearGradient(                                 // new
          // Where the linear gradient begins and ends
          begin: Alignment.topRight,                                  // new
          end: Alignment.bottomLeft,                                  // new
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
                style: new TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 12.0),
              ),
              new Text('\n'),
              new Text('$_connectionStatus', style: new TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 12.0)),
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
                      '${snapshot.data} \n\n'
                    );
              }
            }),

      new GestureDetector(
          onTap: (){
            _incrementCounter;
          },
          child: new Text(
            'isontic',
            style: new TextStyle(color: Colors.white.withOpacity(1.0), fontSize: 55.0, fontFamily: 'Pacifico'),
          ),
      ),
            ],
          )

        ],
      ),
    ),


  );
}

FBURL() {
  launch('https://docs.google.com/forms/d/e/1FAIpQLScG_fu-2lpfdikypltPVxxVmpBJtpvcRYrD-n1V2frlQtS9IQ/viewform?usp=sf_link');
}
GitHub() {
  launch('https://github.com/isontic/Redwood');
}

//Elias
EliasTwitter() {
  launch('https://twitter.com/EliasDeuss');
}
EliasInstagram() {
  launch('https://instagram.com/EliasDeuss');
}
EliasSnapchat() {
  launch('https://snapchat.com/add/EliasDeuss');
}
EliasGithub() {
  launch('https://github.com/EliasDeuss');
}

//Lauren
LaurenInstagram() {
  launch('https://instagram.com/Lauren.smartt');
}