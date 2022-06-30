import 'package:flutter/material.dart';
import 'package:flutter_application/application/components/login/controller/quickLoginController.dart';
import '../../../support_file/common_header.dart';

class LandingPageController extends StatefulWidget {
  LandingPageController({Key? key}) : super(key: key);

  @override
  State<LandingPageController> createState() => _LandingPageControllerState();
}

class _LandingPageControllerState extends State<LandingPageController> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    printScreenInformation();
  }

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

printScreenInformation() {
  print('设备宽度:${1.sw}dp');
  print('设备高度:${1.sh}dp');
  print('底部安全区距离:${ScreenUtil().bottomBarHeight}dp');
  print('状态栏高度:${ScreenUtil().statusBarHeight}dp');
  print('系统的字体缩放比例:${ScreenUtil().textScaleFactor}');
  print('屏幕方向:${ScreenUtil().orientation}');
}

/**背景图 */
Widget backgroundImg() {
  double top = 1.sh > 800 ? 145.h : 100.h;
  return Positioned(
      top: top,
      child: MyImage(
        width: 1.sw,
        height: 774 / 2.sm,
        image: Image.asset("assets/login/login_bg.png"),
      ));
}

/**标题 */
Widget titleLabel() {
  double top = 1.sh > 800 ? 90.h : 54.h;

  return Positioned(
    child: MyText(
      text: "北广投，您身边的VIP！",
      width: 1.sw,
      height: 37.sm,
      style: TextStyle(fontSize: 26.sm),
      textAlign: TextAlign.center,
    ),
    top: top,
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
      text: "快速登录");
}

/**新用户注册按钮 */
Widget registerButton(BuildContext context) {
  return MyTextButton(
      onPressed: null,
      textColor: AppConstant.themeYellow,
      bgColor: Colors.white,
      cornerRadius: 8.sm,
      width: 1.sw - 48 * 2.sm,
      height: 46.sm,
      borderColor: AppConstant.themeYellow,
      borderWidth: 1.sm,
      text: "新用户注册");
}

/**理财师账号登录按钮 */
Widget financialPlannerButton(BuildContext context) {
  return InkWell(
    onTap: () {
      print("👩来了。");
    },
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
