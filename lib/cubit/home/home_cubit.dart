import 'package:bloc_demo/cubit/db/database.dart';
import 'package:bloc_demo/cubit/db/numbertext.dart';
import 'package:bloc_demo/cubit/home/home_state.dart';
import 'package:bloc_demo/service/api_service.dart';
import 'package:bloc_demo/utils/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';

class HomeCubit extends bloc.Cubit<HomeState> {
  HomeCubit() : super(HomeInitState());

  String text = "";
  int newnumber = 0;
  int total = 0;
  int number = 0;
  AppDatabase? database;

  insertnumber(String number) {
    if (number.isNotEmpty) {
      newnumber = int.parse(number);
      if (newnumber > 5) {
        newnumber = newnumber - 5;
      } else {
        newnumber = 0;
      }
      emit(HomeDialogueState());
    } else {
      Utils.showToast("Please Enter Number");
    }
  }

  sumtwoNumber(String sum, int firstNumber, int secondnumber) {
    total = firstNumber + secondnumber;
    if (sum.toString() == total.toString()) {
      emit(HomeLoadingState());
      try {
        ApiServices().insertNumber(newnumber.toString()).then((value) async {
          if (value.data.found == true) {
            text = value.data.text.toString();
            emit(HomeStopLoadingState());
            emit(NumberSuccessApiState(text));
          } else {
            emit(HomeErrorState("Unremarkable Number"));
          }
        });
      } catch (e) {
        emit(HomeErrorState(e.toString()));
      }
    } else {
      Utils.showToast("Wrong Answer");
      emit(HomeDialogueState());
    }
  }

  randomNumber() {
    emit(HomeLoadingState());
    try {
      ApiServices().randomnumber().then((value) {
        if (value.data.found == true) {
          text = value.data.text.toString();
          number = value.data.number!;
          print(">>>${text}");
          print("<<<${number}");
          var numberTrivia = NumberText(number: number, text: text.toString());
          insertData(numberTrivia);
          emit(HomeStopLoadingState());
          emit(NumberSuccessApiState(text));
        } else {
          emit(HomeErrorState("Unremarkable Number"));
        }
      });
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }

  Future<void> insertData(NumberText numberText) async {
    database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    await database?.numberTextDao.insertData(numberText);
    print("===${numberText.text}");
    Get.toNamed("/numbertext");
  }
}
