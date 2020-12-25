import 'dart:convert' as convert;

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
    // setBusy(true);
    // Future.delayed(Duration(seconds: 5)).then(
    //   (value) {
    //     setBusy(false);
    //   },
    // );

    viewType = PhotoViewType.search;
  }

  void photoSearch([String keyword = 'hot girls']) {
    var apiKey = 'aa2285a42f92ef199f566e47dd153ba0';
    var urlStr =
        'https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=$apiKey&text=$keyword&format=json&nojsoncallback=1';
    var url = Uri.encodeFull(urlStr);
    //var response = await http.get(url);
    setBusy(true);
    http.get(url).then(
      (response) {
        var jsonResponse = convert.jsonDecode(response.body);
        var flickrPhoto = FlickrPhotoModel.fromMap(jsonResponse['photos']);

        _items = flickrPhoto.photos;
        // print(flickrPhoto.photos.length);

        viewType = PhotoViewType.list;
        setBusy(false);
      },
    );
  }
}
