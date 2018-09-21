import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'contact_data.dart';
import 'contact_details.dart';
//import 'package:material_search/material_search.dart';
import 'package:flutter_villains/villain.dart';

class Directory extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Faculty Directory"),
          elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
        body: Container(
          child: ContactList(kContacts),
        ));
  }
}

class ContactList extends StatelessWidget {
  final List<Contact> _contacts;

  ContactList(this._contacts);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: _contacts.length,
      itemBuilder: _buildContacts,
    );
  }

  Widget _buildContacts(context, index) {
    return ContactItem(_contacts[index]);
  }
}

class ContactItem extends StatelessWidget {
  const ContactItem(this.contact);

  final Contact contact;

  Widget _buildTiles(BuildContext context, Contact contact) {
    return
      Padding(
        padding: new EdgeInsets.only(left: 7.0, right: 7.0, top: 4.0, bottom: 4.0,),
        child: new Material(
          elevation: 3.0,
          borderRadius:
          new BorderRadius.all(new Radius.circular(10.0)),
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(contact.fullName),
                subtitle: Text(contact.department + ' | Tap for more'),
                leading: CircleAvatar(
                  child: Text(contact.fullName[0]),
                ),
                trailing: Icon(FontAwesomeIcons.infoCircle),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ContactViewPage(contact: contact);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );

  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(context, contact);
  }
}