import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    child: new ListView(
      children: <Widget>[
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('\n\n'),
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
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new IconButton(
                  icon: new Icon(FontAwesomeIcons.twitter, color: Colors.white,),
                  tooltip: 'Elias on Twitter',
                  onPressed: EliasTwitter,
                ),
                new IconButton(
                  icon: new Icon(FontAwesomeIcons.instagram, color: Colors.white,),
                  tooltip: 'Elias on Instagram',
                  onPressed: EliasInstagram,
                ),
                new IconButton(
                  icon: new Icon(FontAwesomeIcons.snapchatGhost, color: Colors.white,),
                  tooltip: 'Elias on Snapchat',
                  onPressed: EliasSnapchat,
                ),
                new IconButton(
                  icon: new Icon(FontAwesomeIcons.github, color: Colors.white,),
                  tooltip: 'Elias on Github',
                  onPressed: EliasGithub,
                ),
              ],
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
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new IconButton(
                  icon: new Icon(FontAwesomeIcons.instagram, color: Colors.white,),
                  tooltip: 'Lauren on Instagram',
                  onPressed: LaurenInstagram,
                ),
              ],
            ),
            new Text(
              '\n\nSupport from',
              style: new TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 25.0),
            ),
            new Image.asset('isontic.png'),
            new Text(
              'GRD | Energy Inc.',
              style: new TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 29.0),
            ),
            new Text(
              '\n\n\nThe Redwood High School app is not a official',
              style: new TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 15.0),
            ),
            new Text(
              'school app but it is made and maintained by',
              style: new TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 15.0),
            ),
            new Text(
              'Redwood Students. The app is also open source!',
              style: new TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 15.0),
            ),
            new Text(
              'If you are interested in seeing the code of the',
              style: new TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 15.0),
            ),
            new Text(
              'app or help out the project you can so here:\n',
              style: new TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 15.0),
            ),
            new RaisedButton(
              child: new Text('Open Github Project',  style: new TextStyle(color: Colors.white.withOpacity(0.9)),),
              color: Theme.of(context).accentColor,
              elevation: 4.0,
              splashColor: Colors.blueGrey,
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