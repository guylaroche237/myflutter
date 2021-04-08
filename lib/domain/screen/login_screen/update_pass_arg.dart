import 'package:myflutter/model/token.dart';

class UpdatePasswordArgs{
  Token token;
  String oldPassword;
  UpdatePasswordArgs(this.token,this.oldPassword);
}