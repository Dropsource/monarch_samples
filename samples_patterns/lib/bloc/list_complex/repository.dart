import 'dart:async';
import 'dart:math';

import 'item.dart';

abstract class Repository {
  Future<List<Item>> fetchItems();

  Future<void> deleteItem(String id);
}

class RepositoryImpl implements Repository {
  final _random = Random();

  int _randomRange(int min, int max) => min + _random.nextInt(max - min);

  @override
  Future<List<Item>> fetchItems() async {
    await Future<void>.delayed(Duration(seconds: _randomRange(1, 5)));
    return List.of(_generateItemsList(10));
  }

  List<Item> _generateItemsList(int length) {
    return List.generate(
      length,
      (index) => Item(id: '$index', value: 'Item $index'),
    );
  }

  @override
  Future<void> deleteItem(String id) async {
    await Future<void>.delayed(Duration(seconds: _randomRange(1, 5)));
  }
}
