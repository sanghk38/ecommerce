
import 'package:ecommerce/domain/network/error/failures.dart';

abstract class State<S> {
  static State<S> error<S>(Failures failure) => _ErrorState<S>(failure);
  static State<S> success<S>(S data) => _SuccessResult<S>(data);

  Failures? get failures => fold<Failures?>(
    success: (dynamic data) => null,
    error: (Failures? error) => error,
  );

  S? get data => fold<S?>(
    success: (S? data) => data,
    error: (Failures? error) => null,
  );

  bool get isSuccess => this is _SuccessResult<S>;

  bool get isFailure => this is _ErrorState<S>;

  bool get isHasData => data != null;

  bool get isHasError => failures != null;

  S dataOrElse(S other) => isSuccess && data != null ? data! : other;

  S operator |(S other) => dataOrElse(other);

  State<T> either<T>(
      T Function(S? data) success,
      Failures Function(Failures? error) error,
      );

  State<T> then<T>(State<T> Function(S? data) fnData);

  State<T> map<T>(T Function(S? data) fnData);

  T? fold<T>({
    T? Function(S? data)? success,
    T? Function(Failures? error)? error,
  });
}

class _SuccessResult<S> extends State<S> {
  final S? _value;

  _SuccessResult(this._value);

  @override
  _SuccessResult<T> either<T>(
      T Function(S? data) success,
      Failures? Function(Failures? error)? error,
      ) {
    return _SuccessResult<T>(success(_value));
  }

  @override
  State<T> then<T>(State<T> Function(S? data) fnData) {
    return fnData(_value);
  }

  @override
  _SuccessResult<T> map<T>(T Function(S? data) fnData) {
    return _SuccessResult<T>(fnData(_value));
  }

  @override
  T? fold<T>({
    T? Function(S? data)? success,
    T? Function(Failures? error)? error,
  }) {
    return success?.call(_value);
  }
}

class _ErrorState<S> extends State<S> {
  final Failures _value;

  _ErrorState(this._value);

  @override
  _ErrorState<T> either<T>(
      T? Function(S? data)? success,
      Failures Function(Failures? error) error,
      ) {
    return _ErrorState<T>(error(_value));
  }

  @override
  _ErrorState<T> map<T>(T Function(S data) fnData) {
    return _ErrorState<T>(_value);
  }

  @override
  _ErrorState<T> then<T>(State<T> Function(S data) fnData) {
    return _ErrorState<T>(_value);
  }

  @override
  T? fold<T>({
    T? Function(S data)? success,
    T? Function(Failures error)? error,
  }) {
    return error?.call(_value);
  }
}
