/// code : 200
/// message : "Ürün güncelleme işleminiz başarılı bir şekilde gerçekleştirilmiştir."
/// result : {"token":"6432633933323933b89ea611fa757161","conclusion":false}
/// options : {"form":[],"doc_url":"https://console.ron.digital/panel/doc/v1/route?name=product.update"}

class ProductResponseModel {
  ProductResponseModel({
      int? code, 
      String? message, 
      Result? result, 
      Options? options,}){
    _code = code;
    _message = message;
    _result = result;
    _options = options;
}

  ProductResponseModel.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
    _options = json['options'] != null ? Options.fromJson(json['options']) : null;
  }
  int? _code;
  String? _message;
  Result? _result;
  Options? _options;

  int? get code => _code;
  String? get message => _message;
  Result? get result => _result;
  Options? get options => _options;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
    if (_result != null) {
      map['result'] = _result?.toJson();
    }
    if (_options != null) {
      map['options'] = _options?.toJson();
    }
    return map;
  }

}

/// form : []
/// doc_url : "https://console.ron.digital/panel/doc/v1/route?name=product.update"

class Options {
  Options({
      List<dynamic>? form, 
      String? docUrl,}){
    _form = form;
    _docUrl = docUrl;
}

  Options.fromJson(dynamic json) {
    if (json['form'] != null) {
      _form = [];
      json['form'].forEach((v) {
        _form?.add(Options.fromJson(v));
      });
    }
    _docUrl = json['doc_url'];
  }
  List<dynamic>? _form;
  String? _docUrl;

  List<dynamic>? get form => _form;
  String? get docUrl => _docUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_form != null) {
      map['form'] = _form?.map((v) => v.toJson()).toList();
    }
    map['doc_url'] = _docUrl;
    return map;
  }

}

/// token : "6432633933323933b89ea611fa757161"
/// conclusion : false

class Result {
  Result({
      String? token, 
      dynamic conclusion,}){
    _token = token;
    _conclusion = conclusion;
}

  Result.fromJson(dynamic json) {
    _token = json['token'];
    _conclusion = json['conclusion'];
  }
  String? _token;
  dynamic _conclusion;

  String? get token => _token;
  dynamic get conclusion => _conclusion;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['conclusion'] = _conclusion;
    return map;
  }

}