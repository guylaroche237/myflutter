
import 'persistable.dart';
abstract class AbstractPersister{
   void persist(Persistable persistable); 
   dynamic get(String key);
   bool has(String key);
   remove(String key);
}