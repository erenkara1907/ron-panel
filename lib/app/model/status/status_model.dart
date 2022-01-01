/// code : 200
/// message : "Statüler modülünde status.read yolunda 200 hata dönüşü gerçekleşti."
/// result : {"token":"dbdddec07a3edd205e901a833df06db9defb5d2ce02366085c6c1a654588d92b","conclusion":[{"id":1,"title":"jahah","group":"statü grup mobil"},{"id":2,"title":"statü 34","group":"sehr"},{"id":3,"title":"statu","group":"statü grup mobil"},{"id":4,"title":"baslik.  statuuus","group":"statu grubu"},{"id":5,"title":"as","group":"statu grubu"}]}
/// options : {"columns":[{"title":"Başlık","name":"title"},{"title":"Grup","name":"group"},{"title":"İşlemler","name":"id"}],"doc_url":"https://console.ron.digital/panel/doc/v1/route?name=status.read"}

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

/// columns : [{"title":"Başlık","name":"title"},{"title":"Grup","name":"group"},{"title":"İşlemler","name":"id"}]
/// doc_url : "https://console.ron.digital/panel/doc/v1/route?name=status.read"

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

/// token : "dbdddec07a3edd205e901a833df06db9defb5d2ce02366085c6c1a654588d92b"
/// conclusion : [{"id":1,"title":"jahah","group":"statü grup mobil"},{"id":2,"title":"statü 34","group":"sehr"},{"id":3,"title":"statu","group":"statü grup mobil"},{"id":4,"title":"baslik.  statuuus","group":"statu grubu"},{"id":5,"title":"as","group":"statu grubu"}]

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
/// title : "jahah"
/// group : "statü grup mobil"

class ConclusionStatus {
  ConclusionStatus({
      int? id, 
      String? title, 
      String? group,}){
    _id = id;
    _title = title;
    _group = group;
}

  ConclusionStatus.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _group = json['group'];
  }
  int? _id;
  String? _title;
  String? _group;

  int? get id => _id;
  String? get title => _title;
  String? get group => _group;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['group'] = _group;
    return map;
  }

}