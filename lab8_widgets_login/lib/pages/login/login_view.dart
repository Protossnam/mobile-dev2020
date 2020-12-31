import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../app/app_auth.dart';
import '../../pages/startup/startup_view.dart';
import '../../pages/drawer/privacy_policy_view.dart';
import '../../pages/drawer/terms_of_service_view.dart';
import 'login_view_model.dart';
import 'widgets/login_card.dart';
import 'widgets/reset_cart.dart';
import 'widgets/signup_card.dart';

class LoginView extends StatelessWidget {
  static final routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, _) => AppAuth.instance.appUser != null
          ? StartupView()
          : Scaffold(
              backgroundColor: Color(0xFFE7F3EC),
              body: IgnorePointer(
                ignoring: model.isBusy,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16.0),
                          width: 500,
                          child: Card(
                            elevation: 5,
                            child: new Column(
                              children: [
                                SignupCard(),
                                ResetCard(),
                                LoginCard(),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible:
                              model.viewType != LoginViewType.signup,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an account?'),
                              FlatButton(
                                onPressed: () => model.viewType =
                                    LoginViewType.signup,
                                child: Text(
                                  'Sign up now.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .apply(color: Colors.lightBlue),
                                ),
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible:
                              model.viewType == LoginViewType.signup,
                          child: Padding(
                            padding: EdgeInsets.all(30),
                            child: Row(
                              children: [
                                Flexible(
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black87),
                                      text:
                                          'By registering you agree to our ',
                                      children: [
                                        TextSpan(
                                          text: 'Terms of service',
                                          recognizer:
                                              TapGestureRecognizer()
                                                ..onTap = () {
                                                  Navigator.of(context)
                                                      .push(
                                                    MaterialPageRoute(
                                                        builder:
                                                            (context) {
                                                          return TermsOfServiceView();
                                                        },
                                                        fullscreenDialog:
                                                            true),
                                                  );
                                                },
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                        TextSpan(text: ', and '),
                                        TextSpan(
                                          text: 'Privacy policy.',
                                          recognizer:
                                              TapGestureRecognizer()
                                                ..onTap = () {
                                                  Navigator.of(context)
                                                      .push(
                                                    MaterialPageRoute(
                                                        builder:
                                                            (context) {
                                                          return PrivacyPolicyView();
                                                        },
                                                        fullscreenDialog:
                                                            true),
                                                  );
                                                },
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
