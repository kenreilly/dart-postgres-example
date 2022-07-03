class Item {
  Item({required this.name, this.description});

  final String name;
  final String? description;

  static Item fromDynamicMap(Map<String, dynamic> map) =>
      Item(name: map['name'], description: map['description']);
}
