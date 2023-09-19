// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:application/features/core/utils/auth.utils.dart';
import 'package:application/features/domain/entities/task/request/task.request.entity.dart';
import 'package:application/features/domain/entities/user/request/user.entity.dart';
import 'package:application/features/domain/usecases/task/commands/taskl.add.usecase.dart';
import 'package:application/features/domain/usecases/task/commands/taskl.delete.usecase.dart';
import 'package:application/features/domain/usecases/task/commands/taskl.edit.usecase.dart';
import 'package:application/features/domain/usecases/user/commands/user.signIn.usecase.dart';
import 'package:application/features/domain/usecases/user/commands/user.signup.usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';



part 'delete_state.dart';

class TaskDeleteCubit extends Cubit<TaskDeleteState> {
  final TaskDeleteUseCase taskDeleteUseCase;

  TaskDeleteCubit({required this.taskDeleteUseCase}) : super(TaskDeleteInitial());

  Future<void> delete({required int params}) async {
    emit(TaskDeleteLoading());
    try {
      final result = await taskDeleteUseCase.call(params);
      if (result.isOk) {      
        emit(TaskDeleteuccess());
      }else{
        final msg = result.error!.message;
          Fluttertoast.showToast(
            msg: msg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
          emit(TaskDeleteFailure());
      }
    } on SocketException catch(_) {
      emit(TaskDeleteFailure());
    } catch (_) {
      emit(TaskDeleteFailure());
    }
  }
}
