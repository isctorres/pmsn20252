import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MoviesDatabase {

    static final nameDB = "MOVIESDB";
    static final versionDB = 1;

    static Database? _database;
    Future<Database?> get database async {
        if(_database != null ) return _database;
        return _database = await _initDatabase();
    }
    
    Future<Database?> _initDatabase() async {
        Directory folder = await getApplicationDocumentsDirectory();
        String pathDB = join(folder.path,nameDB);  //"$folder/$nameDB";
        return openDatabase(
            pathDB,
            version: versionDB,
            onCreate: createTables    
        );
    }
  
    FutureOr<void> createTables(Database db, int version) {
        String query = '''
            CREATE TABLE tblMovies(
                idMovie INTEGER PRIMARY KEY,
                nameMovie VARCHAR(50),
                time CHAR(3),
                dateRelease CHAR(10)
            )
        ''';
        db.execute(query);
    }

    Future<int> INSERT(String table, Map<String,dynamic> data) async {
        var con = await database;
        return con!.insert(table,data);
    }

    Future<int> UPDATE(String table, Map<String,dynamic> data) async {
        var con = await database;
        return con!.update(table,data,where: 'idMovie = ?', whereArgs: [data['idMovie']]);
    }

    Future<int> DELETE(String table, int id) async {
        var con = await database;
        return con!.delete(table, where: 'idMovie = ?', whereArgs: [id]);
    }
    SELECT(){}
}