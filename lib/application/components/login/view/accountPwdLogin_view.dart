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
          keyboardConfig: Helper.getKeyboardActionsConfig(context, [
            KeyboardItem(
              focusNode: _phoneTxtNode,
              onTap: () {},
            ).getItem(),
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
      placeholder: "请输入密码",
      enabledBorder: BorderSide(color: Colors.transparent),
      focusedBorder: BorderSide(color: Colors.transparent),
      obscureText: true,
    );
  }
}
