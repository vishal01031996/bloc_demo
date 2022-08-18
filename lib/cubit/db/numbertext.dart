import 'package:floor/floor.dart';

@entity
class NumberText {
  @primaryKey
  int? index;
  int? number;
  String? text;

  NumberText({this.index, required this.number, required this.text});
}
