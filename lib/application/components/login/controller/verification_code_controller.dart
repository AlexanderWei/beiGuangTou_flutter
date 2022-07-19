import 'package:flutter/material.dart';
import 'package:flutter_application/application/support_file/common_header.dart';
import '../../../third_party/flutter_verification_box/verification_box.dart';

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
      body: MyScrollView(
        children: [
          title(),
          phoneNumber(),
          verificationCodeBox(),
          resendButton(),
        ],
        isScrollable: false,
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
            "${(phoneNum.length >= 7 ? TextUtil.hideNumber(phoneNum) : phoneNum)}",
            style: TextStyle(
              fontSize: 14.sm,
            ),
          ),
        ],
      ),
    );
  }

  // 验证码输入框
  Widget verificationCodeBox() {
    return Container(
      margin: EdgeInsets.fromLTRB(25.sm, 38.sm, 25.sm, 0),
      height: 50.sm,
      child: VerificationBox(
        onSubmitted: ((value) {
          fLog("👩${value}", StackTrace.current);
        }),
        type: VerificationBoxItemType.underline,
        showCursor: true,
        itemWidget: 45.sm,
        borderWidth: 1,
        focusBorderColor: Colors.black,
        cursorColor: Theme_Yellow,
        textStyle: TextStyle(
          color: Theme_Yellow,
          fontSize: 28.sm,
        ),
      ),
    );
  }

  Widget resendButton() {
    return Container(
      child: TimerButton(
        callback: () {
          fLog("👩开始发送验证码啰！", StackTrace.current);
        },
        totalTime: 60,
        isAutoCountdown: true,
        subtitle: " 秒后重新发送验证码",
        textStyle: TextStyle(fontSize: 14, color: Theme_Yellow),
        bgColor: Colors.transparent,
        title: "重新发送",
      ),
      margin: EdgeInsets.only(
        left: 25.sm,
        top: 10.sm,
      ),
    );
  }
}
