import '../todo/todo_repository.dart';
import 'package:stacked/stacked.dart';

import 'todo_model.dart';

class TodoViewModel extends BaseViewModel {
  final title = 'Todo';

  final TodoRepository repo = TodoRepository.instance;

  /// Todo list (private)
  var _items = <Todo>[];

  /// Todo list getter
  List<Todo> get items => _items;

  Future init() async {
    return reloadItems();
  }

  Future reloadItems() async {
    setBusy(true);
    _items = await repo.items();
    setBusy(false);

    // if used keyword "then" -- void reloadItems() and NO keyword "async"
    // return repo.items().then((value) {
    //   _items = value;
    //   setBusy(false);
    // });
  }

  void addItems() {
    var item = Todo();
    var timestamp = DateTime.now();

    item.title = timestamp.toString();
    item.desc = timestamp.toIso8601String();

    //setBusy(true);
    repo.insert(item).then((value) {
      reloadItems();
      //setBusy(false);
    });
  }
}
