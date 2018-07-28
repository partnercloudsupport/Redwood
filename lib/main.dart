import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './tabs/home.dart' as _firstTab;
import './tabs/today.dart' as _secondTab;
import './screens/about.dart' as _aboutPage;
import './screens/support.dart' as _supportPage;
import './screens/Map.dart' as _mapPage;
import './screens/changelog.dart' as _changelogPage;
import './screens/settings.dart' as _settingsPage;
import './screens/dev.dart' as _devPage;
import './screens/discord.dart' as discordPage;
import 'package:url_launcher/url_launcher.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:native_widgets/native_widgets.dart';

import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:connectivity/connectivity.dart';

void main() => runApp(

    new MaterialApp(
      title: 'Redwood',
      theme: new ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.red, backgroundColor: Colors.white
      ),
      home: new Tabs(),

      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/about': return new FromRightToLeft(
            builder: (_) => new _aboutPage.About(),
            settings: settings,
          );
          case '/support': return new FromRightToLeft(
            builder: (_) => new _supportPage.Support(),
            settings: settings,
          );
          case '/map': return new FromRightToLeft(
            builder: (_) => new _mapPage.Map(),
            settings: settings,
          );
          case '/changelog': return new FromRightToLeft(
            builder: (_) => new _changelogPage.changelog(),
            settings: settings,
          );
          case '/settings': return new FromRightToLeft(
            builder: (_) => new _settingsPage.Settings(),
            settings: settings,
          );
          case '/discord': return new FromRightToLeft(
            builder: (_) => new discordPage.discord(),
            settings: settings,
          );
          case '/dev': return new FromRightToLeft(
            builder: (_) => new _devPage.Dev(),
            settings: settings,
          );
        }
      },
      // routes: <String, WidgetBuilder> {
      //   '/about': (BuildContext context) => new _aboutPage.About(),
      // }

    ));

class FromRightToLeft<T> extends MaterialPageRoute<T> {
  FromRightToLeft({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {

    if (settings.isInitialRoute)
      return child;

    return new SlideTransition(
      child: new Container(
        decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.black26,
                blurRadius: 25.0,
              )
            ]
        ),
        child: child,
      ),
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      )
          .animate(
          new CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,
          )
      ),
    );
  }
  @override Duration get transitionDuration => const Duration(milliseconds: 400);
}

class Tabs extends StatefulWidget {
  @override
  TabsState createState() => new TabsState();
}

class TabsState extends State<Tabs> {

  String textValue = 'Hello World !';
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();

  update(String token) {
    print(token);
    DatabaseReference databaseReference = new FirebaseDatabase().reference();
    databaseReference.child('fcm-token/${token}').set({"token":token});
    textValue = token;
    setState(() {});
  }


  PageController _tabController;

  var _title_app = null;
  int _tab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new PageController();
    this._title_app = "Redwood - " + TabItems[0].title + " 🔔";
    firebaseMessaging.configure(onLaunch: (Map<String, dynamic> msg) {
      print(" onLaunch called");
    }, onResume: (Map<String, dynamic> msg) {
      print(" onResume called");
    }, onMessage: (Map<String, dynamic> msg) {
      print(" onMessage called");
    });
    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, alert: true, badge: true));
    firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings setting) {
      print('IOS Setting Registed');
    });
    firebaseMessaging.getToken().then((token) {
      update(token);
    });

    final QuickActions quickActions = const QuickActions();
    quickActions.initialize((String shortcutType) {
      if (shortcutType == 'bells') {
        _tabController.jumpToPage(0);
      }
      if (shortcutType == 'tv') {
        _tabController.jumpToPage(2);
      }
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(type: 'bells', localizedTitle: 'Bells', icon: 'notifications'),
      const ShortcutItem(type: 'tv', localizedTitle: 'Redwood Tv', icon: 'tv'),
    ]);
  }

  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build (BuildContext context) => new Scaffold(

    //App Bar
      appBar: NativeAppBar(
        title: new Text(_title_app),
        backgroundColor:
             Colors.red,
      ),

      //Content of tabs
      body: new PageView(
        controller: _tabController,
        onPageChanged: onTabChanged,
        children: <Widget>[
          new _firstTab.Home(),
          new _secondTab.Today(),
          new Tv()
        ],
      ),

      //Tabs
      bottomNavigationBar: Theme.of(context).platform == TargetPlatform.iOS ?
      new CupertinoTabBar(
        activeColor: Colors.red,
        currentIndex: _tab,
        onTap: onTap,
        items: TabItems.map((TabItem) {
          return new BottomNavigationBarItem(
            title: new Text(TabItem.title),
            icon: new Icon(TabItem.icon),
          );
        }).toList(),
      ):
      new BottomNavigationBar(
        currentIndex: _tab,
        onTap: onTap,
        items: TabItems.map((TabItem) {
          return new BottomNavigationBarItem(
            title: new Text(TabItem.title),
            icon: new Icon(TabItem.icon),
          );
        }).toList(),
      ),

      //Drawer
      drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new Container(
                height: 120.0,
                child: new DrawerHeader(
                  padding: new EdgeInsets.all(0.0),
                  decoration: new BoxDecoration(
                    color: new Color(0xFFFFEBEE),
                  ),
                  child: new Center(
                      child: new Image.asset('logo.gif')
                  ),
                ),
              ),
              new ListTile(
                leading: new Icon(Icons.school),
                title: new Text('Redwood Website'),
                onTap: RHSURL,
              ),

              new ListTile(
                leading: new Icon(FontAwesomeIcons.link),
                title: new Text('ESchool'),
                onTap: ESCHOOLURL,
              ),
//          new ListTile(
//            leading: new Icon(Icons.chat),
//            title: new Text('Support'),
//            onTap: () {
//              Navigator.pop(context);
//              Navigator.of(context).pushNamed('/support');
//            }
//          ),
              new ListTile(
                  leading: new Icon(Icons.map),
                  title: new Text('School Map'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/map');
                  }
              ),
              new Divider(height: 10.0,color: Colors.grey,),
              new ListTile(
                  leading: new Icon(Icons.settings),
                  title: new Text('Settings'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/settings');
                  }
              ),
              new ListTile(
                  leading: new Icon(Icons.info),
                  title: new Text('About'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/about');
                  }
              ),

          new ListTile(
              leading: new Icon(Icons.cached),
              title: new Text('Change Log'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/changelog');
              }
          ),
              new Divider(height: 10.0,color: Colors.grey,),
              new ListTile(
                  leading: new Icon(FontAwesomeIcons.discord),
                  title: new Text('Team RHS Discord'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/discord');
                  }
              ),
            ],
          )
      )
  );

  void onTap(int tab){
    _tabController.jumpToPage(tab);
  }

  void onTabChanged(int tab) {
    setState((){
      this._tab = tab;
    });

    switch (tab) {
      case 0:
        this._title_app = "Redwood - " + TabItems[0].title + " 🔔";
        break;

      case 1:
        this._title_app = "Redwood - " + TabItems[1].title + " ⚡";
        break;

      case 2:
        this._title_app = "Redwood - " + TabItems[2].title + " 📺";
        break;
    }
  }
}

class TabItem {
  const TabItem({ this.title, this.icon });
  final String title;
  final IconData icon;
}

const List<TabItem> TabItems = const <TabItem>[
  const TabItem(title: 'Bells', icon: Icons.notifications),
  const TabItem(title: 'Today', icon: FontAwesomeIcons.bolt),
  const TabItem(title: 'Tv', icon: Icons.tv)
];

RHSURL() {
  launch('http://redwood.org');
}

ESCHOOLURL() {
  launch('https://home.tamdistrict.org/HomeAccess/Classes/Classwork');
}

FBURL() {
  launch('https://docs.google.com/forms/d/e/1FAIpQLScG_fu-2lpfdikypltPVxxVmpBJtpvcRYrD-n1V2frlQtS9IQ/viewform?usp=sf_link');
}

class Tv extends StatelessWidget {

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

  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://raw.githubusercontent.com/isontic/data/master/tv.json"),
        headers: {
          "Accept": "application/json"
        }
    );

    this.setState(() {
      data = json.decode(response.body);


    });
    print(data[1]["title"]);
    print(data[1]["body"]);
    print(data[1]["link"]);

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();

    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
          setState(() => _connectionStatus = result.toString());
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

  void playYoutubeVideo() {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: "AIzaSyCjfc_8iJx3H1hw8ZN3J06tkKRy2lIOQks",
      videoUrl: data[0]["link"],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_connectionStatus == 'ConnectivityResult.wifi' || _connectionStatus == 'Unknown' || _connectionStatus == 'ConnectivityResult.mobile') {
      return new Scaffold(
          body: new ListView.builder(
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                          leading: const Icon(Icons.tv),
                          title: new Text(data[index]["title"])
                      ),
                      new Container(
                        width: 370.0,
                        height: 200.0,
                        child: Stack(
                          children: <Widget>[
                            Center(child: NativeLoadingIndicator()),
                            Center(
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: data[index]["body"],
                              ),
                            ),
                          ],
                        ),
                      ),
                      new ButtonTheme
                          .bar( // make buttons use the appropriate styles for cards
                        child: new ButtonBar(
                          children: <Widget>[
                            new FlatButton(
                              child: const Text('Watch'),
                              onPressed: playYoutubeVideo,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
          )
      );
    };
    if (_connectionStatus == 'ConnectivityResult.none') {
      return new ListView(
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
                      title: new Text('No Internet'),
                      subtitle: new Text(
                        'Connect to the internet to watch Redwood TV',
                        style: new TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 12.0),
                      ),
                    ),
                    new Image.asset(
                        'ni.jpg',
                      height: 276.0,
                      width: 197.0,

                    ),
                    new Text('\n')
                  ],
                ),
              ),
            ],
          )
        ],
      );
    }
  }
}