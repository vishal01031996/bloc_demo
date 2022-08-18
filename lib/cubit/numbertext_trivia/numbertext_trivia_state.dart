
import 'package:bloc_demo/cubit/db/numbertext.dart';

abstract class NumberTextTriviaState {}

class NumberTextTriviaInitState extends NumberTextTriviaState {}

class NumberTextTriviaLoadingState extends NumberTextTriviaState {}

class NumberTextTriviaStopLoadingState extends NumberTextTriviaState {}

class NumberTextTriviaEmptyState extends NumberTextTriviaState {}

class NumberTextTriviaSuccessState extends NumberTextTriviaState {
  List<NumberText> textlist;

  NumberTextTriviaSuccessState(this.textlist);
}
