import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tools extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Scaffold(
        //App Bar
        appBar: new AppBar(
          title: new Text('Tools'),
        ),

        //Content of tabs
        body: new Container(
          // Add box decoration
          child: new ListView(
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(''),
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                    child: new Material(
                      elevation: 5.0,
                      borderRadius:
                      new BorderRadius.all(new Radius.circular(10.0)),
                      child: new Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Container(
                            // Add box decoration
                            child: new Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  '\nTools powered by',
                                  style: new TextStyle(
                                      color: Colors.black.withOpacity(1.0)),
                                ),
                                new Text(
                                  'isontic',
                                  style: new TextStyle(
                                      color: Colors.black.withOpacity(1.0),
                                      fontSize: 50.0,
                                      fontFamily: 'Pacifico'),
                                ),
//                          new Card(
//                            child: new Column(
//                              children: <Widget>[
//                                new ListTile(
//                                    leading: new Icon(
//                                        FontAwesomeIcons.tasks),
//                                    title: new Text('Planner'),
//                                    subtitle: new Text(
//                                        'Add your homework or upcoming tests'),
//                                    onTap: () {
//                                      Navigator.pop(context);
//                                      Navigator
//                                          .of(context)
//                                          .pushNamed('/todo');
//                                    }),
//                              ],
//                            ),
//                          ),
                                new Card(
                                  child: new Column(
                                    children: <Widget>[
                                      new ListTile(
                                          leading: new Icon(
                                              FontAwesomeIcons.chalkboardTeacher),
                                          title: new Text('Faculty Directory'),
                                          subtitle: new Text(
                                              'View Info about your Teachers'),
                                          onTap: () {
                                            Navigator.pop(context);
                                            Navigator
                                                .of(context)
                                                .pushNamed('/directory');
                                          }),
                                    ],
                                  ),
                                ),
                                new Text(
                                  '\nMore Coming soon',
                                  style: new TextStyle(
                                      color: Colors.black.withOpacity(1.0)),
                                ),
                                new Text('\n'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  new Text(''),
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                    child: new Material(
                      elevation: 5.0,
                      borderRadius:
                      new BorderRadius.all(new Radius.circular(10.0)),
                      child: new Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Text(
                            '\nTools powered by\n',
                            style: new TextStyle(
                                color: Colors.black.withOpacity(1.0)),
                          ),
                          new Container(
                            height: 100.0,
                            width: 100.0,
                            child: new Image.asset('ethanent.png'),
                          ),
                          new Text(
                            '\nethanent',
                            style: new TextStyle(
                              color: Colors.black.withOpacity(1.0),
                              fontSize: 20.0,
                            ),
                          ),
                          new Card(
                            elevation: 3.0,
                            child: new Column(
                              children: <Widget>[
                                new ListTile(
                                  leading: new Icon(FontAwesomeIcons.comments),
                                  title: new Text('RHS Chat'),
                                  subtitle: new Text(
                                      'Chat with the classmates or the school'),
                                  onTap: RHSChat,
                                ),
                              ],
                            ),
                          ),
                          new Card(
                            elevation: 3.0,
                            child: new Column(
                              children: <Widget>[
                                new ListTile(
                                    leading: new Icon(FontAwesomeIcons.book),
                                    title: new Text('Common Class'),
                                    subtitle: new Text(
                                        'View who you share your classes with'),
                                    onTap: CommonClass),
                              ],
                            ),
                          ),
                          new Text('\n'),
                        ],
                      ),
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

RHSChat() {
  launch('https://chat.teamrhs.com/');
}

CommonClass() {
  launch('https://teamrhs.com/commonclasses.html');
}
