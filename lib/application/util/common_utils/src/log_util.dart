import 'package:flutter/foundation.dart';

class LogUtil {
  final StackTrace _trace;

  String fileName = "";
  int lineNumber = 0;
  int columnNumber = 0;

  LogUtil(this._trace) {
    _parseTrace();
  }

  void _parseTrace() {
    var traceString = this._trace.toString().split("\n")[0];
    var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z_]+.dart'));
    var fileInfo = traceString.substring(indexOfFileName);
    var listOfInfos = fileInfo.split(":");
    this.fileName = listOfInfos[0];
    this.lineNumber = int.parse(listOfInfos[1]);
    var columnStr = listOfInfos[2];
    columnStr = columnStr.replaceFirst(")", "");
    this.columnNumber = int.parse(columnStr);
  }
}

void fLog(Object message, StackTrace trace) {
  if (kDebugMode) {
    LogUtil programInfo = LogUtil(trace);
    if (programInfo != null &&
        programInfo.fileName != null &&
        programInfo.lineNumber != null) {
      print(
          "所在：${programInfo.fileName} 第 ${programInfo.lineNumber} 行，打印信息：$message");
    } else {
      print("打印内容：$message");
    }
  }
}
