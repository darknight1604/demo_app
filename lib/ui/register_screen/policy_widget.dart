part of 'body.dart';

class _PolicyWidget extends StatelessWidget {
  const _PolicyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = TextStyle(
      color: Colors.black,
      fontSize: 13.0,
      height: 1.5,
    );
    TextStyle linkStyle = TextStyle(
      height: 1.5,
      decoration: TextDecoration.underline,
    );
    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: <TextSpan>[
          TextSpan(text: 'title.policy'.tr()),
          TextSpan(
            text: 'title.termsOfService'.tr(),
            style: linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                processHyperlink(
                  context,
                  'title.termsOfService'.tr(),
                );
              },
          ),
          TextSpan(text: 'title.and'.tr()),
          TextSpan(
            text: 'title.privacyPolicy'.tr(),
            style: linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                processHyperlink(
                  context,
                  'title.privacyPolicy'.tr(),
                );
              },
          ),
        ],
      ),
    );
  }

  void processHyperlink(context, String hyperlink) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'title.processing'.tr(args: [hyperlink]),
        ),
      ),
    );
  }
}
