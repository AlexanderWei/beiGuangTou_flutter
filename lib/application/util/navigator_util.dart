import 'package:flutter/material.dart';
import 'package:flutter_application/application/support_file/common_header.dart';

class NavigatorUtil {
  static pushTo({required BuildContext context, required Widget function}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return function;
    }));
  }

  static pop({required BuildContext context}) {
    Navigator.pop(context);
  }

  static popToRoot({
    required BuildContext context,
    required Widget function,
  }) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => function),
      (route) => route == null,
    );
  }
}
