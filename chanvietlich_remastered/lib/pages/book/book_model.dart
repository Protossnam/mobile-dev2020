import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  Book({
    this.title,
    this.auth,
    this.desc,
  });

  // Cloud Store
  Future<dynamic> delete() async {
    // var _user = FirebaseAuth.instance.currentUser;
    // if (_user == null) return;
    final db = FirebaseFirestore.instance;
    return await db
        .collection('Book')
        .doc(id)
        .delete()
        .then((value) => print('Delete success!'));
  }

  Future<dynamic> save() async {
    // var _user = FirebaseAuth.instance.currentUser;
    // if (_user == null) return;
    final db = FirebaseFirestore.instance;
    return await db
        .collection('Book')
        .doc(id)
        .set(toMap(), SetOptions(merge: true));
  }

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

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Book(id: $id, title: $title, auth: $auth, desc: $desc)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Book &&
        o.id == id &&
        o.title == title &&
        o.auth == auth &&
        o.desc == desc;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ auth.hashCode ^ desc.hashCode;
  }
}
