import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

import 'flickr_photo_model.dart';
import 'photo_model.dart';

enum PhotoViewType { list, search }

class PhotoViewModel extends BaseViewModel {
  final title = 'Photos';

  var _items = <Photo>[];
  List<Photo> get items => _items;

  // var searchTextEditingController = TextEditingController();
  var keyword = 'hot girls';

  var _viewType = PhotoViewType.list;
  PhotoViewType get viewType => _viewType;
  set viewType(value) {
    _viewType = value;
    notifyListeners();
  }

  void init() {
    viewType = PhotoViewType.search;
  }

  void photoSearch([String keyword = 'hot girls']) {
    var apiKey = '406d71063ad10d8e44ce289091632cd9';
    var urlStr =
        'https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=$apiKey&text=$keyword&format=json&nojsoncallback=1';
    var url = Uri.encodeFull(urlStr);
    setBusy(true);
    http.get(url).then(
      (response) {
        var jsonResponse = convert.jsonDecode(response.body);
        var flickrPhoto = FlickrPhoto.fromMap(jsonResponse['photos']);
        _items = flickrPhoto.photos;
        viewType = PhotoViewType.list;
        setBusy(false);
      },
    );
  }
}
