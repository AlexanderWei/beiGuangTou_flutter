import 'package:flutter/material.dart';
import '../components/base/app_root.dart';
import '../components/login/controller/landingPage_controller.dart';
import '../support_file/common_header.dart';

class RootProvider with ChangeNotifier {
  Widget appRoot = Container(color: Colors.white);
  int bottomTabsIndex = 0;

  /** 设置/重制 app的根视图 */
  rootForApplication() {
    bool? isLogined = SpUtil.getBool("isLogined");
    if (isLogined != null && isLogined == true) {
      appRoot = AppRoot.createIndexPage();
    } else {
      appRoot = LandingPageController();
    }

    notifyListeners();
  }

  /** 根视图 BottomNavigationBar 切换 */
  setBottomTabsIndex(int index) {
    bottomTabsIndex = index;

    notifyListeners();
  }
}
