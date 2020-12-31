import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'terms_of_service_view_model.dart';

class TermsOfServiceView extends StatelessWidget {
  static final routeName = '/terms-of-service';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TermsOfServiceViewModel>.reactive(
      builder: (context, model, _) => Scaffold(
          appBar: AppBar(title: Text(model.title)),
          body: SingleChildScrollView(
            child: Column(
              children: [],
            ),
          )),
      viewModelBuilder: () => TermsOfServiceViewModel(),
    );
  }
}
