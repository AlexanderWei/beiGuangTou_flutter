import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/application/components/login/controller/webView_controller.dart';
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

  FocusNode _phoneTxtNode = FocusNode();

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
        return MyListView(
          isScrollable: false,
          keyboardConfig: Helper.getKeyboardActionsConfig(context, [
            KeyboardItem(
              focusNode: _phoneTxtNode,
              onTap: () {
                print("👩手机号=${_phoneController.text}");
              },
            ).getItem(),
          ]),
          children: [
            // 标题
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
              margin: EdgeInsets.only(left: 28.sm, right: 28.sm),
              padding: EdgeInsets.fromLTRB(16.sm, 0, 0, 0),
              width: 0,
              height: 45.sm,
              controller: _phoneController,
              placeholder: '请输入手机号码',
              keyboardType: TextInputType.number,
              enabledBorder: BorderSide(color: Colors.transparent),
              focusedBorder: BorderSide(color: Colors.transparent),
              cornerRadius: 4.sm,
              maxLength: 11,
              focusNode: _phoneTxtNode,
              autofocus: true,
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
              width: 1.sw - 2 * 28.sm,
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
                  style: TextStyle(
                      fontSize: 14.sm, color: AppConstant.themeYellow),
                ),
              ),
            ),

            SizedBox(
              height: 250.h,
            ),

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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

/** 用户注册等相关协议 */
  Widget relatedAgreements() {
    return Container(
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
              NavigatorUtil.pushTo(
                  context: context,
                  function: WebViewPage(
                    url: "https://www.beiguangtou.com/H5/agreement/index.html",
                    title: "用户注册等相关协议",
                  ));
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
    );
  }
}
