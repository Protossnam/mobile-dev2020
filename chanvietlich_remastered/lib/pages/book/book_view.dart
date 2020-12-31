import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'book_model.dart';
import 'book_view_detail.dart';
import 'book_view_edit.dart';
import 'book_view_model.dart';

class BookView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text(model.title)),
        body: ListView.builder(
          itemCount: model.items.length,
          itemBuilder: (context, i) {
            var item = model.items[i];
            return Card(
              child: ListTile(
                leading: Icon(Icons.book),
                title: Text(item?.title ?? 'N/A'),
                subtitle: Text(item?.desc ?? 'N/A'),
                trailing: Text(item?.id ?? 'N/A'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return BookViewDetail(item: item);
                      },
                    ),
                  ).then((value) {
                    if (value is bool && value == true)
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return BookViewEdit(item: item);
                          },
                          fullscreenDialog: true,
                        ),
                        // Animation
                      ).then((value) {
                        if (value is bool && value == true)
                          model.notifyListeners();
                      });
                  });
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return BookViewEdit(item: Book(), isTemporaryId: true);
                },
                fullscreenDialog: true,
              ),
            ).then((value) {
              if (value is bool && value == true)
                model.notifyListeners();
            });
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
      ),
      viewModelBuilder: () => BookViewModel(),
    );
  }
}
