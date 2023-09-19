// ignore_for_file: camel_case_types, prefer_const_constructors, unnecessary_new, avoid_print

import 'package:application/features/domain/entities/task/task.entity.dart';
import 'package:flutter/material.dart';

import '../../../consts.dart';
import 'hextorgba_color.dart';

class cardsTask extends StatefulWidget {
  final TaskEntity task;
  const cardsTask({ Key? key, required this.task}) : super(key: key);

  @override
  State<cardsTask> createState() => _cardsTaskState();
}

class _cardsTaskState extends State<cardsTask> {
  bool isHover = false;
  Offset mousPos = Offset(0, 0);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        height: MediaQuery.of(context).size.height / 5,
        // padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5), vertical: getProportionateScreenHeight(5)),
        child: InkWell(
          onTap: () {
            // Navigator.pushNamed(context, PageConst.RoutesPage);
          },
          child: Container(
            decoration: BoxDecoration(
              color: hexOrRGBToColor('#DE9307').withOpacity(.2),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(16), 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${widget.task.title}",
                  style: TextStyle(fontSize: 25, color: hexOrRGBToColor('#000000'), fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "${widget.task.description}",
                  style: TextStyle(fontSize: 16, color: hexOrRGBToColor('#000000')),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}