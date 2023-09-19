// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, missing_required_param, avoid_print, dead_code, avoid_unnecessary_containers

import 'dart:async';

import 'package:application/consts.dart';
import 'package:application/features/domain/entities/task/request/task.request.entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../size_config.dart';
import '../../cubit/user/auth/auth_cubit.dart';

class MainScreen extends StatefulWidget {
  final String uid;

  const MainScreen({Key? key, required this.uid}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TaskRequestEntity taskForm = TaskRequestEntity(
    title: '',
    description: '',
    expiration: '',
    status: ''
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateTaskForm(TaskRequestEntity newTaskForm) {
  setState(() {
    taskForm = newTaskForm;
  });
}


  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        body: Center(
          child: Text('FUNCIONA'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, PageConst.TaskPage, (route) => false);
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}


