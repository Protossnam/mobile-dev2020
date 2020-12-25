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
    _items = BookStore.instance.items;
    notifyListeners();
  }

  void addItem() {
    var timestamp = DateTime.now();
    var item = Book(
      timestamp.toString(),
      'Nam',
      timestamp.toIso8601String(),
    );
    _items.add(item);
    notifyListeners();
  }

  void deleteItem() {
    _items.remove(_currentItem);
    currentItem = null;
  }
}
