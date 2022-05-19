import 'package:cached/src/models/clear_all_cached_method.dart';

import '../utils/utils.dart';

class ClearAllCachedTemplate {
  final ClearAllCachedMethod clearAllCachedMethod;

  ClearAllCachedTemplate(this.clearAllCachedMethod);

  String generateMethod() {
    return '''
  @override
  void ${clearAllCachedMethod.name}() { 
   for(String name in ${clearAllCachedMethod.methodsNames})}
    $getCacheMapName(name).clear();
   }
  ''';
  }
}
