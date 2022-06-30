import 'package:flutter/material.dart';
import '../support_file/common_header.dart';
import '../components/login/controller/landingPageController.dart';

class LoginProvider with ChangeNotifier {
  Widget appRoot = Container();
  int bottomTabsIndex = 0;

  /**设置应用的根 */
  rootForApplication() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLogined = prefs.getBool("isLogined");
    if (isLogined != null && isLogined == true) {
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
