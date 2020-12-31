import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'privacy_policy_view_model.dart';

class PrivacyPolicyView extends StatelessWidget {
  static final routeName = '/privacy-policy';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PrivacyPolicyViewModel>.reactive(
      builder: (context, model, _) => Scaffold(
          appBar: AppBar(title: Text(model.title)),
          body: SingleChildScrollView(
            child: Column(
              children: [],
            ),
          )),
      viewModelBuilder: () => PrivacyPolicyViewModel(),
    );
  }
}
