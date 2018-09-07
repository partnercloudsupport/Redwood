import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class discord extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Scaffold(
        //App Bar
        appBar: new AppBar(
          title: new Text(
            'Discord'
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
                  new Text(''),
                  new Text(
                    'isontic',
                    style: new TextStyle(
                        color: Colors.white.withOpacity(1.0),
                        fontSize: 45.0,
                        fontFamily: 'Pacifico'),
                  ),
                  new Card(
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new ListTile(
                          title: new Text('Join the isontic Discord!'),
                          subtitle: new Text('Talk to the team or get support!'),
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
                          onPressed: discord2,
                        ),
                        new Text('\n')
                      ],
                    ),
                  ),
                  new Text('\n'),
                  new Divider(
                    height: 10.0,
                    color: Colors.grey,
                  ),
                  new Text('\n'),
                  new Text(
                    'Team RHS',
                    style: new TextStyle(
                        color: Colors.white.withOpacity(1.0),
                        fontSize: 35.0,
                    ),
                  ),
                  new Text(''),
                  new Card(
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new ListTile(
                          title: new Text('Join the Team RHS Discord!'),
                          subtitle: new Text('Talk to other students at redwood!'),
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
  launch('https://discord.gg/VxjQGMr');
}

discord2() {
  launch('https://discord.gg/X7QJ8A7');
}
