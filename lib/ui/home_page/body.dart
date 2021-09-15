import 'package:demo_app/helper/constants.dart';
import 'package:demo_app/helper/custom_text.dart';
import 'package:demo_app/ui/common/user_information_widget.dart';
import 'package:demo_app/ui/home_page/news_widget.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.createNormalText(
            'title.discover'.tr(),
            size: 36,
            fontFamily: Constants.COMFORTAA,
          ),
          SizedBox(
            height: 30.0,
          ),
          NewsWidget(),
          UserInformationWidget(
            image: 'avatar-2.png',
            aboveText: 'Ridhwan Nordin',
            belowText: '@ridzjcob',
            padding: EdgeInsets.only(top: 15.0),
          ),
        ],
      ),
    );
  }
}
