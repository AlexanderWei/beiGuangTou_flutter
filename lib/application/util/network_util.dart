import 'package:dio/dio.dart';
import 'package:flutter_application/application/support_file/common_header.dart';

class NetworkUtil {
  static requestHttp({
    required String urlStr,
    required Map<String, dynamic> parameter,
    Map<String, dynamic>? headers,
    required String method, // 传post或get
    required success(dynamic response),
    required error(DioError? error),
  }) async {
    var dio = Dio();

    String key = EncryptUtil.encodeMd5("WEWE_2018-3-13");

    /** 获取token */
    String token;
    String tempUrl = urlStr.replaceRange(0, Base_Url.length, "");
    String timeStr = "${DateUtil.getNowDateMs()}";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogined = prefs.getBool("isLogined") ?? false;
    if (isLogined == true) {
      token = tempUrl + timeStr + key + "userID";
    } else {
      token = tempUrl + timeStr + key;
    }
    token = EncryptUtil.encodeMd5(token);
    parameter["token"] = token;

    /** 获取请求头 */
    PackageInfo info = await PackageInfo.fromPlatform();
    String version = info.version;
    version = version.replaceAll(RegExp("\\."), "");
    Map<String, dynamic> headers = {
      "version": version,
      "device": "2",
      "token": token,
      "islogin": "1",
    };
    if (isLogined == true) {
      headers["token"] = "login_token";
      headers["uid"] = "uid";
    }
    dio.options.headers = headers;

    var formData = FormData.fromMap(parameter);
    if (method == "get") {
    } else if (method == "post") {
      try {
        Response response = await dio.post(urlStr, data: formData);
        return success(response.data);
      } on DioError catch (e) {
        if (e.response != null) {
          fLog(e.response!.data, StackTrace.current);
        } else {
          fLog(e.message, StackTrace.current);
        }
      }
    }
  }
}
