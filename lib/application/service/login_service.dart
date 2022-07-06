import '../support_file/common_header.dart';

class LoginService {
  /** 判断用户手机号状态 */
  static checkMobileStatus({
    required Map<String, dynamic> parameter,
    required success(dynamic response),
    required error(DioError? error),
  }) {
    NetworkUtil.requestHttp(
        urlStr: Base_Url + "Wx/checkmobilestatus",
        parameter: parameter,
        method: "post",
        success: success,
        error: error);
  }
}
