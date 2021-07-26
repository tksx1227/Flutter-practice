import 'package:flutter/material.dart';
import 'package:flutter_design_copy_2/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding / 2,
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
