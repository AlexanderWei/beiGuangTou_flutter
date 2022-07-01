import 'package:flutter/material.dart';
import '../support_file/common_header.dart';

class MyListView extends StatelessWidget {
  MyListView({
    Key? key,
    required this.children,
    this.keyboardConfig,
    this.isScrollable = true,
  }) : super(key: key);

  final List<Widget> children;
  final KeyboardActionsConfig? keyboardConfig;
  bool isScrollable;

  @override
  Widget build(BuildContext context) {
    Widget contentView;

    if (keyboardConfig != null) {
      if (isScrollable == false) {
        contentView = KeyboardActions(
          tapOutsideBehavior: TapOutsideBehavior.translucentDismiss,
          config: keyboardConfig!,
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: children,
          ),
        );
      } else {
        contentView = KeyboardActions(
          tapOutsideBehavior: TapOutsideBehavior.translucentDismiss,
          config: keyboardConfig!,
          child: ListView(
            children: children,
          ),
        );
      }
    } else {
      if (isScrollable == false) {
        contentView = ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: children,
        );
      } else {
        contentView = ListView(
          children: children,
        );
      }
    }

    return contentView;
  }
}
