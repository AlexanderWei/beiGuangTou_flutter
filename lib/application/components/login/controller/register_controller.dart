import 'package:flutter/material.dart';
import 'package:flutter_application/application/support_file/common_header.dart';

class RegisterController extends StatelessWidget {
  RegisterController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => VoidProvider(),
        )
      ],
      child: RegisterPage(),
    );
  }
}

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purpleAccent,
    );
  }
}
