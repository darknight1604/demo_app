part of 'body.dart';

class _LoginFormWidget extends StatefulWidget {
  const _LoginFormWidget({Key? key}) : super(key: key);

  @override
  __LoginFormWidgetState createState() => __LoginFormWidgetState();
}

class __LoginFormWidgetState extends State<_LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          await CommonUtil.showSnackBar(context, 'title.loginSuccess'.tr());
          await Future.delayed(Duration(milliseconds: 500));
          Navigator.of(context).popAndPushNamed(RouteGenerator.homePage);
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
              validatorFunction: CommonUtil.validateUsername,
            ),
            CommonUtil.createTextFormField(
              const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              passwordController,
              hintText: 'hintText.password'.tr(),
              isPassword: true,
              validatorFunction: CommonUtil.validatePassword,
            ),
            SubmitButtonWidget(
              onPress: () {
                //validate data
                if (_formKey.currentState!.validate()) {
                  context.read<LoginBloc>().add(
                        LoginRequest(
                          username: usernameController.text,
                          password: passwordController.text,
                        ),
                      );
                }
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return CircularProgressIndicator();
                  }
                  return CustomText.createBoldText(
                    'button.login'.tr(),
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
}
