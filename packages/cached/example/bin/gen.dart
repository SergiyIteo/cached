import 'package:cached_annotation/cached_annotation.dart';

part 'gen.cached.dart';

@WithCache(useStaticCache: true)
abstract class Gen implements _$Gen {
  factory Gen(
    int a, {
    required String b,
    String? c,
  }) = _Gen;

  @Cached(syncWrite: true, ttl: 30, limit: 10)
  Future<int> call(
    String arg1, {
    @IgnoreCache(useCacheOnError: true) bool ignoreCache = true,
  }) {
    return Future.value(5);
  }

  @cached
  int something(String a, [int? b]) {
    return 3;
  }

  @clearAllCached
  void clearAll();

  //Option one with argument
  @ClearCached('something')
  void clear();

  //Option two with `clear` in name function
  // @clearCached
  // void clearSomething();
}
