import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../book_view_model.dart';
import 'package:stacked/stacked.dart';

class BookEdit extends ViewModelWidget<BookViewModel> {
  @override
  Widget build(BuildContext context, BookViewModel model) {
    return Visibility(
      visible: model.viewType == BookViewType.edit,
      child: Container(
        child: Form(
          child: Column(
            children: [
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlineButton.icon(
                    onPressed: () => model.currentItem = null,
                    icon: Icon(Icons.cancel),
                    label: Text('Cancel'),
                  ),
                  OutlineButton.icon(
                    onPressed: () => null,
                    icon: Icon(Icons.save),
                    label: Text('Save'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
