import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:native_widgets/native_widgets.dart';

class changelog extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Scaffold(
        //App Bar
        appBar: new AppBar(
          title: new Text(
            'Changelog - BETA'
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
                  new Text('\n\n'),
                  new Card(
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new ListTile(
                          title:
                              new Text('V1.0'),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Text(
                              '   New',
                              style: new TextStyle(
                                  color: Colors.green.withOpacity(0.9),
                                  fontSize: 12.0),
                            ),
                            const Expanded(
                                child: const Text(
                                  '   Redwood App is now in the IOS App store!',
                                  style: const TextStyle(fontSize: 12.0),
                                )),
                          ],
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Text(
                              '   New',
                              style: new TextStyle(
                                  color: Colors.green.withOpacity(0.9),
                                  fontSize: 12.0),
                            ),
                            const Expanded(
                                child: const Text(
                                  '   New Faculty page where you can find info about teachers.',
                                  style: const TextStyle(fontSize: 12.0),
                                )),
                          ],
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Text(
                              '   New',
                              style: new TextStyle(
                                  color: Colors.green.withOpacity(0.9),
                                  fontSize: 12.0),
                            ),
                            const Expanded(
                                child: const Text(
                                  '   New and updated bells page',
                                  style: const TextStyle(fontSize: 12.0),
                                )),
                          ],
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Text(
                              '   New',
                              style: new TextStyle(
                                  color: Colors.green.withOpacity(0.9),
                                  fontSize: 12.0),
                            ),
                            const Expanded(
                                child: const Text(
                                  '   Added a Open Source Licenses page',
                                  style: const TextStyle(fontSize: 12.0),
                                )),
                          ],
                        ),
                        new Text(''),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Text(
                              '   Fix\'s',
                              style: new TextStyle(
                                  color: Colors.yellow.withOpacity(0.9),
                                  fontSize: 12.0),
                            ),
                            const Expanded(
                                child: const Text(
                              '   Fixed TV page where it wouldn\'t load on mobile data',
                              style: const TextStyle(fontSize: 12.0),
                            )),
                          ],
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Text(
                              '   Fix\'s',
                              style: new TextStyle(
                                  color: Colors.yellow.withOpacity(0.9),
                                  fontSize: 12.0),
                            ),
                            const Expanded(
                                child: const Text(
                                  '   Removed Today page while its being worked on.',
                                  style: const TextStyle(fontSize: 12.0),
                                )),
                          ],
                        ),
                        new Text('\n'),
                      ],
                    ),
                  ),
                  new Card(
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new ListTile(
                          title: new Text('0.1.3'),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Text(
                              '   New',
                              style: new TextStyle(
                                  color: Colors.green.withOpacity(0.9),
                                  fontSize: 12.0),
                            ),
                            const Expanded(
                                child: const Text(
                              '   IOS Beta is out!',
                              style: const TextStyle(fontSize: 12.0),
                            )),
                          ],
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Text(
                              '   New',
                              style: new TextStyle(
                                  color: Colors.green.withOpacity(0.9),
                                  fontSize: 12.0),
                            ),
                            const Expanded(
                                child: const Text(
                              '   Added Native Buttons for Android and IOS',
                              style: const TextStyle(fontSize: 12.0),
                            )),
                          ],
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Text(
                              '   Fix\'s',
                              style: new TextStyle(
                                  color: Colors.yellow.withOpacity(0.9),
                                  fontSize: 12.0),
                            ),
                            const Expanded(
                                child: const Text(
                              '   Fixed Quick Actions',
                              style: const TextStyle(fontSize: 12.0),
                            )),
                          ],
                        ),
                        new Text('\n'),
                      ],
                    ),
                  ),
                  new Card(
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new ListTile(
                          title: new Text('0.1.1'),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Text(
                              '   Fix\'s',
                              style: new TextStyle(
                                  color: Colors.yellow.withOpacity(0.9),
                                  fontSize: 12.0),
                            ),
                            const Expanded(
                                child: const Text(
                              '   Bug Fixes',
                              style: const TextStyle(fontSize: 12.0),
                            )),
                          ],
                        ),
                        new Text('\n'),
                      ],
                    ),
                  ),
                  new Card(
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new ListTile(
                          title: new Text('0.1.0'),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Text(
                              '   New',
                              style: new TextStyle(
                                  color: Colors.green.withOpacity(0.9),
                                  fontSize: 12.0),
                            ),
                            const Expanded(
                                child: const Text(
                              '   Added the Announcements card on the today page',
                              style: const TextStyle(fontSize: 12.0),
                            )),
                          ],
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Text(
                              '   New',
                              style: new TextStyle(
                                  color: Colors.green.withOpacity(0.9),
                                  fontSize: 12.0),
                            ),
                            const Expanded(
                                child: const Text(
                              '   Added Team RHS Discord Page 😎',
                              style: const TextStyle(fontSize: 12.0),
                            )),
                          ],
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Text(
                              '   Bug',
                              style: new TextStyle(
                                  color: Colors.red.withOpacity(0.9),
                                  fontSize: 12.0),
                            ),
                            const Expanded(
                                child: const Text(
                              '   Other small fixes :D',
                              style: const TextStyle(fontSize: 12.0),
                            )),
                          ],
                        ),
                        new Text('\n'),
                      ],
                    ),
                  ),
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
                              style: new TextStyle(
                                  color: Colors.green.withOpacity(0.9),
                                  fontSize: 12.0),
                            ),
                            const Expanded(
                                child: const Text(
                              '   Completely redesigned the about page 😀',
                              style: const TextStyle(fontSize: 12.0),
                            )),
                          ],
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Text(
                              '   New',
                              style: new TextStyle(
                                  color: Colors.green.withOpacity(0.9),
                                  fontSize: 12.0),
                            ),
                            const Expanded(
                                child: const Text(
                              '   There is now a new settings page where you can select what periods you have classes.',
                              style: const TextStyle(fontSize: 12.0),
                            )),
                          ],
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Text(
                              '   New',
                              style: new TextStyle(
                                  color: Colors.green.withOpacity(0.9),
                                  fontSize: 12.0),
                            ),
                            const Expanded(
                                child: const Text(
                              '   There is now feedback cards in the Changelog, About and settings pages.',
                              style: const TextStyle(fontSize: 12.0),
                            )),
                          ],
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Text(
                              '   Fix\'s',
                              style: new TextStyle(
                                  color: Colors.yellow.withOpacity(0.9),
                                  fontSize: 12.0),
                            ),
                            const Expanded(
                                child: const Text(
                              '   Removed the Feed page, and now there is a today page with all the info you need to get through the school day!',
                              style: const TextStyle(fontSize: 12.0),
                            )),
                          ],
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Text(
                              '   Bug',
                              style: new TextStyle(
                                  color: Colors.red.withOpacity(0.9),
                                  fontSize: 12.0),
                            ),
                            const Expanded(
                                child: const Text(
                              '   Bug Fixes',
                              style: const TextStyle(fontSize: 12.0),
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
                            'Feedback helps us improve the app',
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
                  new Text(
                    '\n\nPowered by',
                    style: new TextStyle(color: Colors.white.withOpacity(0.9)),
                  ),
                  new Text(
                    'isontic',
                    style: new TextStyle(
                        color: Colors.white.withOpacity(1.0),
                        fontSize: 65.0,
                        fontFamily: 'Pacifico'),
                  ),
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
