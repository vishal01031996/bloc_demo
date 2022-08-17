import 'package:bloc_demo/cubit/multibloc/multi_bloc_cubit.dart';
import 'package:bloc_demo/cubit/multibloc/multi_bloc_state.dart';
import 'package:bloc_demo/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class MultiBloc extends StatefulWidget {
  const MultiBloc({Key? key}) : super(key: key);

  @override
  State<MultiBloc> createState() => _MultiBlocState();
}

class _MultiBlocState extends State<MultiBloc> {
  MultiBlocCubit multiBlocCubit = MultiBlocCubit();

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
                    multiBlocCubit.random();
                  },
                  icon: const Icon(Icons.notification_important_sharp))
            ],
          )),
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(24), topLeft: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 18,
              ),
              BlocConsumer(
                bloc: multiBlocCubit,
                listener: (context, state) {
                  if (state is MultiBlocLoadingState) {
                    Utils.showLoader(context);
                  } else if (state is MultiBlocStopLoadingState) {
                    Utils.hideLoader(context);
                  } else if (state is MultiBlocErrorState) {
                    Utils.showToast(state.message);
                  }
                },
                buildWhen: (context, state) {
                  if (state is MultiBlocCompleteState) {
                    return true;
                  } else {
                    return false;
                  }
                },
                builder: (context, state) {
                  if (state is MultiBlocCompleteState) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "OutPut",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: CupertinoColors.activeBlue),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: Get.width,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Hello",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.red),
                          ),
                        )
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
