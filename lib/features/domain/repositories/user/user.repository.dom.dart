import 'package:application/features/core/utils/api_response.dart';
import 'package:application/features/core/utils/failure.dart';
import 'package:application/features/core/utils/result_response.dart';
import 'package:application/features/domain/entities/user/authentication.entity.dart';
import 'package:application/features/domain/entities/user/request/user.entity.dart';

abstract class UserRepository {
  //Credentials
  Future<Result<ApiResponse<bool>, Failure>> signUp(UserEntity user);
  Future<Result<ApiResponse<AuthEntity>, Failure>> signIn(UserEntity user);
  Future<void> signOut();
  Future<bool> isSignIn();
  Future<String> getCurrentUid();
}