import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopping_application/model/plan.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  final _dbName = 'Plan.db';
  final _dbVersion = 1;
  final tableName = 'PlanDetail';
  final columnId = 'ID';
  final columnAmount = 'Amount';
  final columnFirstEMI = 'FirstEmi';
  final columnNineEMI = 'NineEmi';
  final columnEleEMI = 'ElevenEMI';
  final columnTotalPurchase = 'TotalPurchase';
  final columnSavings = 'Savings';

  DataBaseHelper._privateConstructor();
  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await instantiateDatabase();
      return _database;
    }
  }

  instantiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(path,
        version: _dbVersion, onCreate: oncreateTable);
  }

  Future<void> oncreateTable(Database db, int version) {
    return db.execute('''
    CREATE TABLE $tableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnAmount TEXT,
      $columnFirstEMI TEXT,
      $columnNineEMI TEXT ,
      $columnEleEMI TEXT,
      $columnTotalPurchase TEXT,
      $columnSavings TEXT
      )
      ''');
    // return db.execute(
    //     "CREATE TABLE $tableName ( $columnId INTEGER PRIMARY KEY AUTOINCREMENT,$columnAmount TEXT, $columnFirstEMI TEXT, $columnNineEMI TEXT, $columnEleEMI TEXT, $columnTotalPurchase TEXT, $columnSavings TEXT) ");
  }

  Future<int> insertData(PlanDetailModel planDetailModel) async {
    try {
      Database db = await database;
      return await db.insert(tableName, planDetailModel.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      print('error saving dta');
      print(e);
    }
  }

  Future<List<PlanDetailModel>> getTask() async {
    final List<Map<String, dynamic>> getAllTasks =
        await _database.query(tableName, orderBy: '$columnId DESC');
    print('length= ${getAllTasks.length}');
    return List.generate(getAllTasks.length, (index) {
      return PlanDetailModel(
          id: getAllTasks[index][columnId],
          amount: getAllTasks[index][columnAmount],
          firstEmi: getAllTasks[index][columnFirstEMI],
          nineEMI: getAllTasks[index][columnNineEMI],
          elevenEMI: getAllTasks[index][columnEleEMI],
          totalPurchase: getAllTasks[index][columnTotalPurchase],
          savings: getAllTasks[index][columnSavings]);
    });
  }

  Future<dynamic> getSpecifiedData(id) async {
    Database db = await database;
    print(id);
    var result =
        await db.query(tableName, where: "$columnId= ?", whereArgs: [id]);

    PlanDetailModel planDetailModel = PlanDetailModel.fromMap(result[id]);
    return planDetailModel;
  }
}
