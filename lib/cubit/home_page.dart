import 'dart:math';

import 'package:bloc_demo/cubit/home_cubit.dart';
import 'package:bloc_demo/cubit/home_state.dart';
import 'package:bloc_demo/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeCubit homeCubit = HomeCubit();
  TextEditingController numberController = TextEditingController();
  TextEditingController sumController = TextEditingController();
  int firstNumber = 0;
  int secondNumber = 0;

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
              const Text(
                "Enter The Number",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.activeBlue),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 130,
                height: 50,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(16)),
                child: TextField(
                  controller: numberController,
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  homeCubit.insertnumber(numberController.text.toString());
                },
                child: Container(
                  height: 40,
                  width: 80,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: const Color(0xFF1D343F),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()),
                  child: const Center(
                      child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  homeCubit.randomNumber();
                  numberController.clear();
                },
                child: Container(
                  height: 40,
                  width: 80,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: const Color(0xFF1D343F),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()),
                  child: const Center(
                      child: Text(
                    "Random",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
                ),
              ),
              BlocConsumer(
                bloc: homeCubit,
                listener: (context, state) {
                  if (state is HomeLoadingState) {
                    Utils.showLoader(context);
                  } else if (state is HomeStopLoadingState) {
                    Utils.hideLoader(context);
                  } else if (state is HomeErrorState) {
                    Utils.showToast(state.message);
                  } else if (state is HomeDialogueState) {
                    firstNumber = Random().nextInt(10);
                    secondNumber = Random().nextInt(10);
                    sumController.clear();
                    openDialoguebox();
                  }
                },
                buildWhen: (context, state) {
                  if (state is NumberSuccessApiState) {
                    return true;
                  } else {
                    return false;
                  }
                },
                builder: (context, state) {
                  if (state is NumberSuccessApiState) {
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
                            state.text,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.red),
                          ),
                        )
                      ],
                    );
                  } else {
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
                          child: const Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.red),
                          ),
                        )
                      ],
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void openDialoguebox() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Center(
                child: Text(
                  "Sum Of Two Numbers",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              content: SingleChildScrollView(
                child: SizedBox(
                  width: Get.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            "$firstNumber",
                            style: const TextStyle(
                                color: Colors.red, fontSize: 20),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "+",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "$secondNumber",
                            style: const TextStyle(
                                color: Colors.red, fontSize: 20),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "=",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 100,
                            height: 40,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(16)),
                            child: TextField(
                              controller: sumController,
                              textAlign: TextAlign.right,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          homeCubit.sumtwoNumber(sumController.text.toString(),
                              firstNumber, secondNumber);
                          Navigator.pop(context);
                          FocusScope.of(context).unfocus();
                        },
                        child: Container(
                          height: 40,
                          width: 80,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: const Color(0xFF1D343F),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all()),
                          child: const Center(
                              child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
