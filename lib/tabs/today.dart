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
          new RaisedButton(
            child: new Text(
              'Setup your classes',
              style: new TextStyle(
                  color: Colors.white.withOpacity(0.9)),
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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('Classes Setup'),
          actions: <Widget>[

          ],
        ),
        body: ListView(
          children: <Widget>[


          ],
        ));
  }
}

