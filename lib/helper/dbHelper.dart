import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teknolojirenault/models/products.dart';

class DatabaseHelper {
  Database? _database;

  String _ProductsTable = "Products";
  String _columnID = "id";
  String _columnTitle = "title";
  String _columnDescription = "description";

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    String dbPath = join(await getDatabasesPath(), "Products.db");
    var ProductsDb = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return ProductsDb;
  }

  void createDb(Database db, int version) async {
    await db.execute(
        "Create table $_ProductsTable($_columnID integer primary key, $_columnTitle text, $_columnDescription text)");
  }

  //Crud Methods
  Future<List<Products>> getAllProducts() async {
    Database? db = await this.database;
    var result = await db?.query("$_ProductsTable");
    return List.generate(result!.length, (i) {
      return Products.fromMap(result[i]);
    });
  }

  Future<int?> insert(Products note) async {
    Database? db = await this.database;
    var result = await db?.insert("$_ProductsTable", note.toMap());
    return result;
  }

  Future<int?> delete(int id) async {
    Database? db = await this.database;
    var result = await db?.rawDelete("delete from $_ProductsTable where id=$id");
    return result;
  }

  Future<int?> update(Products note) async {
    Database? db = await this.database;
    var result = await db?.update("$_ProductsTable", note.toMap(),
        where: "id=?", whereArgs: [note.id]);
    return result;
  }
}