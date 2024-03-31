import 'package:dio/dio.dart';
import 'package:wtg_admin/core/singletons/api_singleton.dart';
import 'package:wtg_admin/core/singletons/dio_sigleton.dart';

class AuthController {
  Future<int> login(String login, String password) async {
    try {
      var requestBody = {
        "email": login,
        "password": password
      };

      var response = await DioSingleton().instance().post("${ApiSingleton()
          .instance()
          .apiURL}/login", data: requestBody);
      return response.statusCode ?? 200;
    } catch(ex) {
      print(ex);
      if(ex is DioException) {
        return ex.response!.statusCode ?? 500;
      }
      return 500;
    }
  }
}