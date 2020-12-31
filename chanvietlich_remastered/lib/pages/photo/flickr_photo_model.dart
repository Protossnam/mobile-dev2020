import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'photo_model.dart';

class FlickrPhoto {
  final List<Photo> photos;
  FlickrPhoto({
    this.photos,
  });

  FlickrPhoto copyWith({
    List<Photo> photos,
  }) {
    return FlickrPhoto(
      photos: photos ?? this.photos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'photo': photos?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory FlickrPhoto.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FlickrPhoto(
      photos:
          List<Photo>.from(map['photo']?.map((x) => Photo.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FlickrPhoto.fromJson(String source) =>
      FlickrPhoto.fromMap(json.decode(source));

  @override
  String toString() => 'FlickrPhoto(photo: $photos)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FlickrPhoto && listEquals(o.photos, photos);
  }

  @override
  int get hashCode => photos.hashCode;
}
