import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


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

  String nextclassstart = '5';

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Text('\nThis page is not working yet! 😢', style: new TextStyle(color: Colors.red.withOpacity(0.9)) ),
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


}
