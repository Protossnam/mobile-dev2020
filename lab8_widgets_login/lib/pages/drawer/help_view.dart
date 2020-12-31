import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'help_view_model.dart';

class HelpView extends StatelessWidget {
  static final routeName = '/help';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HelpViewModel>.reactive(
      builder: (context, model, _) => Scaffold(
          appBar: AppBar(title: Text(model.title)),
          body: SingleChildScrollView(
            child: Column(
              children: [],
            ),
          )),
      viewModelBuilder: () => HelpViewModel(),
    );
  }
}
