import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_commerce_app/Features/account/presentation/views/account_view.dart';
import 'package:flutter_commerce_app/Features/auth_cubit/auth_cubit.dart';
import 'package:flutter_commerce_app/Features/auth/register.dart';
import 'package:flutter_commerce_app/Features/lay_out_screen/home.dart';
import 'package:flutter_commerce_app/Features/lay_out_screen/lay0ut_cubit/layout_cubit.dart';
import 'package:flutter_commerce_app/shared_preferences/shared_pref.dart';
import 'package:flutter_commerce_app/Features/splash_screen/splash_screen.dart';

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
          BlocProvider(create: (context) => LayOutCubit()..getBannersData()),
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
