import 'package:flutter/material.dart';
import '../support_file/common_header.dart';

class KeyboardItem extends StatelessWidget {
  KeyboardItem({
    Key? key,
    required this.focusNode,
    this.inputType = "",
    required this.onTap,
  }) : super(key: key);

  FocusNode focusNode;
  String inputType;
  VoidCallback? onTap;

  getItem() {
    KeyboardActionsItem keyboardActionsItem;

    if (inputType == "search") {
      keyboardActionsItem = KeyboardActionsItem(
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

    keyboardActionsItem = KeyboardActionsItem(
      focusNode: focusNode,
      toolbarButtons: [
        (node) {
          return GestureDetector(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.only(right: 5),
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

    return keyboardActionsItem;
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
