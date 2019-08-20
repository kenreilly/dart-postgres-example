import 'dart:async';
import 'package:dart_postgres_example/db.dart';
import 'package:dart_postgres_example/models/item.dart';

abstract class API { 

	static DB _db;

	static init(Map<String, dynamic> env) async =>
		_db = await DB.connect(env);

	static Future<List<dynamic>> index() async {

		List<Map<String, dynamic>> items = [];
		dynamic result = await _db.query('select id, name from items');
		for (final row in result) { items.add(row['items']); }
		return items;
	}

	static Future<Map<String, dynamic>> addItem(dynamic data) async {

		Item item = Item.fromDynamicMap(data);
		String sql = "insert into items (name, description) VALUES (@name, @description) RETURNING id";
		Map<String, dynamic> params = { "name": item.name, "description": item.description };
		dynamic result = await _db.query(sql, values: params);

		return { "id": result[0]['items']['id'] };
	}
}