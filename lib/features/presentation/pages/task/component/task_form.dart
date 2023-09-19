// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_returning_null_for_void, prefer_final_fields, unused_field

import 'package:application/consts.dart';
import 'package:application/features/domain/entities/task/request/task.request.entity.dart';
import 'package:application/features/domain/entities/task/request/task.request.entity.dart';
import 'package:application/features/presentation/cubit/task/create/create_cubit.dart';
import 'package:application/features/presentation/cubit/user/credentials/credentials_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../size_config.dart';
import '../../../widgets/custom_surfix_icon.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/form_error.dart';
import '../../../widgets/input_credential.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({ Key? key }) : super(key: key);

  @override
  State<TaskForm> createState() => _TaskFormFormState();
}

class _TaskFormFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _expirationController = TextEditingController(); 
  TaskRequestEntity task = TaskRequestEntity(
    title: '',
   description: '', 
   expiration: '', 
   status: ''
  );
  String _selectedStatus = 'PENDIENTE'; 
  DateTime? _selectedDate;

  bool? remember = false;
  final List<String?> errors = [];

  bool _isSigningIn = false;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now(); // Inicializa la fecha seleccionada con la fecha actual
  }

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        // Actualiza el valor en el formulario
        (TaskRequestEntity(
          title: _titleController.text,
          description: _descriptionController.text,
          expiration: pickedDate.toString(),
          status: _selectedStatus,
        ));
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
  
  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          InputCredential(
            controller: _titleController,
            hintText: "Ingresar Titulo",
            labelText: "title",
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          InputCredential(
            controller: _descriptionController,
            inputType: TextInputType.multiline,
            hintText: "Ingresar Descripcion",
            labelText: "Description",
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          GestureDetector(
            onTap: () {
              _selectDate(context);
            },
            child: TextFormField(
              readOnly: true,
              controller: TextEditingController(
                text: _selectedDate != null
                    ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                    : '',
              ),
              decoration: InputDecoration(
                labelText: 'Fecha de vencimiento',
                hintText: 'Seleccionar fecha de vencimiento',
                suffixIcon: Icon(Icons.calendar_today),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
           DropdownButtonFormField<String>(
            value: _selectedStatus,
            items: <String>['PENDIENTE', 'COMPLETADO', 'EN PROGRESO', 'CANCELADO']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedStatus = newValue!;
              });
            },
            decoration: InputDecoration(
              labelText: 'Estado',
              hintText: 'Seleccionar estado',
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          _isSigningIn ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Espera un momento", style: TextStyle(color: Palette.backgroundColor, fontSize: 16, fontWeight: FontWeight.w400),),
              sizeHor(10),
              CircularProgressIndicator(color: Palette.backgroundColor,)
            ],
          ) :
          DefaultButton(
            text: "GUARDAR",
            state: true,
            press: () {
              _save();
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.05),
        ],
      ),
    );
  }

    Future<void> _save() async {
    setState(() {
      task = TaskRequestEntity(
        title: _titleController.text,
          description: _descriptionController.text,
          expiration: _selectedDate.toString(),
          status: _selectedStatus,
      );
    });
    BlocProvider.of<TaskCreateCubit>(context).add(
        params: task
    ).then((value) => _clear());
  }

  _clear() {
    setState(() {
      _titleController.clear();
      _descriptionController.clear();
      _expirationController.clear();
    });
    Navigator.pushNamedAndRemoveUntil(context, PageConst.HomePage, (route) => false);
  }

  
}

