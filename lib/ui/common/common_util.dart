import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

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

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'error.usernameEmpty'.tr();
    } else if (value.length < 4) {
      return 'error.usernameLengthMin'.tr();
    } else if (value.length > 10) {
      return 'error.usernameLengthMax'.tr();
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'error.passwordEmpty'.tr();
    } else if (value.length < 4) {
      return 'error.passwordLengthMin'.tr();
    } else if (value.length > 10) {
      return 'error.passwordLengthMax'.tr();
    }
    return null;
  }
}
