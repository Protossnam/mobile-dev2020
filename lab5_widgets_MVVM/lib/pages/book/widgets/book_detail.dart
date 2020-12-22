import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../book_view_model.dart';
import 'package:stacked/stacked.dart';

class BookDetail extends ViewModelWidget<BookViewModel> {
  @override
  Widget build(BuildContext context, BookViewModel model) {
    return Visibility(
      visible: model.viewType == BookViewType.detail,
      child: Column(
        children: [
          Text(model?.currentItem?.title ?? 'N/A'),
          Text(model?.currentItem?.desc ?? 'N/A'),
          Text(model?.currentItem?.auth ?? 'N/A'),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlineButton.icon(
                onPressed: () => model.currentItem = null,
                icon: Icon(Icons.close),
                label: Text('Close'),
              ),
              OutlineButton.icon(
                onPressed: () => model.deleteItem(),
                icon: Icon(Icons.delete),
                label: Text('Delete'),
              ),
              OutlineButton.icon(
                onPressed: () {},
                icon: Icon(Icons.edit),
                label: Text('Edit'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
