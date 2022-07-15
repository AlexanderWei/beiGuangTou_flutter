import 'package:flutter/material.dart';
import '../../support_file/common_header.dart';
import '../../provider/root_provider.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 屏幕适配
    ScreenUtil.init(context);

    Future.delayed(Duration(milliseconds: 200)).then((value) {
      context.read<RootProvider>().rootForApplication();
    });

    return Container(
      child: context.watch<RootProvider>().appRoot,
    );
  }

  static IndexPage createIndexPage() {
    return IndexPage();
  }
}

class IndexPage extends StatelessWidget {
  IndexPage({Key? key}) : super(key: key);

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Image.asset("assets/bar_item/tab_home_norm.png"),
      activeIcon: Image.asset("assets/bar_item/tab_home_sel.png"),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Image.asset("assets/bar_item/tab_mall_norm.png"),
      activeIcon: Image.asset("assets/bar_item/tab_mall_sel.png"),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Image.asset("assets/bar_item/tab_activity_norm.png"),
      activeIcon: Image.asset("assets/bar_item/tab_activity_sel.png"),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Image.asset("assets/bar_item/tab_my_norm.png"),
      activeIcon: Image.asset("assets/bar_item/tab_my_sel.png"),
      label: "",
    ),
  ];

  List<Widget> bodies = [
    Container(
      color: Colors.pinkAccent,
    ),
    Container(
      color: Colors.orangeAccent,
    ),
    Container(
      color: Colors.greenAccent,
    ),
    Container(
      color: Colors.blueAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    int tabIndex = context.watch<RootProvider>().bottomTabsIndex;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          context.read<RootProvider>().setBottomTabsIndex(index);
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: tabIndex,
        items: items,
      ),
      body: bodies[tabIndex],
    );
  }
}
