
import 'package:myflutter/infrastructure/persistence/json_persistable.dart';
import 'package:myflutter/model/role.dart';

class Token extends JsonPersistable {
  static const PERSISTABLE_KEY = "TOKENE";
  String accessToken;
  int id;
  String role;
  String username;
  String email;
  bool isActive;

  Token(
      {this.accessToken,
      this.username,
      this.id,
      this.role,
      this.email,
      this.isActive});

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['token'];
    isActive = json['active'];
    id = json['id'];
    role = json['roles'][0];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['id'] = this.id;
    data['role'] = this.role;
    data['email'] = this.email;
    data['username'] = this.username;
    data['isActive'] = this.isActive;
    return data;
  }

  bool isAdmin(){
    return this.role == Role.admin().name;
  }
  bool isAgent(){
    return this.role == Role.agent().name;
  }

  bool isManager(){
    return this.role == Role.manager().name;
  }
  bool isAgentSale(){
    return this.role == Role.agentsale().name;
  }
  bool isAgentStock(){
    return this.role == Role.agentstock().name;
  }
  bool isOwner(){
    return this.role == Role.owner().name;
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