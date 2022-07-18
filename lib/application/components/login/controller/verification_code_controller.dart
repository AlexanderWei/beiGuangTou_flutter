import 'package:flutter/material.dart';
import 'package:flutter_application/application/support_file/common_header.dart';

class VerificationCodeController extends StatelessWidget {
  VerificationCodeController({Key? key, this.phoneNum = ""}) : super(key: key);

  String phoneNum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Image.asset(
            AssetsPath.login_bar_back,
          ),
          onTap: () {
            NavigatorUtil.pop(context: context);
          },
        ),
        elevation: 0,
      ),
      body: Container(
        child: MyScrollView(
          children: [
            title(),
            phoneNumber(),
          ],
          isScrollable: false,
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      margin: EdgeInsets.only(
        left: 25.sm,
        top: 44.sm,
      ),
      child: Text(
        "请输入验证码",
        style: TextStyle(
          fontSize: 26.sm,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget phoneNumber() {
    return Container(
      margin: EdgeInsets.only(
        left: 25.sm,
        top: 14.sm,
      ),
      padding: EdgeInsets.only(
        left: 0,
        right: 0,
      ),
      color: Colors.purple,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "验证码已发送至 ",
            style: TextStyle(
              fontSize: 14.sm,
              color: kTextGrayColor,
            ),
          ),
          Text(
            "$phoneNum",
            style: TextStyle(
              fontSize: 14.sm,
            ),
          ),
        ],
      ),
    );
  }
}
