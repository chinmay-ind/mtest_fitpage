class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([message]) : super(message, "");
}

class CatchException extends CustomException {
  CatchException([message]) : super(message, "");
}
