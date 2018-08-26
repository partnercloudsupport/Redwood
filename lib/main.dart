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
import './screens/opl.dart' as _oplPage;
import './screens/discord.dart' as discordPage;
import './screens/tools.dart' as toolsPage;
import './screens/donate.dart' as donatePage;
import './screens/directory.dart' as directoryPage;
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
import 'package:meta/meta.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:native_ui/native_ui.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_villains/villain.dart';

void main() => runApp(new MaterialApp(
  title: 'Redwood',
  theme: new ThemeData(
      primarySwatch: Colors.red,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.red,
      backgroundColor: Colors.white),
  home: new Tabs(),
  navigatorObservers: [new VillainTransitionObserver()],
  debugShowCheckedModeBanner: false,
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
      case '/changelog':
        return new FromRightToLeft(
          builder: (_) => new _changelogPage.changelog(),
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
      case '/donate':
        return new FromRightToLeft(
          builder: (_) => new donatePage.Donate(),
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
    }
  },

  localizationsDelegates: [
    // ... app-specific localization delegate[s] here
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
  supportedLocales: [
    const Locale('en', 'US'), // English
    // ... other locales the app supports
  ],
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

  String textValue = 'Hello World !';
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();

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
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Future<Null> _GMComingSoon() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Coming Soon!'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text(
                    'This is something we are looking on adding this to the app sometime soon.'),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //final GoogleSignIn _googleSignIn = GoogleSignIn();
  //final FirebaseAuth _auth = FirebaseAuth.instance;

  //Future<FirebaseUser> _handleSignIn() async {
  //GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  //GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //FirebaseUser user = await _auth.signInWithGoogle(
  //     accessToken: googleAuth.accessToken,
//      idToken: googleAuth.idToken,
//    );
//    print("signed in " + user.displayName);
//    return user;
//  }

  @override
  Widget build(BuildContext context) => new Scaffold(
    //App Bar
    appBar: new AppBar(
      title: new Text(_title_app),
//          actions: <Widget>[
//            IconButton(
//              icon: const Icon(Icons.person),
//              tooltip: 'Login',
//              onPressed: _handleSignIn,
//            ),
//          ],
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
    bottomNavigationBar: new BottomNavigationBar(
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
                  child: new GestureDetector(
                      onLongPress: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed('/dev');
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
            new ListTile(
                leading: new Icon(Icons.map),
                title: new Text('School Map'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/map');
                }),
            new ListTile(
                leading: new Icon(FontAwesomeIcons.chalkboardTeacher),
                title: new Text('Faculty Directory'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/directory');
                }),
            new ListTile(
                leading: new Icon(FontAwesomeIcons.toolbox),
                title: new Text('Tools'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/tools');
                }),
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
                leading: new Icon(Icons.settings),
                title: new Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/settings');
                }),
            new ListTile(
                leading: new Icon(Icons.info),
                title: new Text('About'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/about');
                }),
//            new ListTile(
//                leading: new Icon(FontAwesomeIcons.donate),
//                title: new Text('Donate'),
//                onTap: () {
//                  Navigator.pop(context);
//                  Navigator.of(context).pushNamed('/donate');
//                }),
            new ListTile(
                leading: new Icon(Icons.cached),
                title: new Text('Change Log'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/changelog');
                }),
            new ListTile(
                leading: new Icon(FontAwesomeIcons.discord),
                title: new Text('Team RHS Discord'),
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

RHSURL() {
  launch('http://redwood.org');
}

ESCHOOLURL() {
  launch('https://home.tamdistrict.org/HomeAccess/Classes/Classwork');
}

FBURL() {
  launch(
      'https://docs.google.com/forms/d/e/1FAIpQLScG_fu-2lpfdikypltPVxxVmpBJtpvcRYrD-n1V2frlQtS9IQ/viewform?usp=sf_link');
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
  bool video = false;
  List data;

  //final RemoteConfig remoteConfig;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull(
            "https://raw.githubusercontent.com/isontic/data/master/tv.json"),
        headers: {"Accept": "application/json"});

    video = true;

    this.setState(() {
      data = json.decode(response.body);
      video;
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

  VidURL() {
    launch(data[0]["link"]);
  }



  @override
  Widget build(BuildContext context) {
    if (video == true){
      if (_connectionStatus == 'ConnectivityResult.wifi' ||
          _connectionStatus == 'Unknown' ||
          _connectionStatus == 'ConnectivityResult.mobile') {
        return new Scaffold(
            body: new ListView.builder(
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    elevation: 3.0,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                            leading: const Icon(Icons.tv),
                            title: new Text(data[index]["title"])),
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
                        new ButtonTheme.bar(
                          // make buttons use the appropriate styles for cards
                          child: new ButtonBar(
                            children: <Widget>[
                              new PlatformSwitcher(
                                iOSChild: new FlatButton(
                                  child: const Text('Watch'),
                                  onPressed: playYoutubeVideo,
                                ),
                                androidChild: new FlatButton(
                                  child: const Text('Watch'),
                                  onPressed: playYoutubeVideo,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }));
      };
    };

    if (video == false){
      if (_connectionStatus == 'ConnectivityResult.wifi' ||
          _connectionStatus == 'Unknown' ||
          _connectionStatus == 'ConnectivityResult.mobile' && video == false) {
        return new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new CircularProgressIndicator(),
          ],
        );
      };
    };

    if (_connectionStatus == 'ConnectivityResult.none') {
      return new ListView(
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('\n\n'),
              new Card(
                elevation: 3.0,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ListTile(
                      title: new Text('No Network Connection'),
                      subtitle: new Text(
                        'You\'re not connected to the Internet. Check your connection and try again.',
                        style: new TextStyle(
                            color: Colors.grey.withOpacity(0.9),
                            fontSize: 12.0),
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