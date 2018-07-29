import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class discord extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Scaffold(
        //App Bar
        appBar: new AppBar(
          title: new Text(
            'Team RHS Discord',
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
                  new Text('\n\n'),
                  new Card(
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new ListTile(
                          title: new Text('Disclaimer'),
                        ),
                        new Text(
                          'Redwood App project is not connected to Team RHS',
                          style: const TextStyle(fontSize: 12.0),
                        ),
                        new Text(
                          'nor does we or any of are sponsors endorse any of',
                          style: const TextStyle(fontSize: 12.0),
                        ),
                        new Text(
                          'its action but since they are student-run and',
                          style: const TextStyle(fontSize: 12.0),
                        ),
                        new Text(
                          'made we would like to support them by ',
                          style: const TextStyle(fontSize: 12.0),
                        ),
                        new Text(
                          'providing a link to join the Discord server.',
                          style: const TextStyle(fontSize: 12.0),
                        ),
                        new Text('\n')
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
                          title: new Text('Join the Team RHS Discord!'),
                        ),
                        new RaisedButton(
                          child: new Text(
                            'Join!',
                            style: new TextStyle(
                                color: Colors.white.withOpacity(0.9)),
                          ),
                          color: Theme.of(context).accentColor,
                          elevation: 4.0,
                          splashColor: Colors.blueGrey,
                          onPressed: discordl,
                        ),
                        new Text('\n')
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}

discordl() {
  launch('https://discord.gg/B46YYn4');
}
