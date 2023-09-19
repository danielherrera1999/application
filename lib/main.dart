import 'package:application/features/presentation/cubit/task/create/create_cubit.dart';
import 'package:application/features/presentation/cubit/user/auth/auth_cubit.dart';
import 'package:application/features/presentation/cubit/user/credentials/credentials_cubit.dart';
import 'package:application/features/presentation/pages/main/main_screen.dart';
import 'package:application/features/presentation/pages/signIn/signin.screen.dart';
import 'package:application/on_generate_route.dart';
import 'package:application/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart' as di;
import 'dart:io';



Future main() async {
  // await dotenv.load(fileName: "assets/.env", mergeWith: {
  //   'API_URL': 'http://192.168.1.30:8001/api/',
  // });
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<AuthCubit>()..appStarted(context)),
        BlocProvider(create: (_) => di.sl<CredentialsCubit>()),
        BlocProvider(create: (_) => di.sl<TaskCreateCubit>()),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      onGenerateRoute: OnGenerateRoute.route,
      initialRoute: "/",
      routes: {
        "/" : (context) {
          return BlocBuilder<AuthCubit, AuthState>(builder: ((context, authstate){
            if (authstate is Authenticated) {
              return MainScreen(uid: authstate.uid);
            } else {
              return SignInScreen();
            }
          }),);
        }
      },
    )
    );
  }
}
