
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_request.dart';
import 'package:myflutter/model/token.dart';
abstract class AbstractAuthenticatedRequest extends AbstractApiRequest {
  final Token token;

  AbstractAuthenticatedRequest(this.token);

  @override
  Map<String, String> getAdditionnalHeaders() {
    return {"Authorization": "Bearer ${this.token.accessToken}"};
  }
}
