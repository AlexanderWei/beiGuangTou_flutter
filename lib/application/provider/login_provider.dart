import 'package:flutter/material.dart';
import '../components/login/controller/landingPage_controller.dart';
import '../support_file/common_header.dart';

class LoginProvider with ChangeNotifier {
  Widget appRoot = Container();
  int bottomTabsIndex = 0;

  /** 设置/重制 app的根视图 */
  rootForApplication({required BuildContext context}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLogined = prefs.getBool("isLogined");
    if (isLogined != null && isLogined == true) {
      appRoot = Container(
        color: Colors.purpleAccent,
      );
      NavigatorUtil.popToRoot(
        context: context,
        function: appRoot,
      );
    } else {
      appRoot = LandingPageController();
    }

    notifyListeners();
  }

  /**底部导航栏切换 */
  // setBottomTabsIndex(int index) async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // bool? isLogined = prefs.getBool("isLogined");
  // if (isLogined != null && isLogined == true) {
  //   bottomTabsIndex = index;
  // } else {

  // }

  // notifyListeners();
  // }
}
