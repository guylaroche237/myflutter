
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_error.dart';
import 'package:myflutter/infrastructure/abstract_types/api/api_error_types.dart';

class AuthorizationError extends AbstractApiError {
  String message;
  AuthorizationError(this.message)
      : super(3, message, ApiErrorType.authorisationError);
}
