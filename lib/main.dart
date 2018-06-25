import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './tabs/home.dart' as _firstTab;
import './tabs/dashboard.dart' as _secondTab;
import './tabs/tv.dart' as _thirdTab;
import './screens/about.dart' as _aboutPage;
import './screens/support.dart' as _supportPage;
import './screens/Map.dart' as _mapPage;
import './screens/changelog.dart' as _changelogPage;
import './screens/settings.dart' as _settingsPage;
import 'package:url_launcher/url_launcher.dart';

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


  PageController _tabController;

  var _title_app = null;
  int _tab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new PageController();
    this._title_app = TabItems[0].title;
  }

  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build (BuildContext context) => new Scaffold(

    //App Bar
    appBar: new AppBar(
      title: new Text(
        _title_app,
        style: new TextStyle(
          fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
        ),
      ),
      elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      actions: <Widget>[
        // action button
        new IconButton(
          icon: new Icon(Icons.refresh),
          onPressed: initState,
        )
      ],
    ),



    //Content of tabs
    body: new PageView(
      controller: _tabController,
      onPageChanged: onTabChanged,
      children: <Widget>[
        new _firstTab.Home(),
        new _secondTab.Feed(),
        new _thirdTab.Tv()
      ],
    ),

    //Tabs
    bottomNavigationBar: Theme.of(context).platform == TargetPlatform.iOS ?
      new CupertinoTabBar(
        activeColor: Colors.blueGrey,
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
            leading: new Icon(Icons.launch),
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
        this._title_app = TabItems[0].title;
      break;

      case 1:
        this._title_app = TabItems[1].title;
      break;

      case 2:
        this._title_app = TabItems[2].title;
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
  const TabItem(title: 'Feed', icon: Icons.menu),
  const TabItem(title: 'Tv', icon: Icons.tv)
];

RHSURL() {
  launch('http://redwood.org');
}

ESCHOOLURL() {
  launch('https://home.tamdistrict.org/HomeAccess/Classes/Classwork');
}

