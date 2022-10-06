import 'package:ecommerce/domain/network/error/base_exception.dart';


abstract class Failures {
  final String message = '';
}

class ServerFailure extends Failures {
  final BaseException _exception;

  ServerFailure(this._exception);

  @override
  String get message => _exception.errorMessage;

  int? get statusCode => _exception.errorResponse?.code;
}

class UnhandledFailure extends Failures {
  final String _message;

  UnhandledFailure(this._message);

  @override
  String get message => _message;
}
