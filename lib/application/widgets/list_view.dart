import 'package:flutter/material.dart';
import '../third_party/keyboard_actions/keyboard_actions.dart';

class MyListView extends StatelessWidget {
  MyListView({
    Key? key,
    required this.children,
    this.keyboardItems,
    this.isScrollable = true,
    this.dismissKeyboardTapOutside = true,
  }) : super(key: key);

  final List<Widget> children;
  bool isScrollable;

  List<KeyboardActionsItem>? keyboardItems;
  bool dismissKeyboardTapOutside;

  @override
  Widget build(BuildContext context) {
    return KeyboardActions(
      tapOutsideBehavior: (dismissKeyboardTapOutside == true
          ? TapOutsideBehavior.translucentDismiss
          : TapOutsideBehavior.none),
      config: KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        keyboardBarColor: Colors.grey[200],
        actions: keyboardItems ?? [],
      ),
      child: ListView(
        physics: (isScrollable == true
            ? null
            : const NeverScrollableScrollPhysics()),
        children: children,
      ),
    );
  }
}
