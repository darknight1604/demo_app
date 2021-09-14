import 'package:demo_app/ui/common/common_util.dart';
import 'package:flutter/material.dart';
import 'body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CommonUtil.createAppBar(context),
      body: Body(),
    );
  }
}
