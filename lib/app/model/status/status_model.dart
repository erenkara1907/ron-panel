/// code : 200
/// message : "Statü listeleme işleminiz başarılı bir şekilde gerçekleştirilmiştir."
/// result : {"token":"3764373463393362ecfe9c6b0977a649","conclusion":[{"id":1,"title":"Statu1","group_id":1,"settings":"settings","created_at":"2021-12-21T13:46:19.000000Z","updated_at":"2021-12-21T13:46:19.000000Z"},{"id":2,"title":"ron.digital","group_id":1,"settings":"settings","created_at":"2021-12-21T14:11:56.000000Z","updated_at":"2021-12-21T14:11:56.000000Z"},{"id":3,"title":"ron.digital","group_id":1,"settings":"settings","created_at":"2021-12-21T14:14:51.000000Z","updated_at":"2021-12-21T14:14:51.000000Z"},{"id":4,"title":"ron.digital","group_id":2,"settings":"settings","created_at":"2021-12-21T14:17:26.000000Z","updated_at":"2021-12-21T14:17:26.000000Z"},{"id":5,"title":"berat","group_id":1,"settings":"settings","created_at":"2021-12-21T14:18:49.000000Z","updated_at":"2021-12-21T14:18:49.000000Z"},{"id":6,"title":"berat","group_id":1,"settings":"settings","created_at":"2021-12-21T14:20:37.000000Z","updated_at":"2021-12-21T14:20:37.000000Z"},{"id":7,"title":"Mehmet Deneme","group_id":1,"settings":"settings","created_at":"2021-12-21T14:21:59.000000Z","updated_at":"2021-12-21T14:21:59.000000Z"},{"id":8,"title":"Mehmet Deneme","group_id":1,"settings":"[]","created_at":"2021-12-21T14:22:53.000000Z","updated_at":"2021-12-21T14:22:53.000000Z"}]}
/// options : {"columns":[],"doc_url":"https://console.ron.digital/panel/doc/v1/route?name=status.read"}

class StatusModel {
  StatusModel({
      int? code, 
      String? message, 
      Result? result, 
      Options? options,}){
    _code = code;
    _message = message;
    _result = result;
    _options = options;
}

  StatusModel.fromJson(dynamic json) {
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
/// doc_url : "https://console.ron.digital/panel/doc/v1/route?name=status.read"

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

/// token : "3764373463393362ecfe9c6b0977a649"
/// conclusion : [{"id":1,"title":"Statu1","group_id":1,"settings":"settings","created_at":"2021-12-21T13:46:19.000000Z","updated_at":"2021-12-21T13:46:19.000000Z"},{"id":2,"title":"ron.digital","group_id":1,"settings":"settings","created_at":"2021-12-21T14:11:56.000000Z","updated_at":"2021-12-21T14:11:56.000000Z"},{"id":3,"title":"ron.digital","group_id":1,"settings":"settings","created_at":"2021-12-21T14:14:51.000000Z","updated_at":"2021-12-21T14:14:51.000000Z"},{"id":4,"title":"ron.digital","group_id":2,"settings":"settings","created_at":"2021-12-21T14:17:26.000000Z","updated_at":"2021-12-21T14:17:26.000000Z"},{"id":5,"title":"berat","group_id":1,"settings":"settings","created_at":"2021-12-21T14:18:49.000000Z","updated_at":"2021-12-21T14:18:49.000000Z"},{"id":6,"title":"berat","group_id":1,"settings":"settings","created_at":"2021-12-21T14:20:37.000000Z","updated_at":"2021-12-21T14:20:37.000000Z"},{"id":7,"title":"Mehmet Deneme","group_id":1,"settings":"settings","created_at":"2021-12-21T14:21:59.000000Z","updated_at":"2021-12-21T14:21:59.000000Z"},{"id":8,"title":"Mehmet Deneme","group_id":1,"settings":"[]","created_at":"2021-12-21T14:22:53.000000Z","updated_at":"2021-12-21T14:22:53.000000Z"}]

class Result {
  Result({
      String? token, 
      List<ConclusionStatus>? conclusion,}){
    _token = token;
    _conclusion = conclusion;
}

  Result.fromJson(dynamic json) {
    _token = json['token'];
    if (json['conclusion'] != null) {
      _conclusion = [];
      json['conclusion'].forEach((v) {
        _conclusion?.add(ConclusionStatus.fromJson(v));
      });
    }
  }
  String? _token;
  List<ConclusionStatus>? _conclusion;

  String? get token => _token;
  List<ConclusionStatus>? get conclusion => _conclusion;

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
/// title : "Statu1"
/// group_id : 1
/// settings : "settings"
/// created_at : "2021-12-21T13:46:19.000000Z"
/// updated_at : "2021-12-21T13:46:19.000000Z"

class ConclusionStatus {
  ConclusionStatus({
      int? id, 
      String? title, 
      int? groupId, 
      String? settings, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _title = title;
    _groupId = groupId;
    _settings = settings;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ConclusionStatus.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _groupId = json['group_id'];
    _settings = json['settings'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _title;
  int? _groupId;
  String? _settings;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get title => _title;
  int? get groupId => _groupId;
  String? get settings => _settings;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['group_id'] = _groupId;
    map['settings'] = _settings;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}