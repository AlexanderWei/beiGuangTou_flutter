import 'package:flutter/material.dart';
import '../support_file/common_header.dart';

class Helper {
  /** 把普通的颜色值转换成 MaterialColor */
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch as Map<int, Color>);
  }

  static KeyboardActionsConfig getKeyboardActionsConfig(
      BuildContext context, List<KeyboardActionsItem>? actions,
      {bool nextFocus = true}) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: nextFocus,
      actions: actions,
    );
  }

  static showToast({
    required msg,
    ToastGravity gravity = ToastGravity.CENTER,
    int showTime = 1,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      gravity: gravity,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: showTime,
    );
  }

  static loadingHUD({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.transparent,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.black),
            ),
          ),
        );
      },
      barrierColor: Colors.transparent,
    );
  }

  static cancelHUD({required BuildContext context}) {
    Navigator.pop(context);
  }
}
