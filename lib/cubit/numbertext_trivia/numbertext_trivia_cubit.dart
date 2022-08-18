import 'package:bloc_demo/cubit/db/database.dart';
import 'package:bloc_demo/cubit/numbertext_trivia/numbertext_trivia_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberTextCubit extends Cubit<NumberTextTriviaState>{
  AppDatabase? database;

  NumberTextCubit():super(NumberTextTriviaInitState()){
    initDB();
  }
  Future<void> initDB() async {
    $FloorAppDatabase.databaseBuilder("app_database.db").build().then((value) {
      database = value;
      getUsers();
    });
  }

  Future<void> getUsers() async {
    await database?.numberTextDao.getAllData().then((value) {
      if (value.isNotEmpty) {
        emit(NumberTextTriviaSuccessState(value));
      } else {
        emit(NumberTextTriviaStopLoadingState());
        emit(NumberTextTriviaEmptyState());
      }
    });
  }

}