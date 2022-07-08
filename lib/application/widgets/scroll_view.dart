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
      if (isScrollable == false) {
        scrollView = KeyboardActions(
          tapOutsideBehavior: TapOutsideBehavior.translucentDismiss,
          config: keyboardConfig!,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        );
      } else {
        scrollView = KeyboardActions(
          tapOutsideBehavior: TapOutsideBehavior.translucentDismiss,
          config: keyboardConfig!,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        );
      }
    } else {
      if (isScrollable == false) {
        scrollView = SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        );
      } else {
        scrollView = SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        );
      }
    }

    return scrollView;
  }
}
