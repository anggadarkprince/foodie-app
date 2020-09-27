import 'package:dio/dio.dart';
import 'package:foodie/utils/secure_storage.dart';
import 'package:foodie/utils/shared_storage.dart';

class DioLoggingInterceptors extends InterceptorsWrapper {
  final Dio _dio;
  final SecureStorage secureStorage = new SecureStorage();
  final SharedStorage sharedStorage = new SharedStorage();

  DioLoggingInterceptors(this._dio);

  @override
  Future onRequest(RequestOptions options) async {
    _dio.options.baseUrl = 'http://foodie.app';
    String accessToken = await secureStorage.getData(AppSecureStorageKeys.accessToken, '');
    if (accessToken.isNotEmpty) {
      options.headers.remove('requirestoken');
      options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    }
    return options;
  }

  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }

  @override
  Future onError(DioError dioError) async {

    int responseCode = dioError.response.statusCode;
    String oldAccessToken = await sharedStorage.getData(AppSecureStorageKeys.accessToken, '');
    
    if (oldAccessToken != null && responseCode == 401) {
      _dio.interceptors.requestLock.lock();
      _dio.interceptors.responseLock.lock();

      String refreshToken = await secureStorage.getData(AppSecureStorageKeys.refreshToken, '');

      final response = await _dio.post(
        'oauth/token',
        data: FormData.fromMap({
          "grant": "refresh_token",
          "refresh_token": refreshToken
        })
      );

      String newAccessToken = response.data.accessToken;
      String newRefreshToken = response.data.refreshToken;
      await sharedStorage.setData(AppSecureStorageKeys.accessToken, newAccessToken);
      await secureStorage.setData(AppSecureStorageKeys.accessToken, newAccessToken);
      await secureStorage.setData(AppSecureStorageKeys.refreshToken, newRefreshToken);

      RequestOptions options = dioError.response.request;
      _dio.interceptors.requestLock.unlock();
      _dio.interceptors.responseLock.unlock();
      return _dio.request(options.path, options: options);
    } else {
      super.onError(dioError);
    }
  }
}