import 'package:flutter/material.dart';
import 'package:flutter_design_copy/constants.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    Key? key,
    required this.title,
    required this.coutry,
    required this.price,
  }) : super(key: key);

  final String title, coutry;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title\n",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextSpan(
                  text: "$coutry",
                  style: TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            "\$$price",
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: kPrimaryColor,
                ),
          ),
        ],
      ),
    );
  }
}
