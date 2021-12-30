/// code : 200
/// message : "Statü grubu listeleme işleminiz başarılı bir şekilde gerçekleştirilmiştir."
/// result : {"token":"62343539626263625110fa400206ded4","conclusion":[{"id":1,"title":"Statü Deneme Update","options":"Options","created_at":"2021-12-21T11:54:43.000000Z","updated_at":"2021-12-21T11:57:01.000000Z"}]}
/// options : {"columns":[],"doc_url":"https://console.ron.digital/panel/doc/v1/route?name=statusGroup.read"}

class StatusGroupModel {
  StatusGroupModel({
      int? code, 
      String? message, 
      Result? result, 
      Options? options,}){
    _code = code;
    _message = message;
    _result = result;
    _options = options;
}

  StatusGroupModel.fromJson(dynamic json) {
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

/// columns : []
/// doc_url : "https://console.ron.digital/panel/doc/v1/route?name=statusGroup.read"

class Options {
  Options({
      List<dynamic>? columns, 
      String? docUrl,}){
    _columns = columns;
    _docUrl = docUrl;
}

  Options.fromJson(dynamic json) {
    if (json['columns'] != null) {
      _columns = [];
      json['columns'].forEach((v) {
        _columns?.add(Options.fromJson(v));
      });
    }
    _docUrl = json['doc_url'];
  }
  List<dynamic>? _columns;
  String? _docUrl;

  List<dynamic>? get columns => _columns;
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

/// token : "62343539626263625110fa400206ded4"
/// conclusion : [{"id":1,"title":"Statü Deneme Update","options":"Options","created_at":"2021-12-21T11:54:43.000000Z","updated_at":"2021-12-21T11:57:01.000000Z"}]

class Result {
  Result({
      String? token, 
      List<ConclusionStatusGroup>? conclusion,}){
    _token = token;
    _conclusion = conclusion;
}

  Result.fromJson(dynamic json) {
    _token = json['token'];
    if (json['conclusion'] != null) {
      _conclusion = [];
      json['conclusion'].forEach((v) {
        _conclusion?.add(ConclusionStatusGroup.fromJson(v));
      });
    }
  }
  String? _token;
  List<ConclusionStatusGroup>? _conclusion;

  String? get token => _token;
  List<ConclusionStatusGroup>? get conclusion => _conclusion;

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
/// title : "Statü Deneme Update"
/// options : "Options"
/// created_at : "2021-12-21T11:54:43.000000Z"
/// updated_at : "2021-12-21T11:57:01.000000Z"

class ConclusionStatusGroup {
  ConclusionStatusGroup({
      int? id, 
      String? title, 
      String? options, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _title = title;
    _options = options;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ConclusionStatusGroup.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _options = json['options'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _title;
  String? _options;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get title => _title;
  String? get options => _options;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['options'] = _options;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}