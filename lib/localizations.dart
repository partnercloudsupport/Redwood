import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
    locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  //Bottom Nav bar buttons

  String get bottomNavbarbellsbutton {
    return Intl.message('Bells',
        name: 'bottomNavbarbellsbutton', desc: 'The button of Bells tab on the Bottom Nav bar buttons');
  }

  String get bottomNavbarTodaybutton {
    return Intl.message('Today',
        name: 'bottomNavbarTodaybutton', desc: 'The button of Today tab on the Bottom Nav bar buttons');
  }

  String get bottomNavbarTVbutton {
    return Intl.message('TV',
        name: 'bottomNavbarTVbutton', desc: 'The button of TV tab on the Bottom Nav bar buttons');
  }

  //Bells Page

  String get bellsTitle1 {
    return Intl.message('Normal School Week',
        name: 'bellsTitle1', desc: 'The title of the first card on the Bells Page');
  }

  String get bellsTitle2 {
    return Intl.message('Special Days',
        name: 'bellsTitle2', desc: 'The title of the second card on the Bells Page');
  }


  String get bellsMondayButton {
    return Intl.message('Monday',
        name: 'bellsMondayButton', desc: 'The button of Monday on the Bells Page');
  }

  String get bellsTuesdayButton {
    return Intl.message('Tuesday',
        name: 'bellsTuesdayButton', desc: 'The button of Tuesday on the Bells Page');
  }

  String get bellsWednesdayButton {
    return Intl.message('Wednesday',
        name: 'bellsWednesdayButton', desc: 'The button of Wednesday on the Bells Page');
  }

  String get bellsThursdayButton {
    return Intl.message('Thursday',
        name: 'bellsThursdayButton', desc: 'The button of Thursday on the Bells Page');
  }
  String get bellsFridayButton {
    return Intl.message('Friday',
        name: 'bellsFridayButton', desc: 'The button of Friday on the Bells Page');
  }

  String get bellsFirstWeekofSchoolButton {
    return Intl.message('First Week of School',
        name: 'bellsFirstWeekofSchoolButton', desc: 'The button of FirstWeekofSchool on the Bells Page');
  }

  String get bellsRALLYThursdayButton {
    return Intl.message('RALLY Thursday',
        name: 'bellsRALLYThursdayButton', desc: 'The button of RALLYThursday on the Bells Page');
  }

  String get bellsASSEMBLYThursdayButton {
    return Intl.message('ASSEMBLY Thursday',
        name: 'bellsASSEMBLYThursdayButton', desc: 'The button of ASSEMBLYThursday on the Bells Page');
  }

  String get bellsMinimumDayButton {
    return Intl.message('Minimum Day (Wednesday or Friday) *',
        name: 'bellsMinimumDayButton', desc: 'The button of MinimumDay on the Bells Page');
  }

  String get bellsfollowingorbeforeMinimumDayButton {
    return Intl.message('Thursday following a Minimum Wed. or before a Minimum Friday *',
        name: 'bellsfollowingorbeforeMinimumDayButton', desc: 'The button of following or before MinimumDay on the Bells Page');
  }

  String get bellsbottomCard1 {
    return Intl.message('For weeks with three or fewer student days, there will be no block periods (only 7-period days).',
        name: 'bellsbottomCard1', desc: 'The first part of the card on the bottom of the Bells Page');
  }

  String get bellsbottomCard2 {
    return Intl.message('* Week with a Minimum Wednesday or Minimum Friday day has an altered Wednesday and Thursday or Friday and Thursday schedule as listed.',
        name: 'bellsbottomCard2', desc: 'The second part of the card on the bottom of the Bells Page');
  }

  //Today Tab

  String get todayHello {
    return Intl.message('Hello',
        name: 'todayHello', desc: 'The Hello part right before their name.');
  }

  String get todayAnnouncements {
    return Intl.message('Announcements',
        name: 'todayAnnouncements', desc: 'The card name for the Announcements card right befor the emoji');
  }

  String get todayInfo {
    return Intl.message('Info about your day.',
        name: 'todayInfo', desc: 'The card name for the Announcements card right befor the emoji');
  }

  String get todayLunchCard1 {
    return Intl.message('Lunch will be at',
        name: 'todayLunchCard1', desc: 'The first part of the lunch card');
  }

  String get todayLunchCard2 {
    return Intl.message('and will end at',
        name: 'todayLunchCard2', desc: 'The second part of the lunch card');
  }

  String get todaySchoolCard1 {
    return Intl.message('School will start for you at',
        name: 'todaySchoolCard1', desc: 'The first part of the school card');
  }

  String get todaySchoolCard2 {
    return Intl.message('and will end at',
        name: 'todaySchoolCard2', desc: 'The second part of the school card');
  }

  String get todayClassCard1 {
    return Intl.message('It is currently',
        name: 'todayClassCard1', desc: 'The first part of the Class card');
  }

  String get todayClassCard2 {
    return Intl.message('and it started at',
        name: 'todayClassCard2', desc: 'The second part of the class card');
  }

  String get todayClassCard3 {
    return Intl.message('and it will end at',
        name: 'todayClassCard3', desc: 'The third part of the class card');
  }

  //TV page
  String get tvWatch {
    return Intl.message('Watch',
        name: 'tvWatch', desc: 'The Watch button on the TV Tab');
  }

  String get tvViews {
    return Intl.message('views',
        name: 'tvViews', desc: 'The views counter on the TV Tab');
  }

  //Drawer
  String get drawerFacultydirectory {
    return Intl.message('Faculty Director',
        name: 'drawerFacultydirectory', desc: 'The Faculty Director button and title of the Faculty Director Page');
  }

  String get drawerSchoolMap {
    return Intl.message('School Map',
        name: 'drawerSchoolMap', desc: 'The School Map button and title of the School Map Page');
  }

  String get drawerSettings {
    return Intl.message('Settings',
        name: 'drawerSettings', desc: 'The Settings button and title of the Settings Page');
  }

  String get drawerTools {
    return Intl.message('Tools',
        name: 'drawerTools', desc: 'The Tools button and title of the Tools Page');
  }

  String get drawerAbout {
    return Intl.message('About',
        name: 'drawerAbout', desc: 'The About button and title of the About Page');
  }

  //Settings

  String get settingsSaveButton {
    return Intl.message('Save',
        name: 'settingsSaveButton', desc: 'The save button on any settings page');
  }

  String get feedbackCardTitle {
    return Intl.message('Feedback',
        name: 'feedbackCardTitle', desc: 'The title of the Feedback card on any of the apps pages');
  }

  String get feedbackCardSubTitle {
    return Intl.message('Feedback helps us better develop the app.',
        name: 'feedbackCardSubTitle', desc: 'The title of the Feedback card on any of the apps pages');
  }

  String get feedbackCardButton {
    return Intl.message('Send Feedback',
        name: 'feedbackCardButton', desc: 'The button of the Feedback card on any of the apps pages');
  }

  String get settingsProfileTitle {
    return Intl.message('Your Profile',
        name: 'settingsProfileTitle', desc: 'The title of the profile card of the Settings Page');
  }

  String get settingsProfileSubTitle {
    return Intl.message('This is where you edit your name.',
        name: 'settingsProfileSubTitle', desc: 'The sub title of the profile card of the Settings Page');
  }

  String get settingsProfileTextBox {
    return Intl.message('This is where you edit your name.',
        name: 'settingsProfileTextBox', desc: 'This is whats in the textbox where you edit your name of the profile card of the Settings Page');
  }

  String get settingsClassesTitle {
    return Intl.message('Your Classes',
        name: 'settingsClassesTitle', desc: 'The title of the classes card of the Settings Page');
  }

  String get settingsClassesSubTitle {
    return Intl.message('This is where you edit your classes.',
        name: 'settingsClassesSubTitle', desc: 'The sub title of the classes card of the Settings Page');
  }

  //Tools

  String get toolsPoweredby {
    return Intl.message('Tools powered by',
        name: 'toolsPoweredby', desc: 'Powered by text on cards on the Tools page');
  }

  String get toolsMore {
    return Intl.message('More coming soon!',
        name: 'toolsMore', desc: 'More coming soon! text on cards on the Tools page');
  }

  String get toolsFDSubTitle {
    return Intl.message('View Info about your Teachers',
        name: 'toolsFDSubTitle', desc: 'The sub title of the Faculty Directory button on the Tools page');
  }

  String get toolsRHSCSubTitle {
    return Intl.message('Chat with the classmates or the school',
        name: 'toolsRHSCSubTitle', desc: 'The sub title of the RHS Chat button on the Tools page');
  }

  String get toolsCCSubTitle {
    return Intl.message('View who you share your classes with',
        name: 'toolsCCSubTitle', desc: 'The sub title of the Common Class button on the Tools page');
  }

  //Faculty Directory

  String get fdTapformore {
    return Intl.message('Tap for more',
        name: 'fdTapformore', desc: 'The tap for more text on the card of the teachers on the Faculty Directory page');
  }

  //About

  String get aboutACb {
    return Intl.message('App Created by:',
        name: 'aboutACb', desc: 'The App Created by text on the About page');
  }

  String get abouticb {
    return Intl.message('App Icon Created by:',
        name: 'abouticb', desc: 'The App Icon Created by text on the About page');
  }

  String get aboutstb {
    return Intl.message('Spanish translations by:',
        name: 'aboutstb', desc: 'The Spanish translations by text on the About page');
  }

  String get aboutASBio1 {
    return Intl.message('Alison Schwartz is a senior at Redwood High School,',
        name: 'aboutASBio1', desc: 'The the first part of Alison Schwartz bio on the About page');
  }

  String get aboutASBio2 {
    return Intl.message('and professional stressed person™',
        name: 'aboutASBio2', desc: 'The the second part of Alison Schwartz bio on the About page');
  }

  String get aboutSF {
    return Intl.message('Support from',
        name: 'aboutSF', desc: 'The the Support from text on the About page');
  }

  String get aboutAB1 {
    return Intl.message('The Redwood High School app is not an official',
        name: 'aboutAB1', desc: 'The first line about the app text on the About page');
  }

  String get aboutAB2 {
    return Intl.message('school app but was created and is maintained by',
        name: 'aboutAB2', desc: 'The second line about the app text on the About page');
  }

  String get aboutAB3 {
    return Intl.message('Redwood students. The app is also open source!',
        name: 'aboutAB3', desc: 'The third line about the app text on the About page');
  }

  String get aboutAB4 {
    return Intl.message('If you are interested in seeing the code of the',
        name: 'aboutAB4', desc: 'The forth line about the app text on the About page');
  }

  String get aboutAB5 {
    return Intl.message('app or helping with the project you can do so here:',
        name: 'aboutAB5', desc: 'The Fifth line about the app text on the About page');
  }

  String get aboutOGPButton {
    return Intl.message('Open Github Project',
        name: 'aboutOGPButton', desc: 'The Open Github Project button on the About page');
  }

  String get aboutOSCButton {
    return Intl.message('Open Source Licenses',
        name: 'aboutOSCButton', desc: 'The Open Source Licenses button on the About page');
  }

  //Discord
  String get discordJoinButton {
    return Intl.message('Join!',
        name: 'discordJoinButton', desc: 'the join button text on cards on the Discord page');
  }

  String get discordJointhe {
    return Intl.message('Join the',
        name: 'discordJointhe', desc: 'the "Join the" text in front of the name of the discord on cards on the Discord page');
  }

  String get discordisonticSubTitle {
    return Intl.message('Talk to the team or get support!',
        name: 'discordisonticSubTitle', desc: 'the sub title of the isontic card on the Discord page');
  }

  String get discordTeamRHSSubTitle {
    return Intl.message('Talk to other students at Redwood!',
        name: 'discordTeamRHSSubTitle', desc: 'the sub title of the isontic card on the Discord page');
  }


}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
