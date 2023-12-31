import 'package:application/consts.dart';
import 'package:application/features/domain/entities/task/request/task.request.entity.dart';
import 'package:application/features/domain/entities/task/task.entity.dart';
import 'package:application/features/presentation/cubit/user/auth/auth_cubit.dart';
import 'package:application/features/presentation/cubit/user/credentials/credentials_cubit.dart';
import 'package:application/features/presentation/pages/main/main_screen.dart';
import 'package:application/features/presentation/pages/signIn/components/signIn_body.dart';
import 'package:application/features/presentation/pages/task/component/task_body.dart';
import 'package:application/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskScreen extends StatefulWidget {
  final TaskEntity? task;
  final String title;

  const TaskScreen({ Key? key, this.task, required this.title }) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, PageConst.HomePage, (route) => false);
          },
        ),
        title: const Text('Tareas'), 
      ),
      body: TaskBody(task: widget.task, title: widget.title,)
    );
  }
}