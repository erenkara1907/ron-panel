/// code : 200
/// message : "Departman listeleme işleminiz başarılı bir şekilde gerçekleştirilmiştir."
/// result : {"token":"343030393733363680ca13afdd9a2b4e","conclusion":[{"id":1,"title":"WebDeneme","parent_type":"parent","parent_id":null,"admin_id":1,"removed":"N","created_at":"2021-12-19T00:40:08.000000Z","updated_at":"2021-12-19T00:40:08.000000Z"},{"id":2,"title":"WebDeneme","parent_type":"child","parent_id":1,"admin_id":1,"removed":"N","created_at":"2021-12-19T00:41:29.000000Z","updated_at":"2021-12-19T00:41:29.000000Z"},{"id":3,"title":"WebDeneme","parent_type":"child","parent_id":1,"admin_id":1,"removed":"N","created_at":"2021-12-19T00:41:34.000000Z","updated_at":"2021-12-19T00:41:34.000000Z"}]}
/// options : {"columns":[{"title":"Başlık","name":"title"},{"title":"Bağlı Departman","name":"parent_id"},{"title":"Yöneticisi","name":"admin_id"},{"title":"İşlemler","name":"id"}],"doc_url":"https://console.ron.digital/panel/doc/v1/route?name=department.read"}

class DepartmentModel {
  DepartmentModel({
      int? code, 
      String? message, 
      Result? result, 
      Options? options,}){
    _code = code;
    _message = message;
    _result = result;
    _options = options;
}

  DepartmentModel.fromJson(dynamic json) {
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

/// columns : [{"title":"Başlık","name":"title"},{"title":"Bağlı Departman","name":"parent_id"},{"title":"Yöneticisi","name":"admin_id"},{"title":"İşlemler","name":"id"}]
/// doc_url : "https://console.ron.digital/panel/doc/v1/route?name=department.read"

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

/// token : "343030393733363680ca13afdd9a2b4e"
/// conclusion : [{"id":1,"title":"WebDeneme","parent_type":"parent","parent_id":null,"admin_id":1,"removed":"N","created_at":"2021-12-19T00:40:08.000000Z","updated_at":"2021-12-19T00:40:08.000000Z"},{"id":2,"title":"WebDeneme","parent_type":"child","parent_id":1,"admin_id":1,"removed":"N","created_at":"2021-12-19T00:41:29.000000Z","updated_at":"2021-12-19T00:41:29.000000Z"},{"id":3,"title":"WebDeneme","parent_type":"child","parent_id":1,"admin_id":1,"removed":"N","created_at":"2021-12-19T00:41:34.000000Z","updated_at":"2021-12-19T00:41:34.000000Z"}]

class Result {
  Result({
      dynamic token,
      List<ConclusionDepartment>? conclusion,}){
    _token = token;
    _conclusion = conclusion;
}

  Result.fromJson(dynamic json) {
    _token = json['token'];
    if (json['conclusion'] != null) {
      _conclusion = [];
      json['conclusion'].forEach((v) {
        _conclusion?.add(ConclusionDepartment.fromJson(v));
      });
    }
  }
  dynamic _token;
  List<ConclusionDepartment>? _conclusion;

  dynamic get token => _token;
  List<ConclusionDepartment>? get conclusion => _conclusion;

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
/// title : "WebDeneme"
/// parent_type : "parent"
/// parent_id : null
/// admin_id : 1
/// removed : "N"
/// created_at : "2021-12-19T00:40:08.000000Z"
/// updated_at : "2021-12-19T00:40:08.000000Z"

class ConclusionDepartment {
  ConclusionDepartment({
      int? id, 
      String? title, 
      String? parentType, 
      dynamic parentId, 
      int? adminId, 
      String? removed, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _title = title;
    _parentType = parentType;
    _parentId = parentId;
    _adminId = adminId;
    _removed = removed;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ConclusionDepartment.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _parentType = json['parent_type'];
    _parentId = json['parent_id'];
    _adminId = json['admin_id'];
    _removed = json['removed'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _title;
  String? _parentType;
  dynamic _parentId;
  int? _adminId;
  String? _removed;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get title => _title;
  String? get parentType => _parentType;
  dynamic get parentId => _parentId;
  int? get adminId => _adminId;
  String? get removed => _removed;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['parent_type'] = _parentType;
    if(map['parent_type'] == 'child'){
      map['parent_id'] = _parentId;
    }
    map['admin_id'] = _adminId;
    map['removed'] = _removed;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}