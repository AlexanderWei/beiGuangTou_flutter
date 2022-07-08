import 'package:flutter/material.dart';
import '../support_file/common_header.dart';

class MyScrollView extends StatelessWidget {
  MyScrollView({
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
    Widget scrollView;

    if (keyboardConfig != null) {
      scrollView = KeyboardActions(
        tapOutsideBehavior: TapOutsideBehavior.translucentDismiss,
        config: keyboardConfig!,
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
    } else {
      scrollView = SingleChildScrollView(
        physics: (isScrollable == true
            ? null
            : const NeverScrollableScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      );
    }

    return scrollView;
  }
}
