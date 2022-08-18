import 'dart:async';

import 'package:bloc_demo/cubit/db/numbertext.dart';
import 'package:bloc_demo/cubit/db/numbertext_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [NumberText])
abstract class AppDatabase extends FloorDatabase {
  NumberTextDao get numberTextDao;
}