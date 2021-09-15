import 'package:demo_app/blocs/register_bloc/register_bloc.dart';
import 'package:demo_app/helper/constants.dart';
import 'package:demo_app/helper/custom_text.dart';
import 'package:demo_app/route/route.dart';
import 'package:demo_app/ui/common/common_util.dart';
import 'package:demo_app/ui/common/submit_button_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'policy_widget.dart';
part 'register_form_widget.dart';

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
            'title.register'.tr(),
            size: 36,
            fontFamily: Constants.COMFORTAA,
          ),
          SizedBox(
            height: 30.0,
          ),
          _RegisterFormWidget(),
          SizedBox(
            height: 30.0,
          ),
          _PolicyWidget(),
        ],
      ),
    );
  }
}
