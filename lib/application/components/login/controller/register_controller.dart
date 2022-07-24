import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application/application/support_file/common_header.dart';

class RegisterController extends StatelessWidget {
  RegisterController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Provider(),
        )
      ],
      child: RegisterPage(),
    );
  }
}

class Provider with ChangeNotifier {
  bool isEnableNext = false;
}

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

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
    );
  }
}
