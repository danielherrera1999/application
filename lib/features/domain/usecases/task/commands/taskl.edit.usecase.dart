import 'package:application/features/core/utils/api_response.dart';
import 'package:application/features/core/utils/failure.dart';
import 'package:application/features/core/utils/result_response.dart';
import 'package:application/features/domain/entities/task/request/task.request.entity.dart';
import 'package:application/features/domain/repositories/task/task.repository.dom.dart';

class TaskEditUseCase{
  final TaskRepository repository;

  TaskEditUseCase({required this.repository});

  Future<Result<ApiResponse<bool>, Failure>> call(TaskRequestEntity params){
    return repository.edit(params);
  }
}