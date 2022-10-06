import 'package:bloc/bloc.dart';
import 'package:ecommerce/bloc/login/login_state.dart';
import 'package:ecommerce/repositories/login_repository.dart';

class LoginBloc extends Cubit<LoginState>{
  late final LoginRepository _loginRepository;
  LoginBloc (LoginRepository loginRepository) : super (LoginInitial()){
    _loginRepository = loginRepository;
  }
  Future<void> login({
    required String username,
    required String password,
  }) async {
    final result = await _loginRepository.logIn(
      username: username,
      password: password,
    );
    result.fold(
      success: (_) => emit(LoginSuccess()),
      error: (_) => emit(LoginFailure()),
    );
  }
}