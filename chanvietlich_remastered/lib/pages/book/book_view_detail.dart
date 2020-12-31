import 'package:flutter/material.dart';

import 'book_model.dart';

class BookViewDetail extends StatelessWidget {
  final Book item;
  BookViewDetail({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail: ${item?.title ?? 'N/A'}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pop(true),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Book Info',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.right,
              ),
              Divider(),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Book title',
                  labelText: 'Title',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                initialValue: item?.title ?? '',
                readOnly: true,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Book description',
                  labelText: 'Description',
                ),
                initialValue: item?.desc ?? '',
                readOnly: true,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Book author',
                  labelText: 'Author(s)',
                ),
                initialValue: item?.auth ?? '',
                readOnly: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
