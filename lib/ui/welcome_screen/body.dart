import 'package:demo_app/ui/common/user_information_widget.dart';
import 'package:demo_app/ui/welcome_screen/button_group_widget.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserInformationWidget(
              image: 'avatar-1.png',
              aboveText: 'Pawel Czerwinski',
              belowText: '@pawel_czerwinski',
              padding: EdgeInsets.all(10.0),
            ),
            ButtonGroupWidget(),
          ],
        ),
      ],
    );
  }
}
