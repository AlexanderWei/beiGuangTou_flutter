import 'package:dio/dio.dart';
import 'package:flutter_application/application/support_file/common_header.dart';

class NetworkRequest {
  static requestHttp({
    required String urlStr,
    required Map parameter,
    Map<String, dynamic>? headers,
    required String method,
    required success(Response response),
    required error(DioError? error),
  }) async {
    var dio = Dio();

    String key = EncryptUtil.encodeMd5("WEWE_2018-3-13");

    /** 获取token */
    String token;
    String tempUrl = urlStr.replaceRange(0, AppConstant.baseUrl.length, "");
    String timeStr = "${DateUtil.getNowDateMs()}";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogined = prefs.getBool("isLogined") ?? false;
    if (isLogined == true) {
      token = tempUrl + timeStr + key + "";
    } else {
      token = tempUrl + timeStr + key;
    }
    print("👩㊗️🐷${token}");
    token = EncryptUtil.encodeMd5(token);
    parameter["token"] = token;

    /** 获取请求头 */
    Map<String, dynamic> headers = {
      "version": "125",
      "device": "2",
      "token": token,
      "islogin": "1",
    };
    if (isLogined == true) {
      headers["token"] = "login_token";
      headers["uid"] = "uid";
    }
    dio.options.headers = headers;

    if (method == "get") {
    } else if (method == "post") {
      try {
        Response response = await dio.post(urlStr, data: parameter);
        return success(response);
      } catch (e) {
        DioError? err = e as DioError;
        error(err);
      }
    }
  }
}
