abstract class MultiBlocState {}

class MultiBlocInitState extends MultiBlocState {}

class MultiBlocLoadingState extends MultiBlocState {}

class MultiBlocStopLoadingState extends MultiBlocState {}

class MultiBlocErrorState extends MultiBlocState {
  String message;

  MultiBlocErrorState(this.message);
}

class MultiBlocCompleteState extends MultiBlocState {
  String text;

  MultiBlocCompleteState(this.text);
}
