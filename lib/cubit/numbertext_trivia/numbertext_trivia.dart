import 'package:bloc_demo/cubit/numbertext_trivia/numbertext_item.dart';
import 'package:bloc_demo/cubit/numbertext_trivia/numbertext_trivia_cubit.dart';
import 'package:bloc_demo/cubit/numbertext_trivia/numbertext_trivia_state.dart';
import 'package:bloc_demo/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class NumberTextTrivia extends StatefulWidget {
  const NumberTextTrivia({Key? key}) : super(key: key);

  @override
  State<NumberTextTrivia> createState() => _NumberTextTriviaState();
}

class _NumberTextTriviaState extends State<NumberTextTrivia> {
  NumberTextCubit numberTextCubit = NumberTextCubit();

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
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              BlocConsumer(
                bloc: numberTextCubit,
                builder: (context, state) {
                  if (state is NumberTextTriviaSuccessState) {
                    return ListView.builder(
                      itemCount: state.textlist.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return NumberTextItem(state.textlist[index]);
                      },
                    );
                  } else if (state is NumberTextTriviaEmptyState) {
                    return Container(
                      width: Get.width,
                      height: Get.height,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(24),
                              topLeft: Radius.circular(24))),
                      child: const Center(
                        child: Text(
                          "Data Not Found",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: Get.height / 1.7,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
                listener: (context, state) {
                  if (state is NumberTextTriviaLoadingState) {
                    Utils.showLoader(context);
                  } else if (state is NumberTextTriviaStopLoadingState) {
                    Utils.hideLoader(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
