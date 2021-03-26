import 'package:monarch_samples/bloc/list_complex/item.dart';
import 'package:monarch_samples/bloc/list_complex/repository.dart';

class MockedRepository implements Repository {
  @override
  Future<List<Item>> fetchItems() {
    return Future.delayed(
        Duration(seconds: 1),
        () => const [
              Item(id: '1', value: 'Fetched'),
              Item(id: '2', value: 'From'),
              Item(id: '3', value: 'Mock'),
              Item(id: '4', value: 'Repository'),
            ]);
  }

  @override
  Future<void> deleteItem(String id) {
    return Future.value(null);
  }
}
