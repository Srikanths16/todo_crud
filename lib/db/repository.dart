import 'package:crud/db/db_connection.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  late DatabaseConnection _databaseConnection;
  Repository() {
    _databaseConnection = DatabaseConnection();
  }
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }

  //insert Functon

  insertData(table, data) async {
    var connection = await database;
    return await connection?.insert(table, data);
  }

  //read
  readData(table) async {
    var connection = await database;
    return await connection?.query(table);
  }

  //read individual record by Id
  readDataById(table, itemId) async {
    var connection = await database;
    return await connection?.query(table, where: 'id=?', whereArgs: [itemId]);
  }

  //Update
  updateData(table, data) async {
    var connection = await database;
    return await connection
        ?.update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  //Delete
  deleteDataById(table, itemId) async {
    var connection = await database;
    return await connection?.rawDelete("delete from $table where id=$itemId");
  }
}
