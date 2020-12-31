import 'package:stacked/stacked.dart';

import '../../pages/todo/todo_repository.dart';
import 'todo_model.dart';

class TodoViewModel extends BaseViewModel {
  final title = 'Todo';

  final TodoRepository repo = TodoRepository.instance;

  /// Todo list (private)
  var _items = <Todo>[];

  /// Todo list getter
  List<Todo> get items => _items;

  void init() {
    return reloadItems();
  }

  void reloadItems() {
    setBusy(true);
    // _items = await repo.items();
    // setBusy(false);
    repo.items().then((value) {
      _items = value;
      setBusy(false);
    });
  }

  void addItem() {
    var item = Todo();
    var timestamp = DateTime.now();

    item.title = timestamp.toString();
    item.desc = timestamp.toIso8601String();

    repo.insert(item).then((value) {
      reloadItems();
    });
  }
}
