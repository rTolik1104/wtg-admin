import 'package:localstorage/localstorage.dart';

class StorageSingleton {
  static final StorageSingleton _singleton = StorageSingleton._internal();
  static late LocalStorage _localStorage;

  static Future<void> init() async {
    _localStorage = LocalStorage('cache');
    await _localStorage.ready;
  }

  LocalStorage instance() => _localStorage;

  factory StorageSingleton() => _singleton;

  StorageSingleton._internal();
}
