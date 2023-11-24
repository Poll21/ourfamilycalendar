// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "logScrenn": MessageLookupByLibrary.simpleMessage(
            "Страница авторизации регистрации"),
        "log_Authorization":
            MessageLookupByLibrary.simpleMessage("Авторизация"),
        "log_Email": MessageLookupByLibrary.simpleMessage("Email"),
        "log_Login": MessageLookupByLibrary.simpleMessage("Login"),
        "log_Password1": MessageLookupByLibrary.simpleMessage("Password"),
        "log_Password2":
            MessageLookupByLibrary.simpleMessage("Confirm password"),
        "log_Phone": MessageLookupByLibrary.simpleMessage("Phone number"),
        "log_Registration":
            MessageLookupByLibrary.simpleMessage("Registration"),
        "log_email_incorrect": MessageLookupByLibrary.simpleMessage(
            "Incorrect email entered. Please check the entered data!"),
        "log_email_or_phone": MessageLookupByLibrary.simpleMessage(
            "Authorize by phone number or Email:"),
        "log_empty": MessageLookupByLibrary.simpleMessage(
            "Это поле обязательно для заполнения."),
        "log_password_incorrect": MessageLookupByLibrary.simpleMessage(
            "The password must contain a number, lowercase and uppercase Latin letters"),
        "log_password_incorrect_one":
            MessageLookupByLibrary.simpleMessage("Password does not match!"),
        "log_reg_title":
            MessageLookupByLibrary.simpleMessage("Welcome to our family!!!"),
        "log_title": MessageLookupByLibrary.simpleMessage("My Family Calendar"),
        "prof_name": MessageLookupByLibrary.simpleMessage("Username"),
        "prof_sav": MessageLookupByLibrary.simpleMessage("Save changes"),
        "profileScreen": MessageLookupByLibrary.simpleMessage(
            "Страница авторизации регистрации"),
        "reg_email_or_phone": MessageLookupByLibrary.simpleMessage(
            "Register using your phone number or Email:")
      };
}
