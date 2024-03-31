import 'package:wtg_admin/core/env/api_config.dart';
import 'package:wtg_admin/core/singletons/storage_singleton.dart';
import 'package:wtg_admin/core/utils/constants.dart';

const String PROD = "PROD";
const String STAGING = "STAGING";

enum ServerType {
  prod, staging
}

class ApiSingleton {
  static final ApiSingleton _singleton = ApiSingleton._internal();
  static late ApiConfig _apiConfig;

  static void init() {
    StorageSingleton().instance().setItem(SERVER_TYPE_PREF, STAGING);

    switch(StorageSingleton().instance().getItem(SERVER_TYPE_PREF) ?? PROD) {
      case PROD:
        _apiConfig = ApiConfigProd();
        break;
      case STAGING:
        _apiConfig = ApiConfigStaging();
        break;
      default:
        throw Exception();
    }
  }

  ApiConfig instance() => _apiConfig;

  factory ApiSingleton() => _singleton;

  ApiSingleton._internal();
}
