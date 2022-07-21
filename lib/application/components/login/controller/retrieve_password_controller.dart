import 'package:flutter/material.dart';
import '../../../support_file/common_header.dart';

class RetrievePasswordController extends StatelessWidget {
  RetrievePasswordController({Key? key}) : super(key: key);

  TextField _phoneTextField = TextField();
  TextEditingController _phoneController = TextEditingController();
  FocusNode _phoneFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            NavigatorUtil.pop(context: context);
          },
          child: Image.asset(
            AssetsPath.login_bar_back,
          ),
        ),
      ),
      body: MyScrollView(
        children: [
          _titleLabel(),
          _subtitleLabel(),
          _phoneTextWidget(),
        ],
        keyboardItems: [
          KeyboardActionsItem(
            focusNode: _phoneFocusNode,
            displayActionBar: false,
          )
        ],
      ),
    );
  }

  Widget _titleLabel() {
    return Container(
      margin: EdgeInsets.only(
        left: 25.sm,
        top: 44.sm,
      ),
      child: Text(
        "找回密码",
        style: TextStyle(
          fontSize: 26.sm,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _subtitleLabel() {
    return Container(
      margin: EdgeInsets.fromLTRB(25.sm, 12.sm, 25.sm, 0),
      child: Text(
        "为了保证您的账户安全，1天只能操作1次，否则账户将会被锁定无法登录。",
        style: TextStyle(
          fontSize: 14.sm,
          color: kTextGrayColor,
        ),
      ),
    );
  }

  Widget _phoneTextWidget() {
    return MyTextField(
      width: 1.sw - 25.sm * 2,
      height: 45.sm,
      controller: _phoneController,
      placeholder: "请输入手机号码",
      margin: EdgeInsets.only(
        left: 25.sm,
        top: 50.sm,
      ),
      padding: EdgeInsets.only(left: 16.sm),
      enabledBorder: const BorderSide(
        color: Colors.transparent,
      ),
      focusedBorder: const BorderSide(
        color: Colors.transparent,
      ),
      autofocus: true,
      focusNode: _phoneFocusNode,
      keyboardType: TextInputType.number,
    );
  }
}
