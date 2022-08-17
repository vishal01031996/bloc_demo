import 'package:bloc_demo/cubit/home_cubit.dart';
import 'package:bloc_demo/cubit/home_page.dart';
import 'package:bloc_demo/cubit/multibloc/multi_bloc_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;

import 'cubit/multibloc/multi_bloc.dart';

HomeCubit homeCubit = HomeCubit();
MultiBlocCubit multiBlocCubit = MultiBlocCubit();

void main() {
  runApp(bloc.MultiBlocProvider(providers: [
    bloc.BlocProvider(
      create: (context) => homeCubit,
    ),
    bloc.BlocProvider(
      create: (context) => multiBlocCubit,
    )
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
        initialRoute: "/multibloc",
        getPages: [
          GetPage(name: "/multibloc", page: () => MultiBloc()),
          GetPage(name: "/homepage", page: () => HomePage()),
        ],
        home: const MultiBloc(),
      ),
    );
  }
}
