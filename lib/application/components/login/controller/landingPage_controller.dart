import 'package:flutter/material.dart';
import '../../../support_file/common_header.dart';
import 'quickLogin_controller.dart';
import 'register_controller.dart';

class LandingPageController extends StatefulWidget {
  LandingPageController({Key? key}) : super(key: key);

  @override
  State<LandingPageController> createState() => _LandingPageControllerState();
}

class _LandingPageControllerState extends State<LandingPageController> {
  @override
  Widget build(BuildContext context) {
    double height = 1.sh > 800 ? (150.h + 46.sm) : (139.h + 46.sm);

    return Scaffold(
      body: Stack(
        children: [
          backgroundImg(),
          titleLabel(),
          Positioned(
              bottom: 0,
              child: Container(
                width: 1.sw,
                height: height,
                child: Column(children: [
                  quickLoginButton(context),
                  SizedBox(height: 18.sm),
                  registerButton(context),
                  SizedBox(height: 18.sm),
                  financialPlannerButton(context),
                ]),
              )),
        ],
      ),
    );
  }
}

/**背景图 */
Widget backgroundImg() {
  double top = 1.sh > 800 ? 145.h : 100.h;
  return Positioned(
    top: top,
    child: Container(
      width: 1.sw,
      alignment: Alignment.center,
      child: Image.asset("assets/login/login_bg.png"),
    ),
  );
}

/**标题 */
Widget titleLabel() {
  double top = 1.sh > 800 ? 90.h : 54.h;

  return Positioned(
    top: top,
    child: Container(
      alignment: Alignment.center,
      width: 1.sw,
      child: Text(
        "北广投，您身边的VIP！",
        style: TextStyle(fontSize: 26.sm),
      ),
    ),
  );
}

/**快速登录按钮 */
Widget quickLoginButton(BuildContext context) {
  return MyTextButton(
      onPressed: () {
        NavigatorUtil.pushTo(
            context: context, function: QuickLoginController());
      },
      bgImgName: "assets/login/btn_login_bg.png",
      cornerRadius: 8.sm,
      width: 1.sw - 48 * 2.sm,
      height: 46.sm,
      text: S.of(context).quick_login);
}

/**新用户注册按钮 */
Widget registerButton(BuildContext context) {
  return MyTextButton(
      onPressed: () {
        NavigatorUtil.pushTo(context: context, function: RegisterController());
      },
      textColor: Theme_Yellow,
      bgColor: Colors.white,
      cornerRadius: 8.sm,
      width: 1.sw - 48 * 2.sm,
      height: 46.sm,
      borderColor: Theme_Yellow,
      borderWidth: 1.sm,
      text: "新用户注册");
}

/**理财师账号登录按钮 */
Widget financialPlannerButton(BuildContext context) {
  return InkWell(
    onTap: null,
    child: Container(
      color: Colors.transparent,
      width: 1.sw - 48 * 2.sm,
      height: 46.sm,
      child: Row(
        children: [
          Text(
            "理财师账号登录",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            width: 5.sm,
          ),
          Image.asset(AssetsPath.arrow_enter)
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ),
  );
}
