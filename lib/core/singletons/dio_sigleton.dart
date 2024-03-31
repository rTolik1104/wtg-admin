import 'package:dio/dio.dart';
import 'package:wtg_admin/core/singletons/storage_singleton.dart';
import 'package:wtg_admin/core/utils/constants.dart';

class DioSingleton {
  static final DioSingleton _instance = DioSingleton._internal();
  static var _dio;

  factory DioSingleton() {
    DioSingleton._dio ??= Dio();
    return _instance;
  }

  Future<void> setAuthHeader() async {
    final String token = StorageSingleton().instance().getItem(ACCESS_TOKEN_PREF) ?? '';

    DioSingleton().instance().options.headers["authorization"] = "Bearer $token";
    DioSingleton().instance().options.headers['Accept'] = 'application/json';
  }

  Dio instance() => _dio;

  DioSingleton._internal();
}
