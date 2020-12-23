class Todo {
  String title;
  String desc;

  Todo(this.title, this.desc);
}

/// Singleton
class TodoStore {
  TodoStore._init();
  static final TodoStore _store = TodoStore._init();
  static TodoStore get instance => _store;

  var _items = [
    Todo('Lorem ipsum dolor sit amet',
        'consectetur adipiscing elit sed do eiusmod'),
    Todo('Cras et volutpat purus. Etiam augue est, porttitor sed ex ut',
        'mollis eleifend velit'),
    Todo('In hac habitasse platea dictumst',
        'Duis consequat lorem a feugiat gravida'),
  ];

  List<Todo> get items {
    return _items;
  }
}
