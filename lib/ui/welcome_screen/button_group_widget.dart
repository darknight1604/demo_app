import 'package:demo_app/helper/custom_text.dart';
import 'package:demo_app/route/route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ButtonGroupWidget extends StatelessWidget {
  const ButtonGroupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          createButton(
            'button.login'.tr(),
            Colors.black,
            Colors.white,
            () {
              _handleNavigateLogin(context);
            },
            borderSide: BorderSide(
              width: 2.0,
              color: Colors.black,
            ),
          ),
          createButton(
            'button.register'.tr(),
            Colors.white,
            Colors.black,
            () {
              _handleNavigateRegister(context);
            },
          ),
        ],
      ),
    );
  }

  void _handleNavigateRegister(context) {
    Navigator.of(context).pushNamed(RouteGenerator.registerPage);
  }

  void _handleNavigateLogin(context) {
    Navigator.of(context).pushNamed(RouteGenerator.loginPage);
  }

  Widget createButton(
      String name, Color textColor, Color backgroundColor, Function onPress,
      {BorderSide? borderSide}) {
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      fixedSize: Size(167, 52),
      primary: backgroundColor,
      side: borderSide,
    );

    return Flexible(
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: () {
          onPress();
        },
        child: CustomText.createBoldText(
          name,
          size: 13,
          color: textColor,
        ),
      ),
    );
  }
}
