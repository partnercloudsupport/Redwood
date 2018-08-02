import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:native_widgets/native_widgets.dart';

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

  @override
  void initState() {
    super.initState();
  }

  bool page = true;
  bool classes_setup = false;
  String nextclassstart = '5';

  @override
  Widget build(BuildContext context) {

    if (page == true && classes_setup == true){
      return new Column(
        children: <Widget>[
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(
                  title: new Text('Announcements 📢'),
                  subtitle: new Text('None today 😎'),
                ),

              ],
            ),
          ),
          new Divider(height: 10.0,color: Colors.grey,),
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(
                  title: new Text('Your Next Class Starts in ' + nextclassstart +  ' minutes'),
                ),

              ],
            ),
          ),
          new Divider(height: 10.0,color: Colors.grey,),
        ],
      );
    }

    if (page == true && classes_setup == false){
      return new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new ListTile(
                  title: new Text('Announcements 📢'),
                  subtitle: new Text('None today 😎'),
                ),

              ],
            ),
          ),
          new Text('Select the class\'s you have.'),
          new NativeButton(
            child: new Text(
              'Setup your class\'s',
              style:
              new TextStyle(color: Colors.white.withOpacity(0.9)),
            ),
            buttonColor: Colors.red,
            onPressed: () {},
          ),
        ],
      );
    }

    if (page == false) {
      return new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Icon(
              FontAwesomeIcons.bolt,
              size: 150.0,
              color: Colors.black12
          ),
          new Text('Today Page Coming Soon')
        ],
      );
    }
  }


}
