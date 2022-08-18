import 'package:bloc_demo/cubit/appbar/my_appbar.dart';
import 'package:bloc_demo/cubit/home/home_cubit.dart';
import 'package:bloc_demo/cubit/home/home_page.dart';
import 'package:bloc_demo/cubit/numbertext_trivia/numbertext_trivia.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;


HomeCubit homeCubit = HomeCubit();

void main() {
  runApp(bloc.MultiBlocProvider(providers: [
    bloc.BlocProvider(
      create: (context) => homeCubit,
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        defaultTransition: Transition.zoom,
        getPages: [
          GetPage(name: "/myappbar", page: () => MyAppBar()),
          GetPage(name: "/homepage", page: () => HomePage()),
          GetPage(name: "/numbertext", page: () => NumberTextTrivia())
        ],
        home: const MyAppBar(),
      ),
    );
  }
}
