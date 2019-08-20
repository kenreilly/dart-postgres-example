import 'package:meta/meta.dart';

class Item {

	Item({ @required this.name, this.description });

	String name;
	String description;

	static Item fromDynamicMap(Map<String, dynamic> map) =>
		Item(name: map['name'], description: map['description']);
}