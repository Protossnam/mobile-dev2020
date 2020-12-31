import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';

import 'book_model.dart';

enum BookViewType { list, detail, edit }

class BookViewModel extends BaseViewModel {
  final String title = 'Book';

  var _items = <Book>[];
  List<Book> get items => _items;

  var _currentItem;
  Book get currentItem => _currentItem;
  set currentItem(Book value) {
    _currentItem = value;
    if (value == null) {
      viewType = BookViewType.list;
    } else {
      viewType = BookViewType.detail;
    }
    notifyListeners();
  }

  var viewType = BookViewType.list;

  void init() {
    FirebaseFirestore.instance.collection('Book').snapshots().listen(
      (event) {
        _items = event.docs.map((e) => Book.fromMap(e.data())).toList();
        notifyListeners();
      },
    );
  }
}
