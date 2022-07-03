import 'dart:async';
import 'package:dart_postgres_example/db.dart';
import 'package:dart_postgres_example/models/item.dart';

abstract class API {
  static late DB _db;

  static Future<void> init({
    required String host,
    required String user,
    required String pass,
    required String name,
  }) async =>
      _db = await DB.connect(
        name: name,
        host: host,
        user: user,
        pass: pass,
      );

  static Future<List<dynamic>> index() async {
    final items = <Map<String, dynamic>>[];
    dynamic result = await _db.query('select id, name from items');
    for (final row in result) {
      items.add(row['items']);
    }
    return items;
  }

  static Future<Map<String, dynamic>> addItem(dynamic data) async {
    final item = Item.fromDynamicMap(data);
    const sql =
        'insert into items (name, description) VALUES (@name, @description) RETURNING id';
    final params = <String, dynamic>{
      'name': item.name,
      'description': item.description
    };
    dynamic result = await _db.query(sql, values: params);

    return {'id': result[0]['items']['id']};
  }
}
