import 'package:demo_app/helper/roboto_text.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String str = 'Pawel Czerwinski';
    String str2 = '@pawel_czerwinski';
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Image.asset(
              'images/brand.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Image.asset(
                    'images/avatar-1.png',
                  ),
                  Column(
                    children: [
                      RobotoText.createBoldText(
                        str,
                        size: 13,
                        fontWeight: FontWeight.w700,
                      ),
                      RobotoText.createNormalText(
                        str2,
                        size: 11,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _ButtonGroupWidget(),
          ],
        ),
      ],
    );
  }
}

class _ButtonGroupWidget extends StatelessWidget {
  const _ButtonGroupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          createButton(
            'title.login'.tr(),
            Colors.black,
            Colors.white,
            borderSide: BorderSide(
              width: 2.0,
              color: Colors.black,
            ),
          ),
          createButton('title.register'.tr(), Colors.white, Colors.black),
        ],
      ),
    );
  }

  Widget createButton(String name, Color textColor, Color backgroundColor,
      {BorderSide? borderSide}) {
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      fixedSize: Size(167, 52),
      primary: backgroundColor,
      side: borderSide,
    );

    return Flexible(
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: () {},
        child: RobotoText.createBoldText(
          name,
          size: 13,
          color: textColor,
        ),
      ),
    );
  }
}
