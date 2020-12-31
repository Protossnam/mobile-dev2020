import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../pages/startup/startup_view.dart';
import '../../../widgets/busy_button.dart';
import '../login_view_model.dart';
import 'social_cart.dart';

class SignupCard extends ViewModelWidget<LoginViewModel> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return Visibility(
      visible: model.viewType == LoginViewType.signup,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Register account',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.left,
                ),
              ),
              Divider(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'Your email',
                    labelText: 'Email',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value.isEmpty) return 'Email cannot be emppty';
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: 'Your password',
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  onFieldSubmitted: (value) => model.signup().then(
                        (value) => Navigator.of(context)
                            .pushReplacementNamed(StartupView.routeName),
                      ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BusyButton(
                    busy: model.isBusy,
                    title: 'Signup',
                    onPressed: () async => await model.signup().then(
                          (value) => Navigator.of(context)
                              .pushReplacementNamed(
                                  StartupView.routeName),
                        ),
                  ),
                  FlatButton(
                    onPressed: () =>
                        model.viewType = LoginViewType.login,
                    child: Text(
                      'Have an account ?',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .apply(color: Colors.lightBlue),
                    ),
                  )
                ],
              ),
              SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Or signup with',
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(height: 40),
              SocialCard(),
            ],
          ),
        ),
      ),
    );
  }
}
