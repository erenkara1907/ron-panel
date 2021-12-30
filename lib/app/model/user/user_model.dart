/// code : 200
/// message : "Kullanıcı listeleme işleminiz başarılı bir şekilde gerçekleştirilmiştir."
/// result : {"token":"313634306663323502c88ebb97e2ca7e","conclusion":[{"id":1,"name":"Mehmet HAKKIOĞLU","email":"mehmet@ron.digital","email_verified_at":null,"created_at":"2021-12-15T11:29:19.000000Z","updated_at":"2021-12-15T11:29:19.000000Z"},{"id":2,"name":"Osman Berk AŞIK","email":"osmanberk@ron.digital","email_verified_at":null,"created_at":"2021-12-15T08:39:55.000000Z","updated_at":"2021-12-15T08:39:55.000000Z"},{"id":3,"name":"Eren Kara","email":"eren@ron.digital","email_verified_at":null,"created_at":"2021-12-17T12:37:18.000000Z","updated_at":"2021-12-17T12:37:18.000000Z"},{"id":4,"name":"Mehmet HAKKIOĞLU","email":"mehmet2@ron.digital","email_verified_at":null,"created_at":"2021-12-18T16:13:34.000000Z","updated_at":"2021-12-18T16:13:34.000000Z"},{"id":5,"name":"Mehmet HAKKIOĞLU","email":"mehmet@ron.digital3","email_verified_at":null,"created_at":"2021-12-18T16:23:54.000000Z","updated_at":"2021-12-18T16:23:54.000000Z"},{"id":6,"name":"Ahmet Kara","email":"ahmet@ron.digital","email_verified_at":null,"created_at":"2021-12-18T16:36:56.000000Z","updated_at":"2021-12-18T16:36:56.000000Z"}]}
/// options : {"columns":[{"title":"Adı Soyadı","name":"name"},{"title":"E-Posta","name":"email"},{"title":"E-Posta Doğrulaması","name":"email_verified_at"},{"title":"İşlemler","name":"id"}],"doc_url":"https://console.ron.digital/panel/doc/v1/route?name=user.read"}

class UserModel {
  UserModel({
      int? code, 
      String? message, 
      Result? result,
      Options? options,}){
    _code = code;
    _message = message;
    _result = result;
    _options = options;
}

  UserModel.fromJson(dynamic json) {
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

/// columns : [{"title":"Adı Soyadı","name":"name"},{"title":"E-Posta","name":"email"},{"title":"E-Posta Doğrulaması","name":"email_verified_at"},{"title":"İşlemler","name":"id"}]
/// doc_url : "https://console.ron.digital/panel/doc/v1/route?name=user.read"

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

/// title : "Adı Soyadı"
/// name : "name"

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

/// token : "313634306663323502c88ebb97e2ca7e"
/// conclusion : [{"id":1,"name":"Mehmet HAKKIOĞLU","email":"mehmet@ron.digital","email_verified_at":null,"created_at":"2021-12-15T11:29:19.000000Z","updated_at":"2021-12-15T11:29:19.000000Z"},{"id":2,"name":"Osman Berk AŞIK","email":"osmanberk@ron.digital","email_verified_at":null,"created_at":"2021-12-15T08:39:55.000000Z","updated_at":"2021-12-15T08:39:55.000000Z"},{"id":3,"name":"Eren Kara","email":"eren@ron.digital","email_verified_at":null,"created_at":"2021-12-17T12:37:18.000000Z","updated_at":"2021-12-17T12:37:18.000000Z"},{"id":4,"name":"Mehmet HAKKIOĞLU","email":"mehmet2@ron.digital","email_verified_at":null,"created_at":"2021-12-18T16:13:34.000000Z","updated_at":"2021-12-18T16:13:34.000000Z"},{"id":5,"name":"Mehmet HAKKIOĞLU","email":"mehmet@ron.digital3","email_verified_at":null,"created_at":"2021-12-18T16:23:54.000000Z","updated_at":"2021-12-18T16:23:54.000000Z"},{"id":6,"name":"Ahmet Kara","email":"ahmet@ron.digital","email_verified_at":null,"created_at":"2021-12-18T16:36:56.000000Z","updated_at":"2021-12-18T16:36:56.000000Z"}]

class Result {
  Result({
      String? token, 
      List<ConclusionUser>? conclusion,}){
    _token = token;
    _conclusion = conclusion;
}

  Result.fromJson(dynamic json) {
    _token = json['token'];
    if (json['conclusion'] != null) {
      _conclusion = [];
      json['conclusion'].forEach((v) {
        _conclusion?.add(ConclusionUser.fromJson(v));
      });
    }
  }
  String? _token;
  List<ConclusionUser>? _conclusion;

  String? get token => _token;
  List<ConclusionUser>? get conclusion => _conclusion;

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
/// name : "Mehmet HAKKIOĞLU"
/// email : "mehmet@ron.digital"
/// email_verified_at : null
/// created_at : "2021-12-15T11:29:19.000000Z"
/// updated_at : "2021-12-15T11:29:19.000000Z"

class ConclusionUser {
  ConclusionUser({
      int? id, 
      String? name, 
      String? email, 
      dynamic emailVerifiedAt, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ConclusionUser.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _email;
  dynamic _emailVerifiedAt;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  String? get email => _email;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['email_verified_at'] = _emailVerifiedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}