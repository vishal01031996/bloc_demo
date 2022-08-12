abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeStopLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  String message;

  HomeErrorState(this.message);
}

class HomeDialogueState extends HomeState {}

class NumberSuccessApiState extends HomeState {
  String text;

  NumberSuccessApiState(this.text);
}
