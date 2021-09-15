import 'package:demo_app/blocs/login_bloc/login_bloc.dart';
import 'package:demo_app/repositories/user_repository.dart';
import 'package:demo_app/ui/common/common_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CommonUtil.createAppBar(context),
      body: BlocProvider(
        create: (context) => LoginBloc(
          userRepository: RepositoryProvider.of<UserRepository>(context),
        ),
        child: Body(),
      ),
    );
  }
}
