

import 'email_validator.dart';

class Validator {
  static bool isEmail(String email) {
    return EmailValidator.validate(email.trim());
  }

  static bool isNotEmpty(String value) {
    return value != "" && value != null;
  }

  static bool  isValidYoutubeUrl(String url) {
    return RegExp(
      r"^(http(s)?:\/\/)?((w){3}.)?youtu(be|.be)?(\.com)?\/.+",
      caseSensitive: false,
      multiLine: false,
    ).hasMatch(url);
  }
}
