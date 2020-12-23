import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';

import 'package:stacked/stacked.dart';

import 'todo_model.dart';
import 'todo_view_model.dart';
import 'todo_view_detail.dart';

class TodoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TodoViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text(model.title)),
        body: ListView.builder(
          itemCount: model.items.length,
          itemBuilder: (context, i) {
            // i - index
            var item = model.items[i];
            return Card(
              child: ListTile(
                title: Text(item.title),
                subtitle: Text(item.desc),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return Provider<Todo>.value(
                          value: item,
                          child: TodoViewDetail(
                            model: null,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      viewModelBuilder: () => TodoViewModel(),
    );
  }
}
