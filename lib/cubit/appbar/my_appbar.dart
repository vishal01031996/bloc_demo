import 'package:bloc_demo/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D343F),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(54),
          child: AppBar(
            backgroundColor: const Color(0xFF1D343F),
            title: const Center(
              child: Text(
                "Bloc_Demo",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.context?.read<HomeCubit>().randomNumber();
                    Get.offNamed("/homepage");
                  },
                  icon: const Icon(Icons.notification_important_sharp))
            ],
          )),
    );
  }
}
