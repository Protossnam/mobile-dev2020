import 'dart:convert';

import 'package:flutter/foundation.dart';

class Item {
  final String title;
  final String subtitle;
  final num price;
  final List<String> images;
  Item({
    this.title,
    this.subtitle,
    this.price,
    this.images,
  });

  Item copyWith({
    String title,
    String subtitle,
    num price,
    List<String> images,
  }) {
    return Item(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      price: price ?? this.price,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'price': price,
      'images': images,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Item(
      title: map['title'],
      subtitle: map['subtitle'],
      price: map['price'],
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(title: $title, subtitle: $subtitle, price: $price, images: $images)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Item &&
        o.title == title &&
        o.subtitle == subtitle &&
        o.price == price &&
        listEquals(o.images, images);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        subtitle.hashCode ^
        price.hashCode ^
        images.hashCode;
  }
}
