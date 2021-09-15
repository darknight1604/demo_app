part of 'body.dart';

class _RegisterFormWidget extends StatefulWidget {
  const _RegisterFormWidget({Key? key}) : super(key: key);

  @override
  __RegisterFormWidgetState createState() => __RegisterFormWidgetState();
}

class __RegisterFormWidgetState extends State<_RegisterFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) async {
        if (state is SignUpSuccess) {
          await CommonUtil.showSnackBar(context, 'title.signUpSuccess'.tr());
          Navigator.of(context).popAndPushNamed(RouteGenerator.loginPage);
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CommonUtil.createTextFormField(
              const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              usernameController,
              hintText: 'hintText.username'.tr(),
              validatorFunction: validateUsername,
            ),
            CommonUtil.createTextFormField(
              const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              passwordController,
              hintText: 'hintText.password'.tr(),
              isPassword: true,
              validatorFunction: validatePassword,
            ),
            CommonUtil.createTextFormField(
              const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              confirmPasswordController,
              hintText: 'hintText.confirmPassword'.tr(),
              validatorFunction: validateConfirmPassword,
              isPassword: true,
            ),
            SubmitButtonWidget(
              onPress: () {
                //validate data
                if (_formKey.currentState!.validate()) {
                  context.read<RegisterBloc>().add(
                        SignUpRequest(
                          username: usernameController.text,
                          password: passwordController.text,
                        ),
                      );
                }
              },
              child: BlocBuilder<RegisterBloc, RegisterState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return CircularProgressIndicator();
                  }
                  return CustomText.createBoldText(
                    'button.signUp'.tr(),
                    size: 13,
                    color: Colors.white,
                  );
                },
              ),
              padding: const EdgeInsets.only(top: 10.0),
            ),
          ],
        ),
      ),
    );
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'error.usernameEmpty'.tr();
    } else if (value.length < 4) {
      return 'error.usernameLengthMin'.tr();
    } else if (value.length > 10) {
      return 'error.usernameLengthMax'.tr();
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'error.passwordEmpty'.tr();
    } else if (value.length < 4) {
      return 'error.passwordLengthMin'.tr();
    } else if (value.length > 10) {
      return 'error.passwordLengthMax'.tr();
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'error.confirmPasswordEmpty'.tr();
    } else if (confirmPasswordController.text != passwordController.text) {
      return 'error.confirmPasswordNotMatch'.tr();
    }
    return null;
  }
}
