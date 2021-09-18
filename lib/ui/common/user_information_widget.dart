import 'package:demo_app/helper/custom_text.dart';
import 'package:flutter/material.dart';

class UserInformationWidget extends StatelessWidget {
  final String image;
  final String aboveText;
  final String belowText;
  final EdgeInsetsGeometry padding;
  final Widget rightChild;

  const UserInformationWidget({
    Key? key,
    required this.image,
    required this.aboveText,
    required this.belowText,
    required this.padding,
    required this.rightChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 167,
            child: Row(
              children: [
                Image.asset(
                  'images/' + image,
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.createBoldText(
                      aboveText,
                      size: 13,
                      fontWeight: FontWeight.w700,
                    ),
                    CustomText.createNormalText(
                      belowText,
                      size: 11,
                    ),
                  ],
                ),
              ],
            ),
          ),
          rightChild,
        ],
      ),
    );
  }
}
