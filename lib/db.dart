import 'package:postgres/postgres.dart';

class DB {
  late final PostgreSQLConnection _connection;

  static Future<DB> connect({
    required String host,
    required String user,
    required String pass,
    required String name,
  }) async {
    const _port = 5432;

    final db = DB();
    db._connection = PostgreSQLConnection(
      host,
      _port,
      name,
      username: user,
      password: pass,
    );
    await db._connection.open();
    return db;
  }

  Future<List<dynamic>> query(String sql,
      {Map<String, dynamic>? values}) async {
    try {
      return await _connection.mappedResultsQuery(sql,
          substitutionValues: values);
    } catch (e) {
      return Future.value([]);
    }
  }
}
