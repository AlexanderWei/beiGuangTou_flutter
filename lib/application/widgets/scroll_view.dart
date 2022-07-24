import 'package:flutter/material.dart';
import '../third_party/keyboard_actions/keyboard_actions.dart';

class MyScrollView extends StatelessWidget {
  MyScrollView({
    Key? key,
    required this.children,
    this.keyboardItems,
    this.isScrollable = true,
    this.dismissKeyboardTapOutside = true,
    this.nextFocus = true,
  }) : super(key: key);

  final List<Widget> children;
  bool isScrollable;

  List<KeyboardActionsItem>? keyboardItems;
  bool dismissKeyboardTapOutside;
  bool nextFocus;

  @override
  Widget build(BuildContext context) {
    return KeyboardActions(
      tapOutsideBehavior: (dismissKeyboardTapOutside == true
          ? TapOutsideBehavior.translucentDismiss
          : TapOutsideBehavior.none),
      config: KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        keyboardBarColor: Colors.grey[200],
        nextFocus: nextFocus,
        actions: keyboardItems ?? [],
      ),
      child: SingleChildScrollView(
        physics: (isScrollable == true
            ? null
            : const NeverScrollableScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
