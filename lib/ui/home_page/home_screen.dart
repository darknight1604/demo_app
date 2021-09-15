import 'package:demo_app/ui/common/bottom_navigation_bar_widget.dart';
import 'package:demo_app/ui/common/common_util.dart';
import 'package:flutter/material.dart';

import 'body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CommonUtil.createAppBar(context, isBackable: false),
      body: Body(),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
