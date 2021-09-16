import 'package:demo_app/helper/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class NewsWidget extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  const NewsWidget({
    Key? key,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.createBoldText(
            'title.whatNewToday'.tr().toUpperCase(),
            size: 13,
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'images/news.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
