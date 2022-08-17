import 'package:bloc_demo/cubit/home_cubit.dart';
import 'package:bloc_demo/cubit/multibloc/multi_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class MultiBlocCubit extends Cubit<MultiBlocState> {
  MultiBlocCubit() : super(MultiBlocInitState());

  random() {
    emit(MultiBlocLoadingState());
    Get.context?.read<HomeCubit>().randomNumber();
    // print(">>>${text}");
    emit(MultiBlocStopLoadingState());
    // emit(MultiBlocCompleteState(text));
  }

  randomValue(String text) {
    print("####${text}");

    emit(MultiBlocCompleteState(text));
  }
}
