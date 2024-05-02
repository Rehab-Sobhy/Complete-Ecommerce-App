import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_commerce_app/account/presentation/views/account_view.dart';
import 'package:flutter_commerce_app/auth/auth_cubit/auth_cubit.dart';
import 'package:flutter_commerce_app/auth/register.dart';
import 'package:flutter_commerce_app/home_screen/home.dart';
import 'package:flutter_commerce_app/lay0ut_cubit/layout_cubit.dart';
import 'package:flutter_commerce_app/shared_preferences/shared_pref.dart';
import 'package:flutter_commerce_app/splash_screen/splash_screen.dart';

import 'shared/bloc_observe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CachNetwork.cachIntialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(create: (context) => LayOutCubit()..getBannarData()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
