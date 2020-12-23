import 'package:flutter/material.dart';
import '../book/widgets/book_detail.dart';
import '../book/widgets/book_edit.dart';
import '../book/widgets/book_list.dart';
import 'book_view_model.dart';
import 'package:stacked/stacked.dart';

class BookView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text(model.title)),
        // body: Center(
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text(model.favorite.toString(),
        //           style: Theme.of(context).textTheme.headline6),
        //       IconButton(
        //           icon: Icon(
        //             Icons.favorite,
        //             color: Colors.redAccent,
        //           ),
        //           onPressed: () => model.favoriteClick())
        //     ],
        //   ),
        // ),
        body: Stack(
          children: [
            BookList(),
            BookDetail(),
            BookEdit(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => model.addItem(),
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
      viewModelBuilder: () => BookViewModel(),
    );
  }
}
