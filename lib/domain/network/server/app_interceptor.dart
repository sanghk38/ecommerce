import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  final Dio dio;

  AppInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Refresh Token here
    // Flow:
    // 1. Get current access token
    // 2. If token not null then get expiry time of current access token
    // 3. If the time is smaller then 1 minute then lock request dio
    // 3.1. Call refresh token. If has error then handle.reject otherwise unlock request dio
    // 4. Set options.headers['Authorization'] = 'Bearer $accessToken';
    return handler.next(options);
  }
}
