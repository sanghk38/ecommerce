import 'package:ecommerce/domain/network/response/api_response.dart';
import 'package:ecommerce/domain/network/server/dio_client.dart';
import 'package:ecommerce/models/user/user.dart';

abstract class LoginRepository {
  Future<ApiResponse<User>> logIn({
    required String username,
    required String password,
  });
}

class LoginRepositoryImpl implements LoginRepository {
  // ignore: avoid_unused_constructor_parameters
  const LoginRepositoryImpl(DioClient dioClient);
  @override
  Future<ApiResponse<User>> logIn({
    required String username,
    required String password,
  }) {
    return Future.delayed(
      const Duration(milliseconds: 300),
          () => const ApiResponse<User>(data: User()),
    );
  }
}
