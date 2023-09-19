// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable


import 'package:application/features/presentation/pages/signIn/signin.screen.dart';
import 'package:application/features/presentation/pages/signUp/signUp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'consts.dart';


class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {
      case PageConst.LoginPage: {
        return routeBuilder(SignInScreen());
      }
      // case PageConst.HomePage: {
      //   return routeBuilder(HomeScreen());
      // }
      // case PageConst.ProfilePage: {
      //   if (args is UserEntity) {
      //     return routeBuilder(ProfileScreen(currentUser: args));
      //   } else {
      //     return routeBuilder(NoPageFound());
      //   }
      // }
      case PageConst.RegisterPage: {
        return routeBuilder(SignUpScreen());
      }
      default: {
        NoPageFound();
      }
    }
  }
}

dynamic routeBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class NoPageFound extends StatelessWidget {
  const NoPageFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page not found"),
      ),
      body: Center(child: Text("Page not found"),),
    );
  }
}