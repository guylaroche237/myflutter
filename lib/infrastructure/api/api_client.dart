import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_client.dart';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_request.dart';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_response.dart';


import 'api_response.dart';
import 'errors/generic_error.dart';

class ApiClient implements AbstractApiClient {
  final String host = "207.180.229.120:8443";  //"207.180.229.120:8080";
  //final String host = "192.168.43.159:8443";
  final String prefix = "";
  static ApiClient _instance;

  @override
  Future<AbstractApiResponse> process(AbstractApiRequest request) async {
    final url = _makeUrl(request);
    print(url.toString());
    switch (request.getVerb()) {
      case "POST":
        if (!request.hasFiles()) {
          Map<String, String> headers = <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }..addAll(request.getAdditionnalHeaders());
          Response response = await http.post(url.toString(),
              headers: headers, body: jsonEncode(request.getBody()));

          return ApiResponse(response);
        }
        Map<String, String> headers = <String, String>{
          'Content-Type': 'multipart/form-data',
        }..addAll(request.getAdditionnalHeaders());
        MultipartRequest multipartRequest = MultipartRequest("POST", url);
        multipartRequest.headers.addAll(headers);
        print(multipartRequest.headers);
        multipartRequest.files.addAll(request.getFiles());
        multipartRequest.fields.addAll(request.getBody());
        StreamedResponse stream = await multipartRequest.send();
        Response response = await Response.fromStream(stream);
        print(response.body);
        return ApiResponse(response);
      case "PUT":
        if (!request.hasFiles()) {
          Map<String, String> headers = <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }..addAll(request.getAdditionnalHeaders());
          Response response = await http.put(url.toString(),
              headers: headers, body: jsonEncode(request.getBody()));

          return ApiResponse(response);
        }
        Map<String, String> headers = <String, String>{
          'Content-Type': 'multipart/form-data',
        }..addAll(request.getAdditionnalHeaders());
        MultipartRequest multipartRequest = MultipartRequest("PUT", url);
        multipartRequest.headers.addAll(headers);
        print(multipartRequest.headers);
        multipartRequest.files.addAll(request.getFiles());
        multipartRequest.fields.addAll(request.getBody());
        StreamedResponse stream = await multipartRequest.send();
        Response response = await Response.fromStream(stream);
        print(response.body);
        return ApiResponse(response);

      case "GET":
        Map<String, String> headers = <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }..addAll(request.getAdditionnalHeaders());
        Response response = await http.get(url.toString(), headers: headers);
        return ApiResponse(response);
    }
    return ApiResponse(null,
        defaultError: GenericError(
            "the request ${request.getName()} has invalid HTTP Verb"));
  }

  Uri _makeUrl(AbstractApiRequest request) {
    return Uri.http(this.host, this.prefix + request.getUrl(), request.getParams());
  //  return Uri.https(this.host, this.prefix + request.getUrl(), request.getParams());
  }

  static Future<AbstractApiResponse> exec(AbstractApiRequest request) async {
    if (_instance == null) {
      _instance = ApiClient();
    }
    return await _instance.process(request);
  }

  static Future<AbstractApiResponse> execOrFail(
      AbstractApiRequest request) async {
    try {
      ApiResponse response = await exec(request);
      if (response.hasError()) {
        print(response.error.toString());
        print(response.error.stackTrace);
        throw response.error;
      }
      return response;
    } catch (err) {
      print(err.toString());
      print(err.stackTrace);
      throw err;
    }
  }

  static Future<dynamic> execAndParseOrFail(AbstractApiRequest request) async {
    ApiResponse response = await ApiClient.execOrFail(request);
    print(response.httpResponse.body);
    return request.parseResult(response);
  }
}
