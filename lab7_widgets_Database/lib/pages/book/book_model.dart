import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Book {
  String _id = UniqueKey()
      .hashCode
      .toUnsigned(20)
      .toRadixString(16)
      .padLeft(5, '0')
      .toString();
  String get id => _id;

  String title;
  String auth;
  String desc;

  Future<dynamic> delete() async {
    final db = FirebaseFirestore.instance;
    return await db
        .collection('Book')
        .doc(id)
        .delete()
        .then((value) => print('Delete success!'));
  }

  Future<dynamic> save() async {
    final db = FirebaseFirestore.instance;
    return await db
        .collection('Book')
        .doc(id)
        .set(toMap(), SetOptions(merge: true));
  }

  Book({
    this.title,
    this.auth,
    this.desc,
  });

  Book copyWith({
    String id,
    String title,
    String auth,
    String desc,
  }) {
    return Book(
      title: title ?? this.title,
      auth: auth ?? this.auth,
      desc: desc ?? this.desc,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'auth': auth,
      'desc': desc,
    };
  }

  Book.fromMap(Map<String, dynamic> map)
      : _id = map['id'],
        title = map['title'],
        auth = map['auth'],
        desc = map['desc'];

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) => Book.fromMap(json.decode(source));
}

// /// Singleton
// class BookStore {
//   // Create a private constructor
//   BookStore._init();
//   static final BookStore _instance = BookStore._init();
//   static BookStore get instance => _instance;

//   var _items = [
//     Book('Stranger in a Strange Land', 'Robert A. Heinlein', 'lorem'),
//     Book('Foundation', 'Issac Asimov', 'lorem'),
//     Book('Fahrenheit 451', 'Ray Bradbury', 'lorem'),
//   ];

//   List<Book> get items => _items;
//   // List<Book> get items {
//   //   return _items;
//   // }

//   set items(value) {
//     _items = value;
//   }
// }
