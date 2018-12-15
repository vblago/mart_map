import 'dart:async';

import 'package:mart_map/presentation/utils/l10n/messages_all.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeLocalization(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get appName {
    return Intl.message('Find travelers', name: 'app_name');
  }

  String get tabFind {
    return Intl.message('Find', name: 'tab_find');
  }

  String get tabChat {
    return Intl.message('Chat', name: 'tab_chat');
  }

  String get tabProfile {
    return Intl.message('Profile', name: 'tab_profile');
  }

  String get tabSettings {
    return Intl.message('Settings', name: 'tab_settings');
  }

  String get tabKin {
    return Intl.message('Kin', name: 'tab_kin');
  }

  String get exitDialogTitle {
    return Intl.message('Are you sure?', name: 'exit_dialog_title');
  }

  String get exitDialogMessage {
    return Intl.message('Do you want to exit an App',
        name: 'exit_dialog_message');
  }

  String get exitDialogBtnYes {
    return Intl.message('Yes', name: 'exit_dialog_btn_yes');
  }

  String get exitDialogBtnNo {
    return Intl.message('No', name: 'exit_dialog_btn_no');
  }

  String get errorSnack {
    return Intl.message('Some errors', name: 'error_snack');
  }

  String get facebookSignin {
    return Intl.message('Sign in with Facebook', name: 'sign_in_with_facebook');
  }

  String get findScreenHasNoData {
    return Intl.message('Has no data', name: 'find_screen_has_no_data');
  }

  String get findScreenDistanceFormat {
    return Intl.message('miles away', name: 'find_screen_format_distance');
  }

  String get findScreenTabWomen {
    return Intl.message('Women', name: 'find_screen_tab_women');
  }

  String get findScreenTabMen {
    return Intl.message('Men', name: 'find_screen_tab_men');
  }

  String get findScreenTabAll {
    return Intl.message('All', name: 'find_screen_tab_all');
  }

  String get appBarHintText {
    return Intl.message('Please enter a search term',
        name: 'app_bar_hint_textl');
  }

  String get dialogNoInternet {
    return Intl.message('No internet connection',
        name: 'dialog_no_internet_mess');
  }

  String get dialogProfileTitle {
    return Intl.message('Choose source:', name: 'dialog_profile_title');
  }

  String get photoBtnTooltip {
    return Intl.message('Take a Photo', name: 'photo_btn_tooltip');
  }

  String get galleryBtnTooltip {
    return Intl.message('Pick Image from gallery', name: 'gallery_btn_tooltip');
  }

  String get changePhotoBtn {
    return Intl.message('Use your Facebook profile picture',
        name: 'change_photo_btn');
  }

  String get dialogTitle {
    return Intl.message('Something went wrong', name: 'dialog_title');
  }

  String get kinBalance {
    return Intl.message('Balance: ', name: 'kin_balance');
  }

  String get kinDevProgramText {
    return Intl.message('Kin \nDeveloper \nprogram',
        name: 'kin_dev_program_text');
  }

  String get supportUsText {
    return Intl.message('Support us', name: 'support_us');
  }

  String get settingsTitle {
    return Intl.message('Settings', name: 'settings_title');
  }

  String get subjectTextAndroid {
    return Intl.message('Android App Feedback', name: 'subject_text_android');
  }

  String get subjectTextIOS {
    return Intl.message('IOS App Feedback', name: 'subject_text_ios');
  }

  String get mailTo {
    return Intl.message('Tom@FindAndroidApp.com', name: 'mail_to');
  }

  String get shareText {
    return Intl.message(
        'Hey! Checkout Find on Google Play: http://play.google.com/store/apps/details?id=il.co.moveo.find or at the App Store: https://itunes.apple.com/us/app/find-find-travelers/id1133090905?ls=1&mt=8',
        name: 'share_text');
  }

  String get settingsFeedback {
    return Intl.message('Feedback', name: 'settings_feedback');
  }

  String get settingsProfile {
    return Intl.message('Profile', name: 'settings_profile');
  }

  String get settingsShare {
    return Intl.message('Share', name: 'settings_share');
  }

  String get settingsNotification {
    return Intl.message('Notifications', name: 'settings_notification');
  }

  String get settingsLogOut {
    return Intl.message('Log out', name: 'settings_log_out');
  }

  String get blockUser {
    return Intl.message('Block', name: 'block_user');
  }

  String get searchInChat {
    return Intl.message('Find users', name: 'search_in_chat');
  }

  String get age {
    return Intl.message('Age', name: 'age');
  }

  String get noLimit {
    return Intl.message('No Limit', name: 'no_limit');
  }

  String get usersDistance {
    return Intl.message('Users within X miles', name: 'users_distance');
  }

  String get descriptionHint {
    return Intl.message('Write a description about yourself…',
        name: 'description_hint');
  }

  String get enterLocation {
    return Intl.message('Enter a location...', name: 'enter_location');
  }

  String get currentLocation {
    return Intl.message('Current location', name: 'current_location');
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en'].contains(locale.languageCode);
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
