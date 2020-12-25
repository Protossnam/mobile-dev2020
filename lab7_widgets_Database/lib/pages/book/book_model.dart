import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Book extends Equatable {
  final String id = UniqueKey()
      .hashCode
      .toUnsigned(20)
      .toRadixString(16)
      .padLeft(5, '0')
      .toString();

  final String title;
  final String auth;
  final String desc;

  Book(this.title, this.auth, this.desc);

  @override
  List<Object> get props => [id, title, auth, desc];
}

/// Singleton
class BookStore {
  // Create a private constructor
  BookStore._init();
  static final BookStore _instance = BookStore._init();
  static BookStore get instance => _instance;

  var _items = [
    Book('Stranger in a Strange Land', 'Robert A. Heinlein', 'lorem'),
    Book('Foundation', 'Issac Asimov', 'lorem'),
    Book('Fahrenheit 451', 'Ray Bradbury', 'lorem'),
  ];

  List<Book> get items => _items;
  // List<Book> get items {
  //   return _items;
  // }

  set items(value) {
    _items = value;
  }
}
