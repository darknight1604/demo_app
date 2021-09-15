import 'package:demo_app/helper/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.createBoldText(
          'title.whatNewToday'.tr().toUpperCase(),
          size: 13,
        ),
        SizedBox(
          height: 20,
        ),
        Image.asset(
          'images/news.png',
          fit: BoxFit.fitWidth,
        )
      ],
    );
  }
}
