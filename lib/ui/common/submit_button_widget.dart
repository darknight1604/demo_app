import 'package:flutter/material.dart';

class SubmitButtonWidget extends StatefulWidget {
  final Function onPress;
  final Widget child;
  final EdgeInsetsGeometry padding;
  const SubmitButtonWidget({
    Key? key,
    required this.onPress,
    required this.child,
    required this.padding,
  }) : super(key: key);

  @override
  _SubmitButtonWidgetState createState() => _SubmitButtonWidgetState();
}

class _SubmitButtonWidgetState extends State<SubmitButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          minimumSize: Size(double.infinity, 52),
        ),
        onPressed: () {
          //hide keyboard when submit
          if (FocusManager.instance.primaryFocus != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
          widget.onPress();
        },
        child: widget.child,
      ),
    );
  }
}
