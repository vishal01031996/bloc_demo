abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeStopLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  String message;

  HomeErrorState(this.message);
}