import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'contact_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_villains/villain.dart';
import 'package:share/share.dart';

class ContactViewPage extends StatelessWidget {
  final Contact contact;

  ContactViewPage({Key key, this.contact}) : super(key: key);

  void share() {
    Share.share(contact.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(contact.fullName),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Villain(
                villainAnimation: VillainAnimation.fromBottom(
                  relativeOffset: 0.2,
                  from: Duration(milliseconds: 0),
                  to: Duration(milliseconds: 170),
                ),
                animateExit: false,
                secondaryVillainAnimation: VillainAnimation.fade(),
                child: new Card(
                  child: new Column(
                    children: <Widget>[
                      new ListTile(
                        leading: new Icon(
                          Icons.class_,
                          color: Colors.redAccent,
                          size: 26.0,
                        ),
                        title: new Text(
                          contact.department,
                          style: new TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ),
                      //-- This is going to added back as soon as we get permission from the principal
                      
                      // new ListTile(
                      //   leading: new Icon(
                      //     Icons.room,
                      //     color: Colors.redAccent,
                      //     size: 26.0,
                      //   ),
                      //   title: new Text(
                      //     contact.room,
                      //     style: new TextStyle(fontWeight: FontWeight.w400),
                      //   ),
                      // ),
                      new ListTile(
                        onTap: () {
                          launch('mailto:' + contact.email);
                        },
                        onLongPress: share,
                        leading: new Icon(
                          Icons.email,
                          color: Colors.redAccent,
                          size: 26.0,
                        ),
                        title: new Text(
                          contact.email,
                          style: new TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ),
                      new ListTile(
                        onTap: () {
                          launch(contact.website);
                        },
                        leading: new Icon(
                          Icons.web,
                          color: Colors.redAccent,
                          size: 26.0,
                        ),
                        title: new Text(
                          contact.website,
                          style: new TextStyle(fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

//Text(contact.email)
