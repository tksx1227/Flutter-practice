import 'package:flutter/material.dart';
import 'package:flutter_design_copy/screens/home/components/header_with_searchbox.dart';
import 'package:flutter_design_copy/screens/home/components/title_with_more_btn.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provite us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    // It enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(
            title: "Recomended",
            press: () {},
          ),
        ],
      ),
    );
  }
}
