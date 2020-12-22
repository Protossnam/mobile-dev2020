import 'package:flutter/material.dart';

class HeroView extends StatelessWidget {
  final String myTag;
  final Widget myChild;

  const HeroView(this.myTag, this.myChild);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Hero(
          tag: myTag,
          child: myChild,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
