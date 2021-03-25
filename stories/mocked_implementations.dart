import 'package:monarch_samples/bloc/list_complex/item.dart';
import 'package:monarch_samples/bloc/list_complex/repository.dart';

class MockedRepository implements Repository {
  final Function onDelete;
  final Function onFetchItems;

  MockedRepository({this.onDelete, this.onFetchItems});

  @override
  Future<void> deleteItem(String id) {
    return onDelete();
  }

  @override
  Future<List<Item>> fetchItems() {
    return onFetchItems();
  }
}
