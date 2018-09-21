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

  //TV page


  //Drawer
  String get drawerFacultydirectory {
    return Intl.message('Faculty Director',
        name: 'drawerFacultydirectory', desc: 'The card name for the Announcements card right befor the emoji');
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