import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../pages/todo/todo_view_model.dart';
import 'todo_model.dart';

class TodoViewEdit extends ViewModelWidget<Todo> {
  final TodoViewModel model;

  TodoViewEdit({@required this.model});
  @override
  Widget build(BuildContext context, Todo item) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit: ${item.title}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              item.title = 'ABC';
              model.notifyListeners();
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.title),
          Text(item.desc),
        ],
      ),
    );
  }
}
