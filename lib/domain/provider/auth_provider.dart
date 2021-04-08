import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/domain/dashboard_screen/profile/update_args.dart';
import 'package:myflutter/infrastructure/abstract_types/api/abstract_api_response.dart';
import 'package:myflutter/infrastructure/api/api_client.dart';
import 'package:myflutter/infrastructure/api/requests/find_user_by_username_request.dart';
import 'package:myflutter/infrastructure/api/requests/login_request.dart';
import 'package:myflutter/infrastructure/api/requests/register_request.dart';
import 'package:myflutter/infrastructure/api/requests/update_user_request.dart';
import 'package:myflutter/infrastructure/persistence/abstract_persister.dart';
import 'package:myflutter/model/token.dart';
import 'package:http/http.dart' as http;
import 'package:myflutter/model/user.dart';
import 'package:myflutter/model/user_register_dto.dart';

class AuthProvider with ChangeNotifier{
  final AbstractPersister cache;
  Token _token;
  User _user;

  AuthProvider(this.cache);

  Future<String> register(String email, String password, String phone) async {

    return "";
  //  return registerRequest.parseResult(response);
  }

  Future<Token> login(String phone,String password) async {
    LoginRequest loginRequest = LoginRequest(phone,password);
    AbstractApiResponse response = await ApiClient.execOrFail(loginRequest);
    Map<String, dynamic> json = jsonDecode(response.httpResponse.body);
    print(json);
    Token createdToken = loginRequest.parseResult(response);
    _token = createdToken;
    cache.persist(createdToken);
    print(cache.has(Token.PERSISTABLE_KEY));
    print("TOKEN CACHED");

    if(createdToken.isOwner()){
      print("TRUE TRUE TRUE TRUE TRUE TRUE");
      FindUserByUsernameRequest findUserByUsernameRequest = FindUserByUsernameRequest(createdToken);
      AbstractApiResponse res = await ApiClient.execOrFail(findUserByUsernameRequest);
      User sessionUser = findUserByUsernameRequest.parseResult(res);
      _user = sessionUser;
      cache.persist(sessionUser);
      print(cache.has(User.PERSISTABLE_KEY));
      print("User CACHED Succeffull");

    }
    notifyListeners();
    return createdToken;
  }

  Token get token {
    if (_token != null) {
      return _token;
    }
    if (!cache.has(Token.PERSISTABLE_KEY)) {
      print("NO CACHED TOKEN DETECTED");
      return null;
    }
    try {
      Token cachedToken = Token().newFromPersistable(cache);
      _token = cachedToken;
      print("Auth listener notified");
      notifyListeners();
      return _token;
    } catch (err) {
      print(err);
      print(err.stackTrace);
      return null;
    }
  }

  User get user {
    if (_user != null) {
      return _user;
    }
    if (!cache.has(User.PERSISTABLE_KEY)) {
      print("NO CACHED User DETECTED");
      return null;
    }
    try {
      User cachedToken = User().newFromPersistable(cache);
      _user = cachedToken;
      print("Auth listener notified");
      notifyListeners();
      return _user;
    } catch (err) {
      print(err);
      print(err.stackTrace);
      return null;
    }
  }

  void registerWorker(Token token,UserRegisterDto userRegisterDto) async {

    RegisterRequest registerRequest = RegisterRequest(userRegisterDto,token);
    try {

    } catch (err) {

    }
  }

  Future<AbstractApiResponse> updateUser(Token token,User user,UpdateAgrs agrs) async {
    UpdateUserRequest updateUserRequest = UpdateUserRequest(token: token,user: user,agrs: agrs);
    //User newUser = updateUserRequest.parseResult(await ApiClient.execAndParseOrFail(updateUserRequest));
    AbstractApiResponse response = await ApiClient.execAndParseOrFail(updateUserRequest);
    //login(user.username, password)
    return response;

  }


}