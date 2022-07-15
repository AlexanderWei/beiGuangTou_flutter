import '../../support_file/common_header.dart';
import '../../provider/login_provider.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 屏幕适配
    ScreenUtil.init(context);

    context.read<LoginProvider>().rootForApplication(context: context);

    return Container(
      child: context.watch<LoginProvider>().appRoot,
    );
  }
}
