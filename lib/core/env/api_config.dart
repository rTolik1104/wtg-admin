abstract class ApiConfig {
  late final String apiURL;
}

class ApiConfigStaging implements ApiConfig {
  @override
  String apiURL = "http://93.170.6.212:5000";
}

class ApiConfigProd implements ApiConfig {
  @override
  String apiURL = "http://93.170.6.212:5000";
}