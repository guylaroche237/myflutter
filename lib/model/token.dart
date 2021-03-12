
import 'package:myflutter/infrastructure/persistence/json_persistable.dart';

class Token extends JsonPersistable {
  static const PERSISTABLE_KEY = "TOKENE";
  String accessToken;
  String tokenType;
  int id;
  String role;
  String expirationDate;

  Token(
      {this.accessToken,
      this.tokenType,
      this.id,
      this.role,
      this.expirationDate});

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    tokenType = json['tokenType'];
    id = json['id'];
    role = json['role'];
    expirationDate = json['expirationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['tokenType'] = this.tokenType;
    data['id'] = this.id;
    data['role'] = this.role;
    data['expirationDate'] = this.expirationDate;
    return data;
  }

  bool isWorker(){
    //return this.role == Role.worker().name;
  }
  bool isEmployer(){
    //return this.role == Role.employer().name;
  }

  @override
  JsonPersistable fromJson(json) {
    return Token.fromJson(json);
  }

  @override
  String getPersistableKey() {
    return Token.PERSISTABLE_KEY;
  }
}