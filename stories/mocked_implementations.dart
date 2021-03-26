import '../lib/bloc/list_complex/item.dart';
import '../lib/bloc/list_complex/repository.dart';

class MockedRepository implements Repository {
  @override
  Future<void> deleteItem(String id) {
    return Future.value(null);
  }

  @override
  Future<List<Item>> fetchItems() {
    return Future.value([]);
  }
}
