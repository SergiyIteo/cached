import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/source_gen.dart';

import 'package:cached_annotation/src/clear_all_cached.dart';

import '../asserts.dart';
import '../config.dart';

class ClearAllCachedMethod {
  ClearAllCachedMethod({
    required this.name,
    required this.isAsync,
    required this.returnType,
  }) : assert(isAsync == false && returnType.isVoid);

  final String name;
  final bool isAsync;
  final DartType returnType;

  factory ClearAllCachedMethod.fromElement(
      MethodElement element, Config config) {
    const methodAnnotationChecker = TypeChecker.fromRuntime(ClearAllCached);
    final annotation = methodAnnotationChecker.firstAnnotationOf(element);


    final method = ClearAllCachedMethod(
      name: element.name,
      isAsync: element.isAsynchronous,
      returnType: element.returnType,
    );

    if (element.isAsynchronous == false) {
      throw InvalidGenerationSourceError('Element should not be asynchronous');
    } else if (!element.returnType.isVoid) {
      throw InvalidGenerationSourceError('Element return type has to be void');
    } else {
      return method;
    }
  }

  static DartObject? getAnnotation(MethodElement element) {
    const methodAnnotationChecker = TypeChecker.fromRuntime(ClearAllCached);
    return methodAnnotationChecker.firstAnnotationOf(element);
  }
}
