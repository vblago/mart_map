import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

final _keepAnalysisHappy = Intl.defaultLocale;

typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);

  static _notInlinedMessages(_) => <String, Function>{
        "app_name": MessageLookupByLibrary.simpleMessage("Find travelers"),
        "tab_find": MessageLookupByLibrary.simpleMessage("Find"),
        "tab_chat": MessageLookupByLibrary.simpleMessage("Chat"),
        "tab_profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "tab_settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "tab_kin": MessageLookupByLibrary.simpleMessage("Kin"),
        "exit_dialog_title":
            MessageLookupByLibrary.simpleMessage("Are you sure?"),
        "exit_dialog_message":
            MessageLookupByLibrary.simpleMessage("Do you want to exit an App"),
        "exit_dialog_btn_yes": MessageLookupByLibrary.simpleMessage("Yes"),
        "exit_dialog_btn_no": MessageLookupByLibrary.simpleMessage("No"),
        "error_snack": MessageLookupByLibrary.simpleMessage("Some errors"),
        "sign_in_with_facebook":
            MessageLookupByLibrary.simpleMessage("Sign in with Facebook"),
        "find_screen_has_no_data":
            MessageLookupByLibrary.simpleMessage("Has no dat"),
        "find_screen_format_distance":
            MessageLookupByLibrary.simpleMessage("miles away")
      };
}
