import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:native_widgets/native_widgets.dart';

class Donate extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Scaffold(
        //App Bar
        appBar: new AppBar(
          title: new Text(
            'Donate',
            style: new TextStyle(
              fontSize: Theme.of(context).platform == TargetPlatform.iOS
                  ? 17.0
                  : 20.0,
            ),
          ),
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
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
                    '\nYou can support the app buy watching a',
                    style: new TextStyle(
                        color: Colors.white.withOpacity(0.9), fontSize: 15.0),
                  ),
                  new Text(
                    '30 second ad that helps pay for a ',
                    style: new TextStyle(
                        color: Colors.white.withOpacity(0.9), fontSize: 15.0),
                  ),
                  new Text(
                    'Apple Developer License and other fees.',
                    style: new TextStyle(
                        color: Colors.white.withOpacity(0.9), fontSize: 15.0),
                  ),
                  new Text('\n'),

                  new NativeButton(
                    child: new Text(
                      'Watch 30 second Ad',
                      style:
                          new TextStyle(color: Colors.white.withOpacity(0.9)),
                    ),
                    buttonColor: Colors.red,
                    onPressed: GitHub,
                  ),

                  new Text('\n'),
                  new Card(
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new ListTile(
                          title: new Text('Feedback'),
                          subtitle: new Text(
                            'Feedback help us better develop the app',
                            style: new TextStyle(
                                color: Colors.grey.withOpacity(0.9),
                                fontSize: 12.0),
                          ),
                        ),
                        new NativeButton(
                          child: new Text(
                            'Send Feedback',
                            style: new TextStyle(
                                color: Colors.white.withOpacity(0.9)),
                          ),
                          buttonColor: Colors.red,
                          onPressed: FBURL,
                        ),
                        new Text('\n')
                      ],
                    ),
                  ),
                  new Text('\n'),
                ],
              )
            ],
          ),
        ),
      );
}

FBURL() {
  launch(
      'https://docs.google.com/forms/d/e/1FAIpQLScG_fu-2lpfdikypltPVxxVmpBJtpvcRYrD-n1V2frlQtS9IQ/viewform?usp=sf_link');
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
