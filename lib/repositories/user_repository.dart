import 'package:fornecedores/models/user.dart';
import 'package:sqflite/sqflite.dart';

class UserRepository {  
  static const String _tableName = 'users';

  Future<Database> _db() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/fornecedores.db';

    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''          
          CREATE TABLE $_tableName (
            id TEXT PRIMARY KEY,
            name TEXT NOT NULL,
            login TEXT NOT NULL,
            password TEXT NOT NULL
          )
        ''');
      },
    );        
  }

  Future<void> create(User user, String password) async {
    final database = await _db();

    final data = {
      ...user.toMap(),      
      'password': password,
    };

    await database.insert(
      _tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await database.close();
  }

  Future<User?> readOne(String login) async {
    final database = await _db();

    final data = await database.query(
      _tableName,
      where: 'login = ?',
      whereArgs: [login],
    );

    await database.close();

    if (data.isNotEmpty) {
      return User.fromMap(data.first);
    } else {
      return null;
    }
  }

  Future<User?> readOneWithPassword(String login, String password) async {
    final database = await _db();

    final data = await database.query(
      _tableName,
      where: 'login = ? and password = ?',
      whereArgs: [login, password],
    );

    await database.close();

    if (data.isNotEmpty) {
      return User.fromMap(data.first);
    } else {
      return null;
    }
  }

  Future<void> update(User user) async {
    final database = await _db();

    await database.update(
      _tableName,
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );

    await database.close();
  }

  Future<void> delete(String id) async {
    final database = await _db();

    await database.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    await database.close();
  }

  Future<List<User>> readAll() async {
    final database = await _db();
    
    final data = await database.query(_tableName);

    await database.close();

    return data.map((e) => User.fromMap(e)).toList();
  }
}