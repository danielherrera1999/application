import 'package:application/features/core/utils/api_response.dart';
import 'package:application/features/core/utils/failure.dart';
import 'package:application/features/core/utils/result_response.dart';
import 'package:application/features/data/datasources/remote/remote.datasource.dart';
import 'package:application/features/domain/entities/task/request/task.request.entity.dart';
import 'package:application/features/domain/repositories/task/task.repository.dom.dart';

class TaskRepositoryImpl implements TaskRepository{
  final RemoteDataSource remoteDataSource;

  TaskRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<ApiResponse<bool>, Failure>> add(TaskRequestEntity params) async => remoteDataSource.add(params);
  
}