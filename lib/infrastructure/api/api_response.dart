import 'dart:convert';

import 'package:http/http.dart';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_error.dart';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_response.dart';

import 'errors/authorization_error.dart';
import 'errors/generic_error.dart';
import 'errors/parse_error.dart';
import 'errors/validation_error.dart';

class ApiResponse implements AbstractApiResponse {
  final Response response;
  AbstractApiError defaultError;
  ApiResponse(this.response, {this.defaultError});

  @override
  AbstractApiError get error {
    if (this._hasDefaultError()) {
      return this.defaultError;
    }

    try {
      dynamic json;
      if (response.body != "") {
        json = jsonDecode(response.body);
      } else {
        json = {};
      }
      switch (response.statusCode) {
        case 401:
          return AuthorizationError(
              "Unauthorized. please logout to your account, login and try again");
        case 415:
          return GenericError(json["error"]);
        case 404:
          return GenericError("endpoint not found");
        case 400:
          return ValidationError(json["message"], json["errors"]);
        case 500:
          print(response.body);
          return GenericError('Unexpected server error, please try again');
      }
      return null;
    } catch (error) {
      print(error.toString());
      print(error.stackTrace);
      return ParseError(message: error.toString());
    }
  }

  @override
  bool hasError() {
    if (this._hasDefaultError()) {
      print("default error");
      return true;
    }
    if (response.statusCode >= 400) {
      print("status code");
      return true;
    }
    try {
      dynamic json;
      if (response.body != "") {
        json = jsonDecode(response.body);
      } else {
        json = {};
      }
      if (json is Map &&
          json.containsKey("errors") &&
          json.containsKey("error")) {
        print("key errors ou error");
        return true;
      }
    } catch (e) {
      print(e);
      return true;
    }
    return false;
  }

  _hasDefaultError() {
    return this.defaultError != null;
  }

  @override
  Response get httpResponse => response;
  get json => jsonDecode(response.body);
  @override
  get data => jsonDecode(response.body)["object"];
}
