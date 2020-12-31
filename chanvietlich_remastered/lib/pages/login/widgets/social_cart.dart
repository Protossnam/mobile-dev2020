import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

import '../login_view_model.dart';

class SocialCard extends ViewModelWidget<LoginViewModel> {
  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return Visibility(
      visible: model.viewType == LoginViewType.signup,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: RaisedButton.icon(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.facebook,
                color: Colors.white,
              ),
              label: Text(
                '',
                //'Facebook',
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0xff1346b4),
            ),
          ),
          Expanded(
            child: RaisedButton.icon(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.google,
                color: Colors.white,
              ),
              label: Text(
                '',
                //'Google',
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0xffff4645),
            ),
          ),
          Expanded(
            child: RaisedButton.icon(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.phoneAlt,
                color: Colors.white,
              ),
              label: Text(
                '',
                //'Phone',
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0xff5190e6),
            ),
          ),
        ],
      ),
    );
  }
}
