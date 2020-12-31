import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'photo_view_model.dart';

class PhotoView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return ViewModelBuilder<PhotoViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(
          title: Text(model.title),
          actions: [
            model.viewType == PhotoViewType.list
                ? IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () =>
                        model.viewType = PhotoViewType.search)
                : SizedBox()
          ],
        ),
        body: Stack(
          children: [
            Visibility(
              visible: model.isBusy,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            Visibility(
              visible: model.viewType == PhotoViewType.list,
              child: GridView.builder(
                itemCount: model.items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 2 : 3),
                itemBuilder: (context, i) {
                  var item = model.items[i];
                  return Card(
                    child: GridTile(
                      child: Container(
                        child: Image.network(item.url()),
                      ),
                    ),
                  );
                },
              ),
            ),
            Visibility(
              visible: model.viewType == PhotoViewType.search &&
                  !model.isBusy,
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Type the keyword',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onChanged: (value) => model.keyword = value,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              model.photoSearch(model.keyword);
                            }
                          },
                          child: Text('Search'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => PhotoViewModel(),
    );
  }
}
