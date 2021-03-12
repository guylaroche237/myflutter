import 'package:bot_toast/bot_toast.dart';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_error.dart';
import 'package:myflutter/infrastructure/abstract_types/api/api_error_types.dart';

class ValidationError extends AbstractApiError {
  final String message;
  final List<dynamic> errors;
  ValidationError(this.message, this.errors)
      : super(4, message, ApiErrorType.validationError);

  String errorsToString() {
    if (errors == null) {
      return "";
    }
    String result = '';
    errors.forEach((item) {
      if (errors.first == item) {
        result += "-${item['field']}: ${item["defaultMessage"]}";
      }
      result += "\n-${item['field']}: ${item["defaultMessage"]}";
    });
    if (result == '') {
      return message;
    }
    return result;
  }

  @override
  void toToast(context) {
    BotToast.showSimpleNotification(
        title: errorsToString());
  }
}
