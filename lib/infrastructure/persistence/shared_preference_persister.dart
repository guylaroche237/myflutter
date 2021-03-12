
import 'package:myflutter/infrastructure/persistence/persistable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'abstract_persister.dart';

class SharedPreferencePersister implements AbstractPersister {
  final SharedPreferences prefs;
  SharedPreferencePersister(this.prefs);
  @override
  void persist(Persistable persistable) {
    print("ATTEMPTING TO PERSIST "+persistable.getPersistableKey());
    print("VALUE: "+persistable.getPersistableValue().toString());
    dynamic value = persistable.getPersistableValue();
    String key = persistable.getPersistableKey();
    if (value is String) {
      prefs.setString(key, value);
      return;
    }
    if (value is bool) {
      prefs.setBool(key, value);
      return;
    }
    if (value is int) {
      prefs.setInt(key, value);
      return;
    }
    if (value is double) {
      prefs.setDouble(key, value);
      return;
    }
    if (value is List<String>) {
      prefs.setStringList(key, value);
      return;
    }
    throw "The PrefsPersister cannot persist a variable of type ${value.runtimeType.toString()}";
  }

  @override
  get(String key) {
    return prefs.get(key);
  }

  @override
  bool has(String key) {
    return prefs.get(key) != null;
  }

  @override
  remove(String key) {
    print("ATTEMPTING TO REMOVE "+key);
    return prefs.remove(key);
  }
}
