import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Settings extends StatelessWidget {


  @override
  Widget build(BuildContext context) => new Container(
    child: new HomePage(),
  );
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);


  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool _value_0 = false;
  bool _value_1 = true;
  bool _value_2 = true;
  bool _value_3 = true;
  bool _value_4 = true;
  bool _value_5 = true;
  bool _value_6 = true;
  bool _value_7 = true;

  void _onChanged(bool value) {
    setState(() {
      //0 Period
      if (_value_0 == true) {
        _value_0 = false;
      } else {
        _value_0 = true;
      }
      //1st Period
      if (_value_1 == true) {
        _value_1 = false;
      } else {
        _value_1 = true;
      }
      //2nd Period
      if (_value_2 == true) {
        _value_2 = false;
      } else {
        _value_2 = true;
      }
      //3rd Period
      if (_value_3 == true) {
        _value_3 = false;
      } else {
        _value_3 = true;
      }
      //4th Period
      if (_value_4 == true) {
        _value_4 = false;
      } else {
        _value_4 = true;
      }
      //5th Period
      if (_value_5 == true) {
        _value_5 = false;
      } else {
        _value_5 = true;
      }
      //6th Period
      if (_value_6 == true) {
        _value_6 = false;
      } else {
        _value_6 = true;
      }
      //7th Period
      if (_value_7 == true) {
        _value_7 = false;
      } else {
        _value_7 = true;
      }
    });
  }

  Widget build (BuildContext context) => new Scaffold(

    //App Bar
    appBar: new AppBar(
      title: new Text(
        'Settings',
        style: new TextStyle(
          fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
        ),
      ),
      elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
    ),

    //Content of tabs
    body: new ListView(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new Card(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new ListTile(
                    title: new Text('Your Classes'),
                    subtitle: new Text(
                      'Select the periods you have classes in.',
                      style: new TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 12.0),
                    ),
                  ),
                  new SwitchListTile(
                    title: new Text('0 Period'),
                    activeColor: Colors.red,
                    value: _value_0,
                    onChanged: (bool value){_onChanged(value);},
                  ),
                  new SwitchListTile(
                    title: new Text('1st Period'),
                    activeColor: Colors.red,
                    value: _value_1,
                    onChanged: (bool value){_onChanged(value);},
                  ),
                  new SwitchListTile(
                    title: new Text('2nd Period'),
                    activeColor: Colors.red,
                    value: _value_2,
                    onChanged: (bool value){_onChanged(value);},
                  ),
                  new SwitchListTile(
                    title: new Text('3rd Period'),
                    activeColor: Colors.red,
                    value: _value_3,
                    onChanged: (bool value){_onChanged(value);},
                  ),
                  new SwitchListTile(
                    title: new Text('4th Period'),
                    activeColor: Colors.red,
                    value: _value_4,
                    onChanged: (bool value){_onChanged(value);},
                  ),
                  new SwitchListTile(
                    title: new Text('5th Period'),
                    activeColor: Colors.red,
                    value: _value_5,
                    onChanged: (bool value){_onChanged(value);},
                  ),
                  new SwitchListTile(
                    title: new Text('6th Period'),
                    activeColor: Colors.red,
                    value: _value_6,
                    onChanged: (bool value){_onChanged(value);},
                  ),
                  new SwitchListTile(
                    title: new Text('7th Period'),
                    activeColor: Colors.red,
                    value: _value_7,
                    onChanged: (bool value){_onChanged(value);},
                  ),

                ],
              ),
            ),
          ],
        )
      ],
    ),
  );
}