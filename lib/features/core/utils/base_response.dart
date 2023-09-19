import 'package:application/features/core/utils/api_response.dart';

class BaseResponse<T> {
  final ApiResponse<T> apiResponse;

  BaseResponse(this.apiResponse);
}