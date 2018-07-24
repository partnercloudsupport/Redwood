import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class changelog extends StatelessWidget {
  @override
  Widget build (BuildContext context) => new Scaffold(

    //App Bar
    appBar: new AppBar(
      title: new Text(
        'Changelog - BETA',
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
              new Text('\n\n'),
              new Card(
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ListTile(
                      title: new Text('0.0.9'),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new Text(
                          '   New',
                          style: new TextStyle(color: Colors.green.withOpacity(0.9), fontSize: 12.0),
                        ),
                        const Expanded(child: const Text(
                          '   Completely redesigned the about page 😀',
                          style: const TextStyle( fontSize: 12.0),
                        )),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new Text(
                          '   New',
                          style: new TextStyle(color: Colors.green.withOpacity(0.9), fontSize: 12.0),
                        ),
                        const Expanded(child: const Text(
                          '   There is now a new settings page where you can select what periods you have classes.',
                          style: const TextStyle( fontSize: 12.0),
                        )),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new Text(
                          '   New',
                          style: new TextStyle(color: Colors.green.withOpacity(0.9), fontSize: 12.0),
                        ),
                        const Expanded(child: const Text(
                          '   There is now feedback cards in the Changelog, About and settings pages.',
                          style: const TextStyle( fontSize: 12.0),
                        )),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new Text(
                          '   Fix\'s',
                          style: new TextStyle(color: Colors.yellow.withOpacity(0.9), fontSize: 12.0),
                        ),
                        const Expanded(child: const Text(
                          '   Removed the Feed page, and now there is a today page with all the info you need to get through the school day!',
                          style: const TextStyle( fontSize: 12.0),
                        )),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new Text(
                          '   Bug',
                          style: new TextStyle(color: Colors.red.withOpacity(0.9), fontSize: 12.0),
                        ),
                        const Expanded(child: const Text(
                          '   Bug Fixes',
                          style: const TextStyle( fontSize: 12.0),
                        )),
                      ],
                    ),
                    new Text('\n'),
                  ],
                ),
              ),

              //Feedback Card
              new Text('\n'),
              new Card(
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ListTile(
                      title: new Text('Feedback'),
                      subtitle: new Text(
                        'Feedback help us better develop the app',
                        style: new TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 12.0),
                      ),
                    ),
                    new RaisedButton(
                      child: new Text('Send Feedback',  style: new TextStyle(color: Colors.white.withOpacity(0.9)),),
                      color: Theme.of(context).accentColor,
                      elevation: 4.0,
                      splashColor: Colors.blueGrey,
                      onPressed: FBURL,
                    ),
                    new Text('\n')
                  ],
                ),
              ),
              new Text('\n\n'),
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