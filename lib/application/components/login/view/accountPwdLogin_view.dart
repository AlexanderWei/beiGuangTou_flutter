import 'package:flutter/material.dart';
import 'package:flutter_application/application/provider/login_provider.dart';
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
        MyScrollView(
          isScrollable: false,
          keyboardConfig: Helper.getKeyboardActionsConfig(context, [
            KeyboardActionsItem(
                focusNode: _phoneTxtNode, displayDoneButton: false),
            KeyboardActionsItem(focusNode: _pwdNode, displayDoneButton: false),
          ]),
          children: [
            _title(),
            _phoneText(),
            _pwdText(),
            LoginButton(
              phoneController: _phoneController,
              pwdController: _pwdController,
            ),
            _forgetPwdButton(),
          ],
        ),
        relatedAgreements(context),
      ],
    );
  }

  Widget _title() {
    return Container(
      margin: EdgeInsets.only(left: 28.sm, top: 36.h),
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
      margin: EdgeInsets.only(left: 28.sm, top: 53.sm),
      width: 1.sw - 2 * 28.sm,
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
      margin: EdgeInsets.only(left: 28.sm, top: 16.sm),
      padding: EdgeInsets.only(left: 16.sm),
      width: 1.sw - 2 * 28.sm,
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

  /** 用户注册等相关协议 */
  Widget relatedAgreements(BuildContext context) {
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
                color: kTextGrayColor,
              ),
            ),

            // 可点击部分
            GestureDetector(
              onTap: () {
                NavigatorUtil.pushTo(
                    context: context,
                    function: WebViewPage(
                      url:
                          "https://www.beiguangtou.com/H5/agreement/index.html",
                      title: "用户注册等相关协议",
                    ));
              },
              child: Text(
                "《用户注册等相关协议》",
                style: TextStyle(
                  fontSize: 12.sm,
                  color: Theme_Yellow,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /** 忘记密码 */
  Widget _forgetPwdButton() {
    return Container(
      width: 1.sw - 2 * 24.sm,
      height: 30,
      margin: EdgeInsets.only(top: 20.sm, left: 24.sm),
      child: Row(
        children: [
          Expanded(child: SizedBox()),
          InkWell(
            onTap: () {
              print("👩忘记密码");
            },
            child: Text(
              "忘记密码？",
              style: TextStyle(
                fontSize: 14.sm,
                color: kTextGrayColor,
              ),
            ),
          ),
        ],
      ),
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
      margin: EdgeInsets.only(left: 28.sm, top: 42.sm),
      onPressed: (widget.isEnable == true
          ? () {
              checkPhoneNumber(widget.phoneController.text);
            }
          : null),
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

  /** 检查用户手机号状态 */
  checkPhoneNumber(String phoneNum) {
    if (phoneNum.isEmpty) {
      Helper.showToast(msg: "手机号不能为空！");
      return;
    }

    Helper.loadingHUD(context: context);

    LoginService.checkMobileStatus(
        parameter: {"mobile": phoneNum},
        success: (resp) {
          Helper.cancelHUD(context: context);

          fLog("${resp}", StackTrace.current);
          if ("${resp["Status"]}" == "1") {
            Helper.showToast(msg: "该手机号码未注册，请前往注册！");
          } else if ("${resp["Status"]}" == "3") {
            Helper.showToast(msg: "您已是理财师，请前往理财师登录！");
          } else if ("${resp["Status"]}" == "2") {
            goLogin();
          }
        },
        error: (err) {});
  }

  /** 直接登录 */
  goLogin() {
    Helper.loadingHUD(context: context);

    LoginService.userLogin(
        parameter: {"password": widget._passwordStr, "phone": widget._phoneStr},
        success: (resp) {
          fLog("👩${JsonUtil.encodeObj(resp)}", StackTrace.current);

          Helper.cancelHUD(context: context);

          if ("${resp["Status"]}" == "0") {
            UserModel userModel = UserModel.fromJson(resp["data"]);
            SpUtil.putObject(USER_KEY, userModel);

            SpUtil.putBool("isLogined", true);
            context.read<LoginProvider>().rootForApplication(context: context);
          } else {
            Helper.showToast(msg: resp["msg"]);
          }
        },
        error: (err) {
          Helper.cancelHUD(context: context);
        });
  }
}
