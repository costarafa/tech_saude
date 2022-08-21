import 'package:path/path.dart';



class Connection{
  static Database _db;

  static Future <Database> get() async{

    if(_db == null){
      var path = join(await getDatabasesPath(), 'banco_glicemia');
      _db = await openDatabase(
        path,
        version:1,
        onCreate: (db, v){
          db.execute(createTable);
          db.execute(insert1);
        }
      );
    }
    return _db;
  }
}