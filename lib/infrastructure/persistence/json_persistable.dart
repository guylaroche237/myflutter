import 'dart:convert';
import 'package:myflutter/infrastructure/persistence/persistable.dart';

import 'abstract_persister.dart';

abstract class JsonPersistable extends Persistable{
  dynamic toJson();
  JsonPersistable fromJson(dynamic json);
  @override
  getPersistableValue() {
    try{
      return jsonEncode(this.toJson());
    }catch(err){
      print(err);
      print(err.stackTrace);
      return;
    }
  }

  Persistable newFromPersistable(AbstractPersister persister){
    String jsonString = persister.get(this.getPersistableKey());
    Map<String,dynamic>json = jsonDecode(jsonString);
    return this.fromJson(json);
  }


}