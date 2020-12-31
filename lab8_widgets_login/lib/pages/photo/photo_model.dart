import 'dart:convert';

import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final String id;
  final String secret;
  final String server;
  final String title;
  Photo({
    this.id,
    this.secret,
    this.server,
    this.title,
  });

  Photo copyWith({
    String id,
    String secret,
    String server,
    String title,
  }) {
    return Photo(
      id: id ?? this.id,
      secret: secret ?? this.secret,
      server: server ?? this.server,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'secret': secret,
      'server': server,
      'title': title,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Photo(
      id: map['id'],
      secret: map['secret'],
      server: map['server'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) =>
      Photo.fromMap(json.decode(source));

  String url([String size = 'c']) =>
      'https://live.staticflickr.com/$server/$id\_$secret\_$size.jpg';

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, secret, server, title];
}
