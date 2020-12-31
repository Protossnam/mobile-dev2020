import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'settings_view_model.dart';

class SettingsView extends StatelessWidget {
  static final routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      builder: (context, model, _) => Scaffold(
          appBar: AppBar(title: Text(model.title)),
          body: SingleChildScrollView(
            child: Column(
              children: [],
            ),
          )),
      viewModelBuilder: () => SettingsViewModel(),
    );
  }
}
