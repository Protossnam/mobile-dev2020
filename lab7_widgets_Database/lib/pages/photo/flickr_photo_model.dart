import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'photo_model.dart';

class FlickrPhotoModel {
  final List<Photo> photos;
  FlickrPhotoModel({
    this.photos,
  });

  FlickrPhotoModel copyWith({
    List<Photo> photos,
  }) {
    return FlickrPhotoModel(
      photos: photos ?? this.photos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'photo': photos?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory FlickrPhotoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FlickrPhotoModel(
      photos: List<Photo>.from(map['photo']?.map((x) => Photo.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FlickrPhotoModel.fromJson(String source) =>
      FlickrPhotoModel.fromMap(json.decode(source));

  @override
  String toString() => 'FlickrPhotoModel(photos: $photos)'; // $photo

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FlickrPhotoModel && listEquals(o.photos, photos);
  }

  @override
  int get hashCode => photos.hashCode;
}
