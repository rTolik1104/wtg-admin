import 'dart:io';
import 'package:dio/io.dart';
import 'package:wtg_admin/core/singletons/api_singleton.dart';
import 'package:wtg_admin/core/singletons/dio_sigleton.dart';
import 'package:wtg_admin/core/singletons/storage_singleton.dart';

import 'auth_interceptor.dart';

class Config {
  static Future<void> init() async {
    print("[LOG] init singeltons...");
    await _initLocalStorage();
    await _initApi();
    _initDio();
  }

  static void _initDio() {
    print("[LOG] init dio...");
    (DioSingleton().instance().httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    DioSingleton().setAuthHeader();
    DioSingleton().instance().interceptors.add(AuthInterceptor(DioSingleton().instance()));
  }

  static Future<void> _initApi() async {
    print("[LOG] init api...");
    ApiSingleton.init();
  }

  static Future<void> _initLocalStorage() async {
    print("[LOG] init local storage...");
    StorageSingleton.init();
  }
}