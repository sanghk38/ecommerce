import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants/end_point.dart';
import 'package:ecommerce/domain/network/server/app_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../core/helpers/state_helper.dart';
import '../error/base_exception.dart';
import '../error/error_response.dart';
import '../error/failures.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      ..options.baseUrl = EndPoint.baseUrl
      ..options.connectTimeout = EndPoint.connectionTimeout
      ..options.receiveTimeout = EndPoint.receiveTimeout
      ..options.responseType = ResponseType.json
      ..interceptors.addAll(<Interceptor>[
        AppInterceptor(_dio),
        if (kDebugMode)
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
          ),
      ]);
  }

  Future<State<T?>> get<T>(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    required T? Function(Map<String, dynamic>? json) mapper,
  }) {
    return _handleResponse(() {
      return _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    }, mapper);
  }

  Future<State<T?>> post<T>(
    String uri, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    required T? Function(Map<String, dynamic>?) mapper,
  }) {
    return _handleResponse(() {
      return _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    }, mapper);
  }

  Future<State<T?>> put<T>(
    String uri, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    required T? Function(Map<String, dynamic>?) mapper,
  }) {
    return _handleResponse(() {
      return _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    }, mapper);
  }

  Future<State<T?>> delete<T>(
    String uri, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    required T? Function(Map<String, dynamic>?) mapper,
  }) {
    return _handleResponse(() {
      return _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    }, mapper);
  }

  Future<State<T?>> _handleResponse<T>(
    Future<Response<Map<String, dynamic>>> Function() func,
    T? Function(Map<String, dynamic>?)? mapper,
  ) async {
    try {
      final Response<Map<String, dynamic>> result = await func();
      final Map<String, dynamic> data = result.data ?? {};
      if (result.statusCode == 200) {
        return State.success(mapper?.call(data));
      } else {
        final ErrorResponse error = ErrorResponse.fromJson(data);
        final BaseException exception = error.code != null
            ? BaseException.toServerError(error)
            : BaseException.toHttpError(result);
        final ServerFailure failure = ServerFailure(exception);
        return State.error(failure);
      }
    } on SocketException catch (e) {
      final ServerFailure failure =
          ServerFailure(BaseException.toNetworkError(e));
      return State.error(failure);
    } catch (e) {
      if (e is DioError) {
        final ErrorResponse error = ErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>? ?? <String, dynamic>{},
        );
        final BaseException exception = error.code != null
            ? BaseException.toServerError(error)
            : BaseException.toHttpError(e.response);
        final ServerFailure failure = ServerFailure(exception);
        return State.error(failure);
      }
      final UnhandledFailure failure = UnhandledFailure(e.toString());
      return State.error(failure);
    }
  }
}
