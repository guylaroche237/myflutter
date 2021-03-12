import 'package:http/http.dart';

import 'abstract_api_response.dart';


abstract class AbstractApiRequest{
  String getName(){
    return this.runtimeType.toString();
  }
  Map<String,String> getParams(){
    return null;
  }
  dynamic getBody(){
    return {};
  }
  String getUrl();
  String getVerb();
  List<MultipartFile> getFiles(){
    return [];
  }
  bool hasFiles(){
    return getFiles().isNotEmpty;
  }
  Map<String,String> getAdditionnalHeaders(){
    return {};
  }
  dynamic  parseResult(AbstractApiResponse response);
}