import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/application/support_file/common_header.dart';

enum QuickLoginType {
  quickLoginTypeByPhone,
  quickLoginTypeByAccountPassword, // 账号密码登录
  quickLoginTypeAFP // 理财师账号登录
}

class QuickLoginController extends StatefulWidget {
  QuickLoginController(
      {Key? key, this.loginType = QuickLoginType.quickLoginTypeByPhone})
      : super(key: key);

  Enum loginType;

  @override
  State<QuickLoginController> createState() =>
      _QuickLoginControllerState(this.loginType);
}

class _QuickLoginControllerState extends State<QuickLoginController> {
  _QuickLoginControllerState(this.loginType);

  Enum loginType;

  MyTextField? _phoneTextField;
  TextEditingController _phoneController = TextEditingController();

  MyTextButton? _nextStepBtn;
  bool _isNextEnable = false;

  @override
  void initState() {
    // TODO: implement initState
    // 监听手机号输入
    _phoneController.addListener(() {
      if (_isNextEnable != _phoneController.text.isNotEmpty) {
        setState(() {
          _isNextEnable = _phoneController.text.isNotEmpty;
        });
      }
    });

    super.initState();
  }

  // 创建UI
  Widget body(BuildContext context, Enum loginType) {
    switch (loginType) {
      case QuickLoginType.quickLoginTypeByPhone:
        return Stack(
          children: [
            phoneLoginUI(context),

            // 用户注册等相关协议
            relatedAgreements(),
          ],
        );

        break;

      case QuickLoginType.quickLoginTypeByAccountPassword: // 账号密码登录类型
        return Container(
          color: Colors.green,
        );
        break;

      case QuickLoginType.quickLoginTypeAFP:
        // TODO: Handle this case.
        break;
    }

    return Container(
      color: Colors.blue,
    );
  }

  /** 手机号码登录的UI */
  Widget phoneLoginUI(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 28.sm, top: 36.sm),
            child: Text(
              "你好，\n欢迎来到北广投",
              style: TextStyle(
                fontSize: 26.sm,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 53.h),

          // 请输入手机号码
          _phoneTextField = MyTextField(
            margin: EdgeInsets.only(left: 28.sm),
            padding: EdgeInsets.fromLTRB(16.sm, 0, 9.sm, 0),
            width: 1.sw - 28.sm * 2,
            height: 45.sm,
            controller: _phoneController,
            placeholder: '请输入手机号码',
            keyboardType: TextInputType.phone,
            enabledBorder: BorderSide(color: Colors.transparent),
            focusedBorder: BorderSide(color: Colors.transparent),
            cornerRadius: 4.sm,
            maxLength: 11,
          ),

          SizedBox(
            height: 42.sm,
          ),

          // 下一步按钮
          _nextStepBtn = MyTextButton(
            onPressed: (_isNextEnable
                ? () {
                    print("👩下一步");
                  }
                : null),
            width: 1.sw - 28.sm * 2,
            height: 45.sm,
            margin: EdgeInsets.only(left: 28.sm),
            text: "下一步",
            cornerRadius: 4.sm,
            bgColor: (_isNextEnable
                ? AppConstant.themeYellow
                : AppConstant.btnDisableColor),
          ),

          SizedBox(
            height: 20.sm,
          ),

          // 密码登录按钮
          Container(
            margin: EdgeInsets.only(left: 28.sm),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                "密码登录",
                style:
                    TextStyle(fontSize: 14.sm, color: AppConstant.themeYellow),
              ),
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  /** 用户注册等相关协议 */
  Widget relatedAgreements() {
    return Positioned(
      bottom: 79.h,
      child: Container(
        width: 1.sw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "登录即已同意",
              style: TextStyle(
                fontSize: 12.sm,
                color: AppConstant.textGrayColor,
              ),
            ),

            // 可点击部分
            GestureDetector(
              onTap: () {
                print("👩来了。");
              },
              child: Text(
                "《用户注册等相关协议》",
                style: TextStyle(
                  fontSize: 12.sm,
                  color: AppConstant.themeYellow,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Image.asset(AssetsPath.login_bar_back_icon),
          onPressed: () {
            NavigatorUtil.pop(context: context);
          },
        ),
      ),
      body: body(context, loginType),
    );
  }
}
