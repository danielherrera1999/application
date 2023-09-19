
import 'package:application/features/data/datasources/remote/remote.datasource.dart';
import 'package:application/features/data/datasources/remote/remote.datasource.imp.dart';
import 'package:application/features/data/repositories/task/task.repository.imp.dart';
import 'package:application/features/data/repositories/user/user.repository.imp.dart';
import 'package:application/features/domain/repositories/task/task.repository.dom.dart';
import 'package:application/features/domain/repositories/user/user.repository.dom.dart';
import 'package:application/features/domain/usecases/task/commands/taskl.add.usecase.dart';
import 'package:application/features/domain/usecases/task/commands/taskl.list.usecase.dart';
import 'package:application/features/domain/usecases/user/commands/getCurrentUid.usecase.dart';
import 'package:application/features/domain/usecases/user/commands/isSignIn.usecase.dart';
import 'package:application/features/domain/usecases/user/commands/user.signIn.usecase.dart';
import 'package:application/features/domain/usecases/user/commands/user.signup.usecase.dart';
import 'package:application/features/presentation/cubit/task/create/create_cubit.dart';
import 'package:application/features/presentation/cubit/task/list/list_cubit.dart';
import 'package:application/features/presentation/cubit/user/auth/auth_cubit.dart';
import 'package:application/features/presentation/cubit/user/credentials/credentials_cubit.dart';
import 'package:get_it/get_it.dart';



final sl = GetIt.instance;

Future<void> init() async{
  // CUBIT
  sl.registerFactory(() => CredentialsCubit(signUpUseCase: sl.call(), signInUseCase: sl.call()));
  sl.registerFactory(() => AuthCubit(isSignInUseCase: sl.call(), getCurrentUidUseCase: sl.call()));
  sl.registerFactory(() => TaskCreateCubit(taskAddUseCase: sl.call()));
  sl.registerFactory(() => TaskListCubit(taskListUseCase: sl.call()));

  
  // USE CASE
  // User
  sl.registerLazySingleton(() => SignUpUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetCurrentUidUseCase(repository: sl.call()));
  //Task
  sl.registerLazySingleton(() => TaskAddUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => TaskListUseCase(repository: sl.call()));
  

  // REPOSITORY
  //USER
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(remoteDataSource: sl.call()));
  //TASK
  sl.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(remoteDataSource: sl.call()));

  // REMOTE DATA SOURCE
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDatasourceImpl());

}