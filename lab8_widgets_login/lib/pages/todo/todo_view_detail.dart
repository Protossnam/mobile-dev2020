import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../pages/todo/todo_view_model.dart';
import 'todo_model.dart';

class TodoViewDetail extends ViewModelWidget<Todo> {
  final TodoViewModel model;

  TodoViewDetail({@required this.model});
  @override
  Widget build(BuildContext context, Todo item) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail: ${item.title}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).pop(true);
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
