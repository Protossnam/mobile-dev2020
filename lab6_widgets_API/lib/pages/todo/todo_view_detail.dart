import 'package:flutter/material.dart';
import 'todo_view_model.dart';
import 'package:stacked/stacked.dart';

import 'todo_model.dart';

class TodoViewDetail extends ViewModelWidget<Todo> {
  final TodoViewModel model;

  TodoViewDetail({@required this.model});
  @override
  Widget build(BuildContext context, Todo item) {
    model.addListener(() {});
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail: ${item.title}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              item.title = 'ABC';
              model.notifyListeners();
            },
          )
        ],
      ),
      body: Column(
        children: [
          Text(item.title),
          Text(item.desc),
        ],
      ),
    );
  }
}
