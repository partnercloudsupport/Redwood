import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart';
import 'package:package_info/package_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Dev extends StatelessWidget {

  @override
  Widget build(BuildContext context) => new Container(
        child: new HomePage(),
      );

}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {


  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = new Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<int> _counter;

  Future<Null> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;

    final bool _value0 = true;
    prefs.setBool("_0_Period", _value0);

  }

  @override
  void initState() {
    super.initState();

    _counter = _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('counter') ?? 0);
    });

    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() => _connectionStatus = result.toString());
    });

    init();
  }

  SharedPreferences prefs;

  String Name = 'John';
  bool zeroPeriod = false;
  bool firstPeriod = false;
  bool secondPeriod = false;
  bool thirdPeriod = false;
  bool forthPeriod = false;
  bool fifthPeriod = false;
  bool sixthPeriod = false;
  bool seventhPeriod = false;

  void init() async {
    prefs = await SharedPreferences.getInstance();

    zeroPeriod = prefs.getBool('zeroPeriod');
    firstPeriod = prefs.getBool('firstPeriod');
    secondPeriod = prefs.getBool('secondPeriod');
    thirdPeriod = prefs.getBool('thirdPeriod');
    forthPeriod = prefs.getBool('forthPeriod');
    fifthPeriod = prefs.getBool('fifthPeriod');
    sixthPeriod = prefs.getBool('sixthPeriod');
    seventhPeriod = prefs.getBool('seventhPeriod');
    Name = prefs.getString('Name');

    setState(() {
      zeroPeriod;
      firstPeriod;
      secondPeriod;
      thirdPeriod;
      forthPeriod;
      fifthPeriod;
      sixthPeriod;
      seventhPeriod;
      Name;
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<Null> initConnectivity() async {
    String connectionStatus;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      connectionStatus = (await _connectivity.checkConnectivity()).toString();
    } on PlatformException catch (e) {
      print(e.toString());
      connectionStatus = 'Failed to get connectivity.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return;
    }

    setState(() {
      _connectionStatus = connectionStatus;
    });
  }

  void _Settings() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new showSettings();
        },
        fullscreenDialog: true));
  }

  @override
  Widget build(BuildContext context) => new Scaffold(
        //App Bar
        appBar: new AppBar(
          title: new Text(
            'Dev Page'
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
                  new Text('\n'),
                  new Text(
                    'For Dev\'s no use for normal users ',
                    style: new TextStyle(
                        color: Colors.white.withOpacity(0.9), fontSize: 12.0),
                  ),
                  new Text('\n'),
                  new Text('$Name'),
                  new Text('$_connectionStatus',
                      style: new TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 12.0)),
//                  new RaisedButton(
//                    child: new Text(
//                      'Login',
//                      style: new TextStyle(
//                          color: Colors.white.withOpacity(0.9)),
//                    ),
//                    color: Colors.blue,
//                    elevation: 4.0,
//                    shape: new RoundedRectangleBorder(
//                        borderRadius: new BorderRadius.circular(30.0)),
//                    splashColor: Colors.grey,
//                    onPressed: _Settings,
//                  ),

                  new Card(
                    child: new Column(
                      children: <Widget>[
                        new ListTile(
                            leading: new Icon(
                                FontAwesomeIcons.tasks),
                            title: new Text('Tasks'),
                            subtitle: new Text(
                                'Create tasks for your work'),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator
                                  .of(context)
                                  .pushNamed('/todo');
                            }),
                      ],
                    ),
                  ),

                  new GestureDetector(
                    onTap: () {
                      _incrementCounter;
                    },
                    child: new Text(
                      'isontic',
                      style: new TextStyle(
                          color: Colors.white.withOpacity(1.0),
                          fontSize: 55.0,
                          fontFamily: 'Pacifico'),
                    ),
                  ),
//                  new RaisedButton(
//                    onPressed: _incrementCounter,
//                    child: new Text('Increment Counter'),
//                  ),
                ],
              )
            ],
          ),
        ),
      );
}

class showSettings extends StatefulWidget {
  @override
  showSettingsState createState() => new showSettingsState();
}

class showSettingsState extends State<showSettings> {

  //Stored Password
  String Pass;
  //User inputed Password
  String PassU;

  String Title;
  String IMGURL;
  String VidURL;

  String Sug;

  final TextEditingController _controller1 = new TextEditingController();
  final TextEditingController _controller2 = new TextEditingController();
  final TextEditingController _controller3 = new TextEditingController();
  final TextEditingController _controller4 = new TextEditingController();

  StreamSubscription<DocumentSnapshot> subscription;

  final DocumentReference documentReference =
  Firestore.instance.document("users/admin");


  void _fetch() {
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
          Pass = datasnapshot.data['pass'];
        });
      }
    });
  }



  @override
  void initState() {
    super.initState();
    this._fetch();
  }

  void _onChanged1(String val) {
    setState(() {
      PassU = val;
    });
  }

  void _onChanged2(String val) {
    setState(() {
      Title = val;
    });
  }

  void _onChanged3(String val) {
    setState(() {
      IMGURL = val;
    });
  }

  void _onChanged4(String val) {
    setState(() {
      VidURL = val;
    });
  }

  void checkpassword() async {
    if (Pass == PassU){
//      Map<String, String> data = <String, String>{
//        "title": Title,
//        "img-url": IMGURL,
//        "vid-url": VidURL,
//      };
//      documentReference.updateData(data).whenComplete(() {
//        Sug = 'Updated!';
//      }).catchError((e) => print(e));
      Sug = 'YEs';
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'TV Settings',
          style: new TextStyle(
            fontSize: Theme
                .of(context)
                .platform == TargetPlatform.iOS
                ? 17.0
                : 20.0,
          ),
        ),
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
                      title: new Text('TV'),
                      subtitle: new Text(
                        'Input all info!!',
                        style: new TextStyle(
                            color: Colors.grey.withOpacity(0.9),
                            fontSize: 12.0),
                      ),
                    ),
                    new ListTile(
                      title: new Text('Title'),
                    ),
                    new ListTile(
                      title: new TextField(
                        decoration: new InputDecoration(
                          hintText: "Title..",
                        ),
                        controller: _controller2,
                        onChanged: (String value) {
                          _onChanged2(value);
                        },
                      ),
                    ),
                    new ListTile(
                      title: new Text('Image URL'),
                    ),
                    new ListTile(
                      title: new TextField(
                        decoration: new InputDecoration(
                          hintText: "URL..",
                        ),
                        controller: _controller3,
                        onChanged: (String value) {
                          _onChanged3(value);
                        },
                      ),
                    ),
                    new ListTile(
                      title: new Text('Vid URL'),
                    ),
                    new ListTile(
                      title: new TextField(
                        decoration: new InputDecoration(
                          hintText: "URL..",
                        ),
                        controller: _controller4,
                        onChanged: (String value) {
                          _onChanged4(value);
                        },
                      ),
                    ),
                    new ListTile(
                      title: new Text('Security Code'),
                    ),
                    new ListTile(
                      title: new TextField(
                        decoration: new InputDecoration(
                          hintText: "Code..",
                        ),
                        controller: _controller1,
                        onChanged: (String value) {
                          _onChanged1(value);
                        },
                      ),
                    ),
                    new Text(''),
                    new RaisedButton(
                      child: new Text(
                        'Update',
                        style: new TextStyle(
                            color: Colors.white.withOpacity(0.9)),
                      ),
                      color: Colors.blue,
                      elevation: 4.0,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      splashColor: Colors.grey,
                      onPressed: checkpassword,
                    ),
                    new Text("\n"),
                    new Text('$Sug'),
                    new Text(''),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}