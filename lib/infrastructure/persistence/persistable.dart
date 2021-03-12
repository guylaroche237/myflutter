
import 'abstract_persister.dart';

abstract class Persistable{
  dynamic getPersistableValue();
  String getPersistableKey(); 
  Persistable newFromPersistable(AbstractPersister persister); 
}