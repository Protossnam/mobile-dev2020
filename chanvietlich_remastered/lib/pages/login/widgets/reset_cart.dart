import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_autocomplete_formfield/simple_autocomplete_formfield.dart';
import 'package:stacked/stacked.dart';

import '../../../pages/startup/startup_view.dart';
import '../../../widgets/busy_button.dart';
import '../login_view_model.dart';

class ResetCard extends ViewModelWidget<LoginViewModel> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return Visibility(
      visible: model.viewType == LoginViewType.reset,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Reset password',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.left,
                ),
              ),
              Divider(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: SimpleAutocompleteFormField<String>(
                  key: Key('email'),
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'Your email',
                    labelText: 'Email',
                  ),
                  maxSuggestions: 5,
                  autovalidate: true,
                  itemBuilder: (context, item) => Padding(
                    padding: EdgeInsets.only(
                        top: 8, right: 8, bottom: 8, left: 40),
                    child: Text(item),
                  ),
                  onSearch: (search) async {
                    var result = search.isEmpty
                        ? model.emails
                        : model.emails
                            .where((value) => value.contains(search))
                            .toList();
                    return result;
                  },
                  itemFromString: (string) {
                    if (model.emails.isEmpty) return string;
                    var result = model.emails.singleWhere(
                      (value) => value == string,
                      orElse: () => string,
                    );
                    return result;
                  },
                  onFieldSubmitted: (value) => model.email = value,
                  onSaved: (value) => model.email = value,
                  onChanged: (value) => model.email = value,
                  validator: (value) =>
                      value == null ? 'Email cannot be emppty' : null,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BusyButton(
                    busy: model.isBusy,
                    title: 'Reset password',
                    onPressed: () async => await model.reset().then(
                          (value) => Navigator.of(context)
                              .pushReplacementNamed(
                                  StartupView.routeName),
                        ),
                  ),
                  FlatButton(
                    onPressed: () =>
                        model.viewType = LoginViewType.login,
                    child: Text(
                      'Login',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .apply(color: Colors.lightBlue),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
