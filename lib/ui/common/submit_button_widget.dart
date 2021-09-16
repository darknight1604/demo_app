import 'package:flutter/material.dart';

class SubmitButtonWidget extends StatefulWidget {
  final Function onPress;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final BorderSide? borderSide;
  final Color backgroundColor;
  final bool isHideKeyboard;

  const SubmitButtonWidget({
    Key? key,
    required this.onPress,
    required this.child,
    required this.padding,
    this.backgroundColor = Colors.black,
    this.isHideKeyboard = true,
    this.borderSide,
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
          primary: widget.backgroundColor,
          minimumSize: Size(double.infinity, 52),
          side: widget.borderSide,
        ),
        onPressed: () {
          //hide keyboard when submit
          if (widget.isHideKeyboard &&
              FocusManager.instance.primaryFocus != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
          widget.onPress();
        },
        child: widget.child,
      ),
    );
  }
}
