import 'package:flutter_application/application/support_file/common_header.dart';

class LoginProvider with ChangeNotifier {
  /** 找回密码页面 */
  bool isNext_retrieve_password = false;
  setEnableRetrievePwd(bool enable) {
    isNext_retrieve_password = enable;

    notifyListeners();
  }
}
