/// code : 200
/// message : "Yetki listeleme işleminiz başarılı bir şekilde gerçekleştirilmiştir."
/// result : {"token":"30303636376435309211aa196ef0e510","conclusion":[{"id":1,"title":"Yönetici","name":"admin"},{"id":2,"title":"Personel","name":"staff"},{"id":3,"title":"Kullanıcı","name":"user"}]}
/// options : {"columns":[{"title":"Başlık","name":"title"},{"title":"İşlemler","name":"id"}],"doc_url":"https://console.ron.digital/panel/doc/v1/route?name=permission.read"}

class PermissionModel {
  PermissionModel({
      int? code, 
      String? message, 
      Result? result, 
      Options? options,}){
    _code = code;
    _message = message;
    _result = result;
    _options = options;
}

  PermissionModel.fromJson(dynamic json) {
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

/// columns : [{"title":"Başlık","name":"title"},{"title":"İşlemler","name":"id"}]
/// doc_url : "https://console.ron.digital/panel/doc/v1/route?name=permission.read"

class Options {
  Options({
      List<Columns>? columns, 
      String? docUrl,}){
    _columns = columns;
    _docUrl = docUrl;
}

  Options.fromJson(dynamic json) {
    if (json['columns'] != null) {
      _columns = [];
      json['columns'].forEach((v) {
        _columns?.add(Columns.fromJson(v));
      });
    }
    _docUrl = json['doc_url'];
  }
  List<Columns>? _columns;
  String? _docUrl;

  List<Columns>? get columns => _columns;
  String? get docUrl => _docUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_columns != null) {
      map['columns'] = _columns?.map((v) => v.toJson()).toList();
    }
    map['doc_url'] = _docUrl;
    return map;
  }

}

/// title : "Başlık"
/// name : "title"

class Columns {
  Columns({
      String? title, 
      String? name,}){
    _title = title;
    _name = name;
}

  Columns.fromJson(dynamic json) {
    _title = json['title'];
    _name = json['name'];
  }
  String? _title;
  String? _name;

  String? get title => _title;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['name'] = _name;
    return map;
  }

}

/// token : "30303636376435309211aa196ef0e510"
/// conclusion : [{"id":1,"title":"Yönetici","name":"admin"},{"id":2,"title":"Personel","name":"staff"},{"id":3,"title":"Kullanıcı","name":"user"}]

class Result {
  Result({
      String? token, 
      List<ConclusionPermission>? conclusion,}){
    _token = token;
    _conclusion = conclusion;
}

  Result.fromJson(dynamic json) {
    _token = json['token'];
    if (json['conclusion'] != null) {
      _conclusion = [];
      json['conclusion'].forEach((v) {
        _conclusion?.add(ConclusionPermission.fromJson(v));
      });
    }
  }
  String? _token;
  List<ConclusionPermission>? _conclusion;

  String? get token => _token;
  List<ConclusionPermission>? get conclusion => _conclusion;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_conclusion != null) {
      map['conclusion'] = _conclusion?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// title : "Yönetici"
/// name : "admin"

class ConclusionPermission {
  ConclusionPermission({
      int? id, 
      String? title, 
      String? name,}){
    _id = id;
    _title = title;
    _name = name;
}

  ConclusionPermission.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _name = json['name'];
  }
  int? _id;
  String? _title;
  String? _name;

  int? get id => _id;
  String? get title => _title;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['name'] = _name;
    return map;
  }

}