import 'package:application/features/core/utils/api_response.dart';
import 'package:application/features/core/utils/failure.dart';
import 'package:application/features/core/utils/result_response.dart';
import 'package:application/features/domain/entities/user/authentication.entity.dart';
import 'package:application/features/domain/entities/user/request/user.entity.dart';
import 'package:application/features/domain/repositories/user/user.repository.dom.dart';

class SignInUseCase{
  final UserRepository repository;

  SignInUseCase({required this.repository});

  Future<Result<ApiResponse<AuthEntity>, Failure>> call(UserEntity params){
    return repository.signIn(params);
  }
}