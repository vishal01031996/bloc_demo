import 'package:bloc_demo/cubit/home_page.dart';
import 'package:bloc_demo/cubit/home_state.dart';
import 'package:bloc_demo/service/api_service.dart';
import 'package:bloc_demo/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitState());

  String text = "";
  String number1 = "";

  // int newnumber = 0;

  insertnumber(String number, String sum, int total) {
    if (sum.toString() == total.toString()) {
      emit(HomeLoadingState());
      try {
        ApiServices().insertNumber(number).then((value) async {
          if (value.data.found == true) {
            text = value.data.text.toString();
            number1 = value.data.number.toString();
            emit(HomeStopLoadingState());
          } else {
            emit(HomeErrorState("Unremarkable Number"));
          }
        });
      } catch (e) {
        emit(HomeErrorState(e.toString()));
      }
    } else {
      Utils.showToast("Wrong Answer");
    }
  }

  randomNumber() {
    emit(HomeLoadingState());
    try {
      ApiServices().randomnumber().then((value) {
        if (value.data.found == true) {
          text = value.data.text.toString();
          number1 = value.data.number.toString();
          emit(HomeStopLoadingState());
        } else {
          emit(HomeErrorState("Unremarkable Number"));
        }
      });
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
}
