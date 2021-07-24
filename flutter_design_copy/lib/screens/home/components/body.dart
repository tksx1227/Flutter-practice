import 'package:flutter/material.dart';
import 'package:flutter_design_copy/constants.dart';
import 'package:flutter_design_copy/screens/home/components/recomend_plants.dart';
import 'package:flutter_design_copy/screens/home/components/featured_plants.dart';
import 'package:flutter_design_copy/screens/home/components/title_with_more_btn.dart';
import 'package:flutter_design_copy/screens/home/components/header_with_searchbox.dart';

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
          RecomendPlants(),
          TitleWithMoreBtn(title: "Featured Plants", press: () {}),
          FeaturedPlants(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
