import 'dart:convert';

import 'package:flutter/material.dart';

class Todo {
  final String id = UniqueKey()
      .hashCode
      .toUnsigned(20)
      .toRadixString(16)
      .padLeft(5)
      .toString();
  String title;
  String desc;
  bool isDeleted = false;
  Todo({
    this.title,
    this.desc,
    this.isDeleted,
  });

  static String get tableName => 'Todo';

  static String get createTableSQL =>
      'CREATE TABLE $tableName(`id` TEXT PRIMARY KEY,'
      ' `title` TEXT,'
      ' `desc` TEXT,'
      ' `isDeleted` INTEGER DEFAULT 0)';

  static List<Todo> fromList(List<Map<String, dynamic>> query) {
    List<Todo> items = [];
    for (Map map in query) {
      items.add(Todo.fromMap(map));
    }
    return items;
  }

  Todo copyWith({
    String title,
    String desc,
    bool isDeleted,
  }) {
    return Todo(
      title: title ?? this.title,
      desc: desc ?? this.desc,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'desc': desc,
      'isDeleted': isDeleted,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Todo(
      title: map['title'],
      desc: map['desc'],
      isDeleted: map['isDeleted'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));

  @override
  String toString() =>
      'Todo(title: $title, desc: $desc, isDeleted: $isDeleted)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Todo &&
        o.title == title &&
        o.desc == desc &&
        o.isDeleted == isDeleted;
  }

  @override
  int get hashCode => title.hashCode ^ desc.hashCode ^ isDeleted.hashCode;
}
