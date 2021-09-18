import 'package:flutter/material.dart';

class CommonUtil {
  static AppBar createAppBar(context, {bool isBackable = true}) {
    return AppBar(
      leading: isBackable
          ? IconButton(
              icon: Image.asset("images/back.png"),
              onPressed: () => Navigator.pop(
                context,
              ),
            )
          : Container(),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  static Widget createTextFormField(
      EdgeInsetsGeometry padding, TextEditingController controller,
      {dynamic? validatorFunction, String? hintText, bool isPassword = false}) {
    OutlineInputBorder outlineBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 2.0),
    );
    OutlineInputBorder errorOutlineBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2.0),
    );
    return Padding(
      padding: padding,
      child: TextFormField(
        obscureText: isPassword,
        enableSuggestions: !isPassword,
        autocorrect: !isPassword,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: outlineBorder,
          focusedBorder: outlineBorder,
          focusedErrorBorder: errorOutlineBorder,
          errorBorder: errorOutlineBorder,
          hintText: hintText,
        ),
        validator: validatorFunction,
      ),
    );
  }

  static Future<void> showSnackBar(context, String title,
      {int? secondDuration}) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
        ),
        duration: Duration(
          seconds:
              secondDuration != null && secondDuration > 0 ? secondDuration : 2,
        ),
      ),
    );
  }
}
