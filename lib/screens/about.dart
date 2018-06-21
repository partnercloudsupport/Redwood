import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build (BuildContext context) => new Scaffold(

    //App Bar
    appBar: new AppBar(
      title: new Text(
        'About', 
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
    child: new PageView(
      children: <Widget>[
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
                'App Created by',
              style: new TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 25.0),
            ),
            new Text(
              'Elias Deuss',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.9), fontSize: 22.0),
            ),
            new Text(
                '\nApp Icon Created by:',
                style: new TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 25.0)
            ),
            new Text(
              'Lauren Smart',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.9), fontSize: 22.0),
            ),
            Image.network(
              'https://i.imgur.com/jzuk15G.png',
            )
          ],
        )
      ],
    ),
  ),


  );

}


