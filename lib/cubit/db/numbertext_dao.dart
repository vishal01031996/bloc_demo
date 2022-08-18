import 'package:bloc_demo/cubit/db/numbertext.dart';
import 'package:floor/floor.dart';

@dao
abstract class NumberTextDao {
  @Query('SELECT * FROM NumberText')
  Future<List<NumberText>> getAllData();

  @insert
  Future<void> insertData(NumberText numberText);
}
