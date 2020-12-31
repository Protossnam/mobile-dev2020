import 'package:flutter/material.dart';

import 'book_model.dart';

class BookViewEdit extends StatelessWidget {
  final Book item;
  final bool isTemporaryId;
  final _formKey = GlobalKey<FormState>();

  BookViewEdit({
    Key key,
    @required this.item,
    this.isTemporaryId = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          !isTemporaryId
              ? 'Edit: ${item?.title ?? 'N/A'}'
              : 'New Item: ${item?.id ?? 'N/A'}',
        ),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
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
                  onChanged: (value) => item.title = value,
                  validator: (value) {
                    if (value.isEmpty)
                      return 'Book title cannot be emppty';
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Book description',
                    labelText: 'Description',
                  ),
                  initialValue: item?.desc ?? '',
                  onChanged: (value) => item.desc = value,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Book author',
                    labelText: 'Author(s)',
                  ),
                  initialValue: item?.auth ?? '',
                  onChanged: (value) => item.auth = value,
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: !isTemporaryId,
                      child: OutlineButton.icon(
                        onPressed: () {
                          item.delete().then((value) {
                            final snackBar = SnackBar(
                              content: Text('Item deleted!'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Navigator.of(context).pop(true);
                          });
                        },
                        icon: Icon(Icons.delete),
                        label: Text('Delete'),
                      ),
                    ),
                    OutlineButton.icon(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.cancel),
                      label: Text('Cancel'),
                    ),
                    OutlineButton.icon(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          item.save().then(
                                (value) => showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text('Saved!'),
                                    );
                                  },
                                ).then(
                                  (value) =>
                                      Navigator.of(context).pop(true),
                                ),
                              );
                        }
                      },
                      icon: Icon(Icons.save),
                      label: Text('Save'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
