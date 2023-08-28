import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_practice/core/api/api_client.dart';
import 'package:test_practice/core/api/api_constants.dart';
import 'package:test_practice/di/get_it.config.dart';
import 'package:test_practice/di/get_it.dart';
import 'package:test_practice/presentation/cubits/auth/auth_cubit.dart';
import 'package:test_practice/presentation/routes/app_router.dart';

void main() async{
   getIt.init();
  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthCubit()..checkAuth(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
