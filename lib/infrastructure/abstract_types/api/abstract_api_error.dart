import 'package:bot_toast/bot_toast.dart';

abstract class AbstractApiError extends Error {
  final int code;
  final String message;
  final String type;
  Map<String, dynamic> data = {};
  String explanation = "";
  AbstractApiError(this.code, this.message, this.type,
      {this.explanation, this.data})
      : super();

  bool isErrorOfType(String errorType) {
    return this.type == errorType;
  }
  @override
  String toString() {
    return this.message;
   }

  void toToast(context) {
    BotToast.showSimpleNotification(
        duration: Duration(minutes: 1),
        title: message);
  }
}
