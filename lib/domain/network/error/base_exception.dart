

import 'package:dio/dio.dart';
import 'package:ecommerce/core/enums/network_error_type.dart';
import 'package:ecommerce/domain/network/error/error_response.dart';



class BaseException implements Exception {
  static const String somethingWentWrongError =
      'Something went wrong. Please try again!';
  final NetworkErrorType errorType;
  final Exception? exception;
  final Response<dynamic>? response;
  final ErrorResponse? errorResponse;

  BaseException(
    this.errorType, {
    this.response,
    this.exception,
    this.errorResponse,
  });

  factory BaseException.toNetworkError(Exception e) {
    return BaseException(NetworkErrorType.NETWORK, exception: e);
  }

  factory BaseException.toHttpError(Response<dynamic>? response) {
    return BaseException(NetworkErrorType.HTTP, response: response);
  }

  factory BaseException.toServerError(ErrorResponse response) {
    return BaseException(NetworkErrorType.SERVER, errorResponse: response);
  }

  factory BaseException.toUnexpectedError(Exception e) {
    return BaseException(NetworkErrorType.UNEXPECTED, exception: e);
  }

  String get errorMessage {
    switch (errorType) {
      case NetworkErrorType.NETWORK:
        return exception.toString();
      case NetworkErrorType.SERVER:
        return errorResponse?.message ?? '';
      case NetworkErrorType.HTTP:
        return _getHttpErrorMessage(response?.statusCode ?? 0);
      case NetworkErrorType.UNEXPECTED:
        return somethingWentWrongError;
    }
  }

  String _getHttpErrorMessage(int statusCode) {
    if (statusCode >= 300 && statusCode <= 308) {
      // Redirection
      return "It was transferred to a different URL. I'm sorry for causing you trouble";
    }
    if (statusCode >= 400 && statusCode <= 451) {
      // Client error
      return 'An error occurred on the application side. Please try again later!';
    }
    if (statusCode >= 500 && statusCode <= 511) {
      // Server error
      return 'A server error occurred. Please try again later!';
    }
    // Unofficial error
    return 'An error occurred. Please try again later!';
  }
}
