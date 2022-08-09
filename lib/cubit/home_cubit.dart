import 'package:bloc_demo/cubit/home_state.dart';
import 'package:bloc_demo/service/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitState());

  String text = "";
  String number1 = "";
  int newnumber = 0;

  insertnumber(String number) {
    newnumber = int.parse(number);
    if (newnumber > 5) {
      newnumber = newnumber - 5;
    } else {
      newnumber = 0;
    }
    emit(HomeLoadingState());
    try {
      ApiServices().insertNumber(newnumber.toString()).then((value) async {
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
