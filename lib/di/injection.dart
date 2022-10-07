import 'package:dio/dio.dart';
import 'package:ecommerce/bloc/login/login_bloc.dart';
import 'package:ecommerce/bloc/session/session_bloc.dart';
import 'package:ecommerce/bloc/tab_bloc/tab_bloc.dart';
import 'package:ecommerce/core/app_router.dart';
import 'package:ecommerce/core/helpers/event_bus.dart';
import 'package:ecommerce/domain/keychain/shared_prefs.dart';
import 'package:ecommerce/domain/network/server/dio_client.dart';
import 'package:ecommerce/repositories/login_repository.dart';
import 'package:get_it/get_it.dart';

import '../core/helpers/dialog_helper.dart';

final GetIt getIt = GetIt.instance;

Future<void> registerDependencies() async {
  // Add inject dependency
  getIt.registerSingletonAsync(() => SharedPrefs().init());
  getIt.registerSingleton(() => AppRouter());
  getIt.registerSingleton(Dio());
  getIt.registerSingleton<EventBus>(EventBus());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerLazySingleton<DialogHelper>(() => DialogHelperImpl());
  _registerRepositories();
  _registerBlocs();
}

void _registerRepositories() {
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(getIt<DioClient>()),
  );
}

void _registerBlocs() {
  // getIt.registerFactory(() => SplashBloc(getIt<SharedPrefs>()));
  getIt.registerFactory(
    () => LoginBloc(
      getIt<LoginRepository>(),
    ),
  );
  getIt.registerFactory(() => TabBloc());
  getIt.registerFactory(() => SessionBloc());

}
