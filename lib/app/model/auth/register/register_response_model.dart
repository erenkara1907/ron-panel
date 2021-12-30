/// code : 200
/// message : "Başarılı bir şekilde giriş yaptınız."
/// result : {"token":"0de60a77d448d40144ac6239790f29495a0b7dd85e266375915d99b9f2bc1745"}
class RegisterResponseModel {
  RegisterResponseModel({
    int? code,
    String? message,
    Result? result,
  }) {
    _code = code;
    _message = message;
    _result = result;
  }

  RegisterResponseModel.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  int? _code;
  String? _message;
  Result? _result;

  int? get code => _code;

  String? get message => _message;

  Result? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    return map;
  }
}

/// token : "0de60a77d448d40144ac6239790f29495a0b7dd85e266375915d99b9f2bc1745"
class Result {
  Result({
    String? token,
  }) {
    _token = token;
  }

  Result.fromJson(dynamic json) {
    _token = json['token'];
  }

  String? _token;

  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }
}
