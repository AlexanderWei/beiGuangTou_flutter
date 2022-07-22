import 'package:flutter/material.dart';
import '../../support_file/common_header.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 屏幕适配
    ScreenUtil.init(context);

    Future.delayed(Duration(milliseconds: 200)).then((value) {
      context.read<RootProvider>().rootForApplication();

      printScreenInformation();
    });

    return Container(
      child: context.watch<RootProvider>().appRoot,
    );
  }

  static IndexPage createIndexPage() {
    return IndexPage();
  }

  printScreenInformation() async {
    PackageInfo info = await PackageInfo.fromPlatform();
    String? version = SpUtil.getString(VERSION_KEY);
    if (version == null || (version != null && version != info.version)) {
      print('设备宽度:${1.sw}dp');
      print('设备高度:${1.sh}dp');
      print('底部安全区距离:${ScreenUtil().bottomBarHeight}dp');
      print('状态栏高度:${ScreenUtil().statusBarHeight}dp');
      print('系统的字体缩放比例:${ScreenUtil().textScaleFactor}');
      print('屏幕方向:${ScreenUtil().orientation}');

      SpUtil.putString(VERSION_KEY, info.version);
    }
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
