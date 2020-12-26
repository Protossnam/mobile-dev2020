import 'package:cloud_firestore/cloud_firestore.dart';

import '../book/book_model.dart';
import 'package:stacked/stacked.dart';

enum BookViewType { list, detail, edit }

class BookViewModel extends BaseViewModel {
  final String title = 'Book';

  // int favorite = 0;

  // void favoriteClick() {
  //   favorite++;
  //   notifyListeners();
  // }

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

  void addItem() {
    var timestamp = DateTime.now();
    var item = Book();
    item.title = timestamp.toString();
    item.auth = 'Nam';
    item.save();
    // _items.add(item);
    // notifyListeners();
  }

  Future<dynamic> deleteItem() async {
    _items.remove(_currentItem);
    var d = await currentItem.delete();
    currentItem = null;
    return d;
  }
}
