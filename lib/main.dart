import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './tabs/home.dart' as _firstTab;
import './tabs/today.dart' as _secondTab;
import './screens/about.dart' as _aboutPage;
import './screens/support.dart' as _supportPage;
import './screens/Map.dart' as _mapPage;
import './screens/settings.dart' as _settingsPage;
import './screens/dev.dart' as _devPage;
import './screens/opl.dart' as _oplPage;
import './screens/discord.dart' as discordPage;
import './screens/tools.dart' as toolsPage;
import './screens/directory.dart' as directoryPage;
import './todo/todo.dart' as todoPage;
import 'package:url_launcher/url_launcher.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';
import 'package:native_ui/native_ui.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_villains/villain.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:share/share.dart';

//import 'package:vibrate/vibrate.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'localizations.dart';

void main() => runApp(new MaterialApp(
      //-- This is the name of the app
      title: 'Redwood',
      //-- This sets the colors for the app
      theme: new ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.red,
          backgroundColor: Colors.white),
      home: new Tabs(),
      navigatorObservers: [new VillainTransitionObserver()],
      //-- Calls the Villains on the page to be played
      debugShowCheckedModeBanner: false,
      //- Disables the debug banner
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/about':
            return new FromRightToLeft(
              builder: (_) => new _aboutPage.About(),
              settings: settings,
            );
          case '/support':
            return new FromRightToLeft(
              builder: (_) => new _supportPage.Support(),
              settings: settings,
            );
          case '/map':
            return new FromRightToLeft(
              builder: (_) => new _mapPage.Map(),
              settings: settings,
            );
          case '/settings':
            return new FromRightToLeft(
              builder: (_) => new _settingsPage.Settings(),
              settings: settings,
            );
          case '/discord':
            return new FromRightToLeft(
              builder: (_) => new discordPage.discord(),
              settings: settings,
            );
          case '/dev':
            return new FromRightToLeft(
              builder: (_) => new _devPage.Dev(),
              settings: settings,
            );
          case '/opl':
            return new FromRightToLeft(
              builder: (_) => new _oplPage.OPL(),
              settings: settings,
            );
          case '/directory':
            return new FromRightToLeft(
              builder: (_) => new directoryPage.Directory(),
              settings: settings,
            );
          case '/tools':
            return new FromRightToLeft(
              builder: (_) => new toolsPage.Tools(),
              settings: settings,
            );
          case '/todo':
            return new FromRightToLeft(
              builder: (_) => new todoPage.Todo(),
              settings: settings,
            );
        }
      },

      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale("en", ""), Locale("es", "")],
      // routes: <String, WidgetBuilder> {
      //   '/about': (BuildContext context) => new _aboutPage.About(),
      // }
    ));

class FromRightToLeft<T> extends MaterialPageRoute<T> {
  FromRightToLeft({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;

    return new SlideTransition(
      child: new Container(
        decoration: new BoxDecoration(boxShadow: [
          new BoxShadow(
            color: Colors.black26,
            blurRadius: 25.0,
          )
        ]),
        child: child,
      ),
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(new CurvedAnimation(
        parent: animation,
        curve: Curves.fastOutSlowIn,
      )),
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 400);
}

class Tabs extends StatefulWidget {
  @override
  TabsState createState() => new TabsState();
}

class TabsState extends State<Tabs> with TickerProviderStateMixin {
  static const int _kAnimationDuration = 250;
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

  bool lunchnotification = false;

  String textValue = 'Hello World !';
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  update(String token) {
    print(token);
    DatabaseReference databaseReference = new FirebaseDatabase().reference();
    databaseReference.child('fcm-token/${token}').set({"token": token});
    textValue = token;
    setState(() {});
  }

  PageController _tabController;

  var _title_app = null;
  int _tab = 0;

  @override
  void initState() {
    super.initState();
    init();

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
        _tabController.jumpToPage(1);
      }
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
          type: 'bells', localizedTitle: 'Bells', icon: 'notifications'),
      //const ShortcutItem(type: 'tv', localizedTitle: 'Redwood Tv', icon: 'tv'),
    ]);

    //THis is a work in progress
//    Future onSelectNotification(String payload) async {
//      if (payload != null) {
//        debugPrint('notification payload: ' + payload);
//      }
////      await Navigator.push(
////        context,
////        //new MaterialPageRoute(builder: (context) => new SecondScreen(payload)),
////      );
//    }
//
//    var initializationSettingsAndroid =
//    new AndroidInitializationSettings('app_icon');
//    var initializationSettingsIOS = new IOSInitializationSettings();
//    var initializationSettings = new InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
//    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
//    flutterLocalNotificationsPlugin.initialize(initializationSettings,
//        selectNotification: onSelectNotification);
//    notif();
  }

  //THis is a work in progress
  void notif() async {
    prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('lunchnotification') == null) {
      prefs.setBool('lunchnotification', lunchnotification);
    }

    setState(() {
      lunchnotification;
    });
  }

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
    super.dispose();
    _tabController.dispose();
  }

  static const String iconFont = 'CupertinoIcons';
  static const String iconFontPackage = 'cupertino_icons';

  @override
  Widget build(BuildContext context) => new Scaffold(
        //App Bar
        appBar: new AppBar(
          title: new Text(_title_app),
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
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
        bottomNavigationBar: new PlatformWidget(
          ios: (_) => CupertinoTabBar(
                currentIndex: _tab,
                onTap: onTap,
                activeColor: Colors.redAccent,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(IconData(0xF39B,
                        fontFamily: iconFont, fontPackage: iconFontPackage)),
                    title: Text('Bells'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(IconData(0xF3E6,
                        fontFamily: iconFont, fontPackage: iconFontPackage)),
                    title: Text('Today'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(IconData(0xF466,
                        fontFamily: iconFont, fontPackage: iconFontPackage)),
                    title: Text('TV'),
                  ),
                ],
              ),
          android: (_) => new BottomNavigationBar(
                currentIndex: _tab,
                onTap: onTap,
                items: TabItems.map((TabItem) {
                  return new BottomNavigationBarItem(
                    title: new Text(TabItem.title),
                    icon: new Icon(TabItem.icon),
                  );
                }).toList(),
              ),
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
                  child: new GestureDetector(
                      onLongPress: () {
//                        Navigator.pop(context);
//                        Navigator.of(context).pushNamed('/dev');
                      },
                      child: new Image.asset('logo.gif')),
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
//            new ListTile(
//                leading: new Icon(FontAwesomeIcons.tasks),
//                title: new Text('Planner'),
//                onTap: () {
//                  Navigator.pop(context);
//                  Navigator.of(context).pushNamed('/todo');
//                }),
            new ListTile(
                leading: new Icon(FontAwesomeIcons.chalkboardTeacher),
                title: new Text('Faculty Directory'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/directory');
                }),
            new ListTile(
                leading: new Icon(Icons.map),
                title: new Text('School Map'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/map');
                }),
//            new ListTile(
//                leading: new Icon(Icons.book),
//                title: new Text('Resources'),
//                onTap: () {
//                  Navigator.pop(context);
//                  Navigator.of(context).pushNamed('/map');
//                }),

//            new ListTile(
//              leading: new Icon(FontAwesomeIcons.gamepad),
//              title: new Text('Student Written Games'),
//              onTap: () {
//                Navigator.pop(context);
//                Navigator.of(context).pushNamed('/games');
//              },
//            ),
            new Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            new ListTile(
              leading: new Icon(FontAwesomeIcons.userCog),
              title: new Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/settings');
              },
            ),
            new ListTile(
                leading: new Icon(FontAwesomeIcons.toolbox),
                title: new Text('Tools'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/tools');
                }),
            new ListTile(
                leading: new Icon(Icons.info),
                title: new Text('About'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/about');
                }),
            new ListTile(
                leading: new Icon(FontAwesomeIcons.discord),
                title: new Text('Discord'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/discord');
                }),
          ],
        )),
      );

  void onTap(int tab) {
    _tabController.jumpToPage(tab);
  }

  void onTabChanged(int tab) {
    setState(() {
      this._tab = tab;
    });
    //-- Updates the AppBar name for what tab your in
    switch (tab) {
      case 0:
        this._title_app = "Redwood - " + TabItems[0].title + " 🔔";
        break;

      case 1:
        this._title_app = "Redwood - " + TabItems[1].title + " ⚡";
        //this._title_app = "Redwood - " + TabItems[1].title + " 📺";
        break;

      case 2:
        this._title_app = "Redwood - " + TabItems[2].title + " 📺";
        break;
    }
  }
}

class TabItem {
  const TabItem({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<TabItem> TabItems = const <TabItem>[
  const TabItem(title: 'Bells', icon: Icons.notifications),
  const TabItem(title: 'Today', icon: FontAwesomeIcons.bolt),
  const TabItem(title: 'TV', icon: Icons.tv)
];

//-- Drawer Links
RHSURL() {
  launch('http://redwood.org');
}

isonticDURL() {
  launch('https://discord.gg/X7QJ8A7');
}

ESCHOOLURL() {
  launch('https://home.tamdistrict.org/HomeAccess/Classes/Classwork');
}

FBURL() {
  launch(
      'https://docs.google.com/forms/d/e/1FAIpQLScG_fu-2lpfdikypltPVxxVmpBJtpvcRYrD-n1V2frlQtS9IQ/viewform?usp=sf_link');
}
//--

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

  bool video = false;
  int views = 0;
  String Title = 'Redwood TV Season 8 Episode 1';
  String IMGURL =
      'https://raw.githubusercontent.com/isontic/data/master/Screenshot_49.png';
  String VURL = 'https://www.youtube.com/watch?v=VeqBXW1ViN8&t=483s';

  StreamSubscription<DocumentSnapshot> subscription;

  final DocumentReference documentReference =
      Firestore.instance.document("tv/Qs1EPP7eP5TijgOVpgGi");

  void _fetch() {
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        video = true;
        setState(() {
          Title = datasnapshot.data['title'];
          IMGURL = datasnapshot.data['img-url'];
          VURL = datasnapshot.data['vid-url'];
          views = datasnapshot.data['views'];
          video;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    this._fetch();

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

//    if (_connectionStatus == 'ConnectivityResult.none'){
//      bool canVibrate = await Vibrate.canVibrate;
//      if (canVibrate == true) {
//        Vibrate.feedback(FeedbackType.warning);
//      }
//    }

    setState(() {
      _connectionStatus = connectionStatus;
    });
  }

  void playYoutubeVideo() async {
    FlutterYoutube.playYoutubeVideoByUrl(
      apiKey: "AIzaSyCFTOVFljhMMoamV_X1PktBGGcz2nRt_UM",
      videoUrl: VURL,
    );

//    bool canVibrate = await Vibrate.canVibrate;
//    if (canVibrate == true) {
//      Vibrate.feedback(FeedbackType.light);
//    }

    //Waiting for flutter_youtube to add end call for ios
    views = views + 1;

    Map<String, int> data = <String, int>{
      "views": views,
    };
    documentReference
        .updateData(data)
        .whenComplete(() {})
        .catchError((e) => print(e));
  }

  void share() async {
//    bool canVibrate = await Vibrate.canVibrate;
//    if (canVibrate == true) {
//      Vibrate.feedback(FeedbackType.light);
//    }

    Share.share('Redwood TV ' + '$Title: ' + '$VURL');
  }

  static const String iconFont = 'CupertinoIcons';
  static const String iconFontPackage = 'cupertino_icons';

  @override
  Widget build(BuildContext context) {
    if (video == true) {
      if (_connectionStatus == 'ConnectivityResult.wifi' ||
          _connectionStatus == 'Unknown' ||
          _connectionStatus == 'ConnectivityResult.mobile') {
        return new Scaffold(
          body: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.all(8.0),
                child: new Material(
                  elevation: 5.0,
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: PlatformWidget(
                          ios: (_) => new Icon(
                                IconData(0xF466,
                                    fontFamily: iconFont,
                                    fontPackage: iconFontPackage),
                              ),
                          android: (_) => new Icon(Icons.tv),
                        ),
                        title: new Text(Title),
                        trailing: PlatformWidget(
                          ios: (_) => new IconButton(
                                icon: new Icon(IconData(0xF4CA,
                                    fontFamily: iconFont,
                                    fontPackage: iconFontPackage)),
                                tooltip: 'Share URL',
                                onPressed: share,
                              ),
                          android: (_) => new IconButton(
                                icon: new Icon(Icons.share),
                                tooltip: 'Share URL',
                                onPressed: share,
                              ),
                        ),
                      ),
                      new Container(
                        width: 370.0,
                        height: 200.0,
                        child: Stack(
                          children: <Widget>[
                            Center(child: CircularProgressIndicator()),
                            Center(
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: IMGURL,
                              ),
                            ),
                          ],
                        ),
                      ),
                      new ListTile(
                        title: new Text(
                          '$views views',
                          style: new TextStyle(
                            color: Colors.grey.withOpacity(1.0),
                          ),
                        ),
                        trailing: PlatformWidget(
                          ios: (_) => new FlatButton(
                                child: new Text(
                                  'Watch',
                                  style: new TextStyle(
                                    color: Colors.red.withOpacity(1.0),
                                  ),
                                ),
                                onPressed: playYoutubeVideo,
                              ),
                          android: (_) => new FlatButton(
                                child: new Text(
                                  'Watch',
                                  style: new TextStyle(
                                    color: Colors.red.withOpacity(1.0),
                                  ),
                                ),
                                onPressed: playYoutubeVideo,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
      ;
    }
    ;
    //Loading Screen for Today Page
    if (video == false) {
      if (_connectionStatus == 'ConnectivityResult.wifi' ||
          _connectionStatus == 'Unknown' ||
          _connectionStatus == 'ConnectivityResult.mobile') {
        return new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new CircularProgressIndicator(),
          ],
        );
      }
      ;
    }
    ;

    //-- If there is no Connection is displays this page
    if (_connectionStatus == 'ConnectivityResult.none') {
      return new Scaffold(
          body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new Material(
              elevation: 8.0,
              borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new ListTile(
                    title: new Text('No Network Connection'),
                    subtitle: new Text(
                      'You\'re not connected to the Internet. Check your connection and try again.',
                      style: new TextStyle(
                          color: Colors.grey.withOpacity(0.9), fontSize: 12.0),
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
          ),
        ],
      ));
    }
    ;
  }
}
