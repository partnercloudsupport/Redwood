import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build (BuildContext context) => new Scaffold(

    //App Bar
    appBar: new AppBar(
      title: new Text(
        'Settings',
        style: new TextStyle(
          fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
        ),
      ),
      elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
    ),

    //Content of tabs
    body: new PageView(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new Card(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new ListTile(
                    title: new Text('Your Classes'),
                    subtitle: new Text(
                      'Select the periods you have classes in.',
                      style: new TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 12.0),
                    ),
                  ),


                ],
              ),
            ),
          ],
        )
      ],
    ),
  );
}