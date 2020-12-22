import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../book_view_model.dart';
import 'package:stacked/stacked.dart';

class BookList extends ViewModelWidget<BookViewModel> {
  @override
  Widget build(BuildContext context, BookViewModel model) {
    return Visibility(
      visible: model.viewType == BookViewType.list,
      child: ListView.builder(
        itemCount: model.items.length,
        itemBuilder: (context, index) {
          var item = model.items[index];
          return ListTile(
            leading: Icon(Icons.book),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item?.title ?? 'N/A'),
                Text(item?.auth ?? 'N/A'),
              ],
            ),
            subtitle: Text(item?.desc ?? 'N/A'),
            onTap: () => model.currentItem = item,
          );
        },
      ),
    );
  }
}
