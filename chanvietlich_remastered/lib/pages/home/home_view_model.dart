import 'package:stacked/stacked.dart';

import 'item_model.dart';

class HomeViewModel extends BaseViewModel {
  final title = 'Home';
  final _slideImages = [
    Item.fromMap({
      'images': ['assets/slider1.jpg'],
      'title': 'Awesome Image 1',
      'subtitle': 'awesome image caption 1'
    }),
    Item.fromMap({
      'images': ['assets/slider2.jpg'],
      'title': 'Awesome Image 2',
      'subtitle': 'awesome image caption 2'
    }),
    Item.fromMap({
      'images': ['assets/slider3.jpg'],
      'title': 'Awesome Image 3',
      'subtitle': 'awesome image caption 3'
    }),
  ];
  List<Item> get slideImages => _slideImages;
  final _items = [
    Item.fromMap({
      'images': ['assets/hero1.jpg'],
      'title': 'Beautifu Cardigan',
      'subtitle': 'Beautifu cardigan caption',
      'price': 600
    }),
    Item.fromMap({
      'images': ['assets/hero2.jpg'],
      'title': 'Leather Bag',
      'subtitle': 'Leather bag caption',
      'price': 400
    }),
    Item.fromMap({
      'images': ['assets/hero3.jpg'],
      'title': 'White Beautiful Bag',
      'subtitle': 'White beautiful bag caption',
      'price': 350
    }),
  ];
  List<Item> get items => _items;

  void init() {
    notifyListeners();
  }
}
