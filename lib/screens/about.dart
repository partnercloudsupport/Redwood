import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:native_widgets/native_widgets.dart';
import 'package:flutter_villains/villain.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Scaffold(
        //App Bar
        appBar: new AppBar(
          title: new Text(
            'About'
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
              new Villain(
                villainAnimation: VillainAnimation.fromRight(
                  from: Duration(milliseconds: 50),
                  to: Duration(milliseconds: 150),
                ),
                animateExit: false,
                secondaryVillainAnimation: VillainAnimation.fade(),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text('\n\n'),
                    new Text(
                      'App Created by',
                      style: new TextStyle(
                          color: Colors.white.withOpacity(0.9), fontSize: 25.0),
                    ),
                    new Text(
                      'Elias Deuss',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 22.0),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new IconButton(
                          icon: new Icon(
                            FontAwesomeIcons.twitter,
                            color: Colors.white,
                          ),
                          tooltip: 'Elias on Twitter',
                          onPressed: EliasTwitter,
                        ),
                        new IconButton(
                          icon: new Icon(
                            FontAwesomeIcons.instagram,
                            color: Colors.white,
                          ),
                          tooltip: 'Elias on Instagram',
                          onPressed: EliasInstagram,
                        ),
                        new IconButton(
                          icon: new Icon(
                            FontAwesomeIcons.snapchatGhost,
                            color: Colors.white,
                          ),
                          tooltip: 'Elias on Snapchat',
                          onPressed: EliasSnapchat,
                        ),
                        new IconButton(
                          icon: new Icon(
                            FontAwesomeIcons.github,
                            color: Colors.white,
                          ),
                          tooltip: 'Elias on Github',
                          onPressed: EliasGithub,
                        ),
                      ],
                    ),
                    new Text('\nApp Icon Created by:',
                        style: new TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 25.0)),
                    new Text(
                      'Lauren Smart',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 22.0),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new IconButton(
                          icon: new Icon(
                            FontAwesomeIcons.instagram,
                            color: Colors.white,
                          ),
                          tooltip: 'Lauren on Instagram',
                          onPressed: LaurenInstagram,
                        ),
                      ],
                    ),
                    new Text(
                      '\n\nSupport from',
                      style: new TextStyle(
                          color: Colors.white.withOpacity(0.9), fontSize: 25.0),
                    ),
                    new Text(
                      'isontic',
                      style: new TextStyle(
                          color: Colors.white.withOpacity(1.0),
                          fontSize: 65.0,
                          fontFamily: 'Pacifico'),
                    ),
                    new Text(
                      'GRD | Energy Inc.',
                      style: new TextStyle(
                          color: Colors.white.withOpacity(0.9), fontSize: 29.0),
                    ),
                    new Text(
                      '\n\n\nThe Redwood High School app is not an official',
                      style: new TextStyle(
                          color: Colors.white.withOpacity(0.9), fontSize: 15.0),
                    ),
                    new Text(
                      'school app but was created and is maintained by',
                      style: new TextStyle(
                          color: Colors.white.withOpacity(0.9), fontSize: 15.0),
                    ),
                    new Text(
                      'Redwood students. The app is also open source!',
                      style: new TextStyle(
                          color: Colors.white.withOpacity(0.9), fontSize: 15.0),
                    ),
                    new Text(
                      'If you are interested in seeing the code of the',
                      style: new TextStyle(
                          color: Colors.white.withOpacity(0.9), fontSize: 15.0),
                    ),
                    new Text(
                      'app or helping with the project you can do so here:\n',
                      style: new TextStyle(
                          color: Colors.white.withOpacity(0.9), fontSize: 15.0),
                    ),
                    new RaisedButton(
                      child: new Text(
                        'Open Github Project',
                        style: new TextStyle(
                            color: Colors.white.withOpacity(0.9)),
                      ),
                      color: Colors.red,
                      elevation: 4.0,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      splashColor: Colors.grey,
                      onPressed: GitHub,
                    ),
                    new Text(''),
                    new RaisedButton(
                      child: new Text(
                        'Open Source Licenses',
                        style: new TextStyle(
                            color: Colors.white.withOpacity(0.9)),
                      ),
                      color: Colors.lightBlue,
                      elevation: 4.0,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      splashColor: Colors.grey,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed('/opl');
                      },
                    ),
                    new Text('\n'),
                    new Card(
                      child: new Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new ListTile(
                            title: new Text('Feedback'),
                            subtitle: new Text(
                              'Feedback helps us improve the app',
                              style: new TextStyle(
                                  color: Colors.grey.withOpacity(0.9),
                                  fontSize: 12.0),
                            ),
                          ),
                          new RaisedButton(
                            child: new Text(
                              'Send Feedback',
                              style: new TextStyle(
                                  color: Colors.white.withOpacity(0.9)),
                            ),
                            color: Colors.red,
                            elevation: 4.0,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            splashColor: Colors.grey,
                            onPressed: FBURL,
                          ),
                          new Text('\n')
                        ],
                      ),
                    ),
                    new Text('\n'),
//                  new NativeButton(
//                      child: new Text(
//                        'Dev Page',
//                        style:
//                            new TextStyle(color: Colors.white.withOpacity(0.9)),
//                      ),
//                      buttonColor: Colors.blue,
//                      onPressed: () {
//                        Navigator.pop(context);
//                        Navigator.of(context).pushNamed('/dev');
//                      }),
//                  new Text('\n'),
                  ],
                )
              ),
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
