import 'package:stacked/stacked.dart';

import 'todo_model.dart';

class TodoViewModel extends BaseViewModel {
  final title = 'Todo';

  /// Todo list (private)
  var _items;

  /// Todo list getter
  List<Todo> get items => _items;

  void init() {
    // Load data to items
    _items = TodoStore.instance.items;

    // Update View
    notifyListeners();
  }
}
