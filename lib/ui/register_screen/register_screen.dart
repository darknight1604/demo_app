import 'package:demo_app/blocs/register_bloc/register_bloc.dart';
import 'package:demo_app/repositories/user_repository.dart';
import 'package:demo_app/ui/common/common_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CommonUtil.createAppBar(context),
      body: BlocProvider(
        create: (context) => RegisterBloc(
          userRepository: RepositoryProvider.of<UserRepository>(context),
        ),
        child: Body(),
      ),
    );
  }
}
