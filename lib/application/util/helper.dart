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

  /** ⌨️ 键盘设置 START */

  // KeyboardActionsConfig
  static KeyboardActionsConfig getKeyboardActionsConfig(
      BuildContext context, List<FocusNode> list) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: List.generate(
        list.length,
        (index) => KeyboardActionsItem(
          focusNode: list[index],
          toolbarButtons: [
            (node) {
              return GestureDetector(
                onTap: () {
                  node.unfocus();
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.close),
                ),
              );
            },
          ],
        ),
      ),
    );
  }

  // KeyboardActionsItem
  static keyboardItem(
      {required FocusNode focusNode,
      String inputType = "",
      required VoidCallback onTap}) {
    if (inputType == "search") {
      return KeyboardActionsItem(
        focusNode: focusNode,
        toolbarButtons: [
          (node) {
            return GestureDetector(
              onTap: onTap,
              child: Container(
                color: Colors.black,
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "搜索",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ],
      );
    }

    return KeyboardActionsItem(
      focusNode: focusNode,
      toolbarButtons: [
        (node) {
          return GestureDetector(
            onTap: onTap,
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.all(8.0),
              child: Text(
                "DONE",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ],
    );
  }
  /** ⌨️ 键盘设置 END */
}
