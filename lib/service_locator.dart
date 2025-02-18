import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_caff/core/services/network_info.dart';
import 'package:my_caff/feauture/data/repo/user_repo_impl.dart';
import 'package:my_caff/feauture/domain/repo/user_repo.dart';
import 'package:my_caff/feauture/domain/usecases/sign_in.dart';
import 'package:my_caff/feauture/domain/usecases/sign_up.dart';

final sl = GetIt.instance;

init() {
  //Usecases
  sl.registerLazySingleton(() => SignIn(userRepo: sl()));
  sl.registerLazySingleton(() => SignUp(userRepo: sl()));

  //Repository
  sl.registerLazySingleton<UserRepo>(() => UserRepoImpl(networkInfo: sl()));

  //Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));

  //External
  sl.registerLazySingleton(() => InternetConnectionChecker.instance);
}
