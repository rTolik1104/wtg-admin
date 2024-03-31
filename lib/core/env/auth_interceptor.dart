import 'package:dio/dio.dart';
import 'package:wtg_admin/core/singletons/api_singleton.dart';
import 'package:wtg_admin/core/singletons/dio_sigleton.dart';
import 'package:wtg_admin/core/singletons/storage_singleton.dart';
import 'package:wtg_admin/core/utils/constants.dart';


class AuthInterceptor extends Interceptor {
  final Dio _dio;

  AuthInterceptor(this._dio);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      if (err.response!.statusCode == 401) {
        await _refreshTokenAndRetry(err, handler);
      } else {
        handler.next(err);
      }
    } catch (ex) {
      print("dio request: $ex");
    }
  }

  Future<void> _refreshTokenAndRetry(DioException err, ErrorInterceptorHandler handler) async {
    try {
      await refreshToken();
      await DioSingleton().setAuthHeader();

      final String newAccessToken = StorageSingleton().instance().getItem(ACCESS_TOKEN_PREF) ?? '';
      err.requestOptions.headers['authorization'] = 'Bearer $newAccessToken';

      final RequestOptions options = err.requestOptions;
      final response = await _dio.request(
        options.path,
        options: Options(
          method: options.method,
          headers: options.headers,
        ),
      );
      handler.resolve(response);
    } catch (error) {
      handler.reject(DioException(requestOptions: err.requestOptions, error: error));
    }
  }

  Future<void> refreshToken() async {
    try {

      final response = await DioSingleton().instance().post(
        '${ApiSingleton().instance().apiURL}/refresh',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'access-control-allow-credentials': 'true',
            'access-control-allow-origin': '*',
          },
        ),
        data: {
          'refresh_token': StorageSingleton().instance().getItem(REFRESH_TOKEN_PREF),
        },
      );

      if (response.statusCode != 200 && response.data == null) {
        throw Exception('refresh token error');
      }

      await StorageSingleton().instance().setItem(ACCESS_TOKEN_PREF, response.data['access_token'].toString());
      await StorageSingleton().instance().setItem(REFRESH_TOKEN_PREF, response.data['refresh_token'].toString());
    } catch (e) {
      throw Exception('refresh token error');
    }
  }
}