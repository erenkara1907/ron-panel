/// code : 200
/// message : "Ödünç alma listeleme işleminiz başarılı bir şekilde gerçekleştirilmiştir."
/// result : {"token":"306430336165353930291de0293edbef","conclusion":[{"id":1,"action_code":"41afe9bb","user_id":1,"product_id":2,"description":"Bu işlem, seeder aracılığıyla gerçekleştirilmiştir.","start_date":"2021-12-15 16:28:12","end_date":null,"created_at":"2021-12-15T16:28:12.000000Z","updated_at":"2021-12-15T16:28:12.000000Z"},{"id":2,"action_code":"35502916","user_id":1,"product_id":4,"description":"WebDeneme","start_date":"2021-12-19 04:51:00","end_date":"2021-12-19 04:52:00","created_at":"2021-12-19T01:51:41.000000Z","updated_at":"2021-12-19T01:51:41.000000Z"},{"id":3,"action_code":"06b2da30","user_id":1,"product_id":4,"description":"WebDeneme","start_date":"2021-12-19 04:51:00","end_date":"2021-12-19 04:52:00","created_at":"2021-12-19T01:51:48.000000Z","updated_at":"2021-12-19T01:51:48.000000Z"}]}
/// options : {"columns":[{"title":"İşlem Kodu","name":"action_code"},{"title":"Personel","name":"user_id"},{"title":"Ürün","name":"product_id"},{"title":"Alış Tarihi","name":"start_date"},{"title":"Teslim Tarihi","name":"end_date"},{"title":"İşlemler","name":"id"}],"doc_url":"https://console.ron.digital/panel/doc/v1/route?name=borrow.read"}

class BorrowModel {
  BorrowModel({
      int? code, 
      String? message, 
      Result? result, 
      Options? options,}){
    _code = code;
    _message = message;
    _result = result;
    _options = options;
}

  BorrowModel.fromJson(dynamic json) {
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

/// columns : [{"title":"İşlem Kodu","name":"action_code"},{"title":"Personel","name":"user_id"},{"title":"Ürün","name":"product_id"},{"title":"Alış Tarihi","name":"start_date"},{"title":"Teslim Tarihi","name":"end_date"},{"title":"İşlemler","name":"id"}]
/// doc_url : "https://console.ron.digital/panel/doc/v1/route?name=borrow.read"

class Options {
  Options({
      List<Columns>? columns, 
      dynamic docUrl,}){
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
  dynamic _docUrl;

  List<Columns>? get columns => _columns;
  dynamic get docUrl => _docUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_columns != null) {
      map['columns'] = _columns?.map((v) => v.toJson()).toList();
    }
    map['doc_url'] = _docUrl;
    return map;
  }

}

/// title : "İşlem Kodu"
/// name : "action_code"

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

/// token : "306430336165353930291de0293edbef"
/// conclusion : [{"id":1,"action_code":"41afe9bb","user_id":1,"product_id":2,"description":"Bu işlem, seeder aracılığıyla gerçekleştirilmiştir.","start_date":"2021-12-15 16:28:12","end_date":null,"created_at":"2021-12-15T16:28:12.000000Z","updated_at":"2021-12-15T16:28:12.000000Z"},{"id":2,"action_code":"35502916","user_id":1,"product_id":4,"description":"WebDeneme","start_date":"2021-12-19 04:51:00","end_date":"2021-12-19 04:52:00","created_at":"2021-12-19T01:51:41.000000Z","updated_at":"2021-12-19T01:51:41.000000Z"},{"id":3,"action_code":"06b2da30","user_id":1,"product_id":4,"description":"WebDeneme","start_date":"2021-12-19 04:51:00","end_date":"2021-12-19 04:52:00","created_at":"2021-12-19T01:51:48.000000Z","updated_at":"2021-12-19T01:51:48.000000Z"}]

class Result {
  Result({
      dynamic token,
      List<ConclusionBorrow>? conclusion,}){
    _token = token;
    _conclusion = conclusion;
}

  Result.fromJson(dynamic json) {
    _token = json['token'];
    if (json['conclusion'] != null) {
      _conclusion = [];
      json['conclusion'].forEach((v) {
        _conclusion?.add(ConclusionBorrow.fromJson(v));
      });
    }
  }
  dynamic _token;
  List<ConclusionBorrow>? _conclusion;

  dynamic get token => _token;
  List<ConclusionBorrow>? get conclusion => _conclusion;

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
/// action_code : "41afe9bb"
/// user_id : 1
/// product_id : 2
/// description : "Bu işlem, seeder aracılığıyla gerçekleştirilmiştir."
/// start_date : "2021-12-15 16:28:12"
/// end_date : null
/// created_at : "2021-12-15T16:28:12.000000Z"
/// updated_at : "2021-12-15T16:28:12.000000Z"

class ConclusionBorrow {
  ConclusionBorrow({
      int? id, 
      String? actionCode, 
      int? userId, 
      int? productId, 
      String? description, 
      String? startDate, 
      dynamic endDate, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _actionCode = actionCode;
    _userId = userId;
    _productId = productId;
    _description = description;
    _startDate = startDate;
    _endDate = endDate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ConclusionBorrow.fromJson(dynamic json) {
    _id = json['id'];
    _actionCode = json['action_code'];
    _userId = json['user_id'];
    _productId = json['product_id'];
    _description = json['description'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _actionCode;
  int? _userId;
  int? _productId;
  String? _description;
  String? _startDate;
  dynamic _endDate;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get actionCode => _actionCode;
  int? get userId => _userId;
  int? get productId => _productId;
  String? get description => _description;
  String? get startDate => _startDate;
  dynamic get endDate => _endDate;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['action_code'] = _actionCode;
    map['user_id'] = _userId;
    map['product_id'] = _productId;
    map['description'] = _description;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}