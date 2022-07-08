import 'package:flutter/material.dart';
import '../../../support_file/common_header.dart';

class AccountPwdLoginView extends StatelessWidget {
  AccountPwdLoginView({Key? key}) : super(key: key);

  FocusNode _phoneTxtNode = FocusNode();
  MyTextField? _phoneTextField;
  TextEditingController _phoneController = TextEditingController();

  FocusNode _pwdNode = FocusNode();
  MyTextField? _pwdTextField;
  TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MyListView(
          isScrollable: false,
          keyboardConfig: Helper.getKeyboardActionsConfig(context, [
            KeyboardActionsItem(focusNode: _phoneTxtNode, onTapAction: () {}),
            KeyboardActionsItem(focusNode: _pwdNode, displayDoneButton: false),
          ]),
          children: [
            _title(),
            SizedBox(
              height: 53.sm,
            ),
            _phoneText(),
            SizedBox(
              height: 16.sm,
            ),
            _pwdText(),
            SizedBox(
              height: 42.sm,
            ),
            LoginButton(
              phoneController: _phoneController,
              pwdController: _pwdController,
            ),
          ],
        ),
      ],
    );
  }

  Widget _title() {
    return Container(
      margin: EdgeInsets.only(top: 36.sm, left: 28.sm),
      child: Text(
        "账号密码登录",
        style: TextStyle(
          fontSize: 26.sm,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // 手机号
  Widget _phoneText() {
    return MyTextField(
      padding: EdgeInsets.only(left: 16.sm),
      margin: EdgeInsets.only(left: 28.sm, right: 28.sm),
      width: 0,
      height: 45.sm,
      controller: _phoneController,
      focusNode: _phoneTxtNode,
      placeholder: "请输入手机号码",
      cornerRadius: 4.sm,
      keyboardType: TextInputType.number,
      enabledBorder: BorderSide(
        color: Colors.transparent,
      ),
      focusedBorder: BorderSide(
        color: Colors.transparent,
      ),
      maxLength: 11,
    );
  }

  // 密码
  Widget _pwdText() {
    return MyTextField(
      margin: EdgeInsets.only(
        left: 28.sm,
        right: 28.sm,
      ),
      padding: EdgeInsets.only(
        left: 16.sm,
      ),
      width: 0,
      height: 45.sm,
      controller: _pwdController,
      focusNode: _pwdNode,
      placeholder: "请输入密码",
      enabledBorder: BorderSide(color: Colors.transparent),
      focusedBorder: BorderSide(color: Colors.transparent),
      isSecureEntry: true,
      onEditingComplete: () {
        fLog("👩提交密码", StackTrace.current);
      },
    );
  }
}

/** 立即登录按钮 */
class LoginButton extends StatefulWidget {
  LoginButton({
    Key? key,
    required this.phoneController,
    required this.pwdController,
  }) : super(key: key);

  bool isEnable = false;
  String _phoneStr = "";
  String _passwordStr = "";
  TextEditingController phoneController;
  TextEditingController pwdController;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.phoneController.addListener(() {
      widget._phoneStr = widget.phoneController.text;
      loginEnableJudge();
    });
    widget.pwdController.addListener(() {
      widget._passwordStr = widget.pwdController.text;
      loginEnableJudge();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyTextButton(
      margin: EdgeInsets.only(left: 28.sm),
      onPressed: (widget.isEnable == true ? () {} : null),
      width: 1.sw - 28.sm * 2,
      height: 45.sm,
      text: '立即登录',
      cornerRadius: 4.sm,
      bgColor: kBtnDisableColor,
      bgImgName:
          (widget.isEnable == true ? "assets/login/btn_login_bg.png" : null),
    );
  }

  loginEnableJudge() {
    bool _isEnable = widget._phoneStr.isNotEmpty == true &&
        widget._passwordStr.isNotEmpty == true;
    if (widget.isEnable != _isEnable) {
      setState(() {
        widget.isEnable = _isEnable;
      });
    }
  }
}
