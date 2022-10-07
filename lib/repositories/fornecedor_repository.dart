import 'package:fornecedores/models/fornecedor.dart';
import 'package:sqflite/sqflite.dart';

class FornecedorRepository {
  static const String _tableName = 'fornecedor';

  Future<Database> _db() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/fornecedo.db';

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''          
          CREATE TABLE $_tableName (
            matricula TEXT PRIMARY KEY,
            nome TEXT NOT NULL,
            cidade TEXT NOT NULL,
            estado TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<void> create(Fornecedor fornecedor) async {
    final database = await _db();

    await database.insert(
      _tableName,
      fornecedor.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await database.close();
  }

  Future<List<Fornecedor>> readAll() async {
    final database = await _db();

    final data = await database.query(_tableName);

    await database.close();

    return data.map((e) => Fornecedor.fromMap(e)).toList();
  }

  Future<void> update(Fornecedor fornecedor) async {
    final database = await _db();

    await database.update(
      _tableName,
      fornecedor.toMap(),
      where: 'matricula = ?',
      whereArgs: [fornecedor.matricula],
    );

    await database.close();
  }

  Future<void> delete(String matricula) async {
    final database = await _db();

    await database.delete(
      _tableName,
      where: 'matricula = ?',
      whereArgs: [matricula],
    );

    await database.close();
  }
}
