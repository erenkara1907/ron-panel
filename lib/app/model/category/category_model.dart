import 'package:get/get.dart';

/// code : 200
/// message : "Kategori listeleme işleminiz başarılı bir şekilde gerçekleştirilmiştir."
/// result : {"token":"6431393166633736c5b52d47b06a21f6","conclusion":[{"id":1,"title":"Genel","slug":"genel","parent_type":"parent","parent_id":null,"created_at":"2021-12-15T10:49:16.000000Z","updated_at":"2021-12-19T15:10:53.000000Z"},{"id":2,"title":"Bilgisayar","slug":"bilgisayar","parent_type":"parent","parent_id":null,"created_at":"2021-12-18T21:29:29.000000Z","updated_at":"2021-12-18T21:29:29.000000Z"},{"id":3,"title":"Deneme Falan","slug":"deneme-falan","parent_type":"parent","parent_id":1,"created_at":"2021-12-18T21:37:26.000000Z","updated_at":"2021-12-18T21:37:26.000000Z"},{"id":4,"title":"Deneme Falan 2","slug":"deneme-falan-2","parent_type":"parent","parent_id":1,"created_at":"2021-12-18T21:42:34.000000Z","updated_at":"2021-12-18T21:42:34.000000Z"},{"id":5,"title":"Deneme Falan 3","slug":"deneme-falan-3","parent_type":"child","parent_id":1,"created_at":"2021-12-18T21:44:23.000000Z","updated_at":"2021-12-18T21:44:23.000000Z"},{"id":6,"title":"Deneme Falan 3","slug":"deneme-falan-3","parent_type":"parent","parent_id":null,"created_at":"2021-12-18T21:45:05.000000Z","updated_at":"2021-12-18T21:45:05.000000Z"},{"id":7,"title":"eren kara","slug":"eren-kara","parent_type":"child","parent_id":2,"created_at":"2021-12-18T21:54:02.000000Z","updated_at":"2021-12-18T21:54:02.000000Z"},{"id":8,"title":"asdsssdsa","slug":"asdsssdsa","parent_type":"parent","parent_id":null,"created_at":"2021-12-18T22:07:34.000000Z","updated_at":"2021-12-18T22:07:34.000000Z"},{"id":9,"title":"sadaddda","slug":"sadaddda","parent_type":"parent","parent_id":null,"created_at":"2021-12-18T22:08:53.000000Z","updated_at":"2021-12-18T22:08:53.000000Z"},{"id":10,"title":"deneme 34","slug":"deneme-34","parent_type":"parent","parent_id":null,"created_at":"2021-12-18T22:12:37.000000Z","updated_at":"2021-12-18T22:12:37.000000Z"},{"id":11,"title":"deneme. 16","slug":"deneme-16","parent_type":"parent","parent_id":null,"created_at":"2021-12-18T22:18:27.000000Z","updated_at":"2021-12-18T22:18:27.000000Z"},{"id":12,"title":"asd 12","slug":"asd-12","parent_type":"parent","parent_id":null,"created_at":"2021-12-18T22:20:40.000000Z","updated_at":"2021-12-18T22:20:40.000000Z"},{"id":13,"title":"asd 15","slug":"asd-15","parent_type":"parent","parent_id":null,"created_at":"2021-12-18T22:25:06.000000Z","updated_at":"2021-12-18T22:25:06.000000Z"},{"id":14,"title":"baslik","slug":"baslik","parent_type":"parent","parent_id":null,"created_at":"2021-12-18T22:32:53.000000Z","updated_at":"2021-12-18T22:32:53.000000Z"},{"id":15,"title":"WebDeneme","slug":"webdeneme","parent_type":"parent","parent_id":null,"created_at":"2021-12-19T00:13:49.000000Z","updated_at":"2021-12-19T00:13:49.000000Z"},{"id":16,"title":"WebDeneme","slug":"webdeneme","parent_type":"child","parent_id":null,"created_at":"2021-12-19T00:16:51.000000Z","updated_at":"2021-12-19T15:13:38.000000Z"},{"id":17,"title":"deneme parent","slug":"deneme-parent","parent_type":"parent","parent_id":null,"created_at":"2021-12-19T15:46:40.000000Z","updated_at":"2021-12-19T15:46:40.000000Z"}]}
/// options : {"columns":[{"title":"Başlık","name":"title"},{"title":"İşlemler","name":"id"}],"doc_url":"https://console.ron.digital/panel/doc/v1/route?name=category.read"}

class CategoryModel {
  CategoryModel({
    int? code,
    String? message,
    Result? result,
    Options? options,
  }) {
    _code = code;
    _message = message;
    _result = result;
    _options = options;
  }

  CategoryModel.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _result = json['result'] != null ? Result.fromJson(json['result']) : null;
    _options =
        json['options'] != null ? Options.fromJson(json['options']) : null;
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
/// doc_url : "https://console.ron.digital/panel/doc/v1/route?name=category.read"

class Options {
  Options({
    List<Columns>? columns,
    dynamic docUrl,
  }) {
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

/// title : "Başlık"
/// name : "title"

class Columns {
  Columns({
    String? title,
    String? name,
  }) {
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

/// token : "6431393166633736c5b52d47b06a21f6"
/// conclusion : [{"id":1,"title":"Genel","slug":"genel","parent_type":"parent","parent_id":null,"created_at":"2021-12-15T10:49:16.000000Z","updated_at":"2021-12-19T15:10:53.000000Z"},{"id":2,"title":"Bilgisayar","slug":"bilgisayar","parent_type":"parent","parent_id":null,"created_at":"2021-12-18T21:29:29.000000Z","updated_at":"2021-12-18T21:29:29.000000Z"},{"id":3,"title":"Deneme Falan","slug":"deneme-falan","parent_type":"parent","parent_id":1,"created_at":"2021-12-18T21:37:26.000000Z","updated_at":"2021-12-18T21:37:26.000000Z"},{"id":4,"title":"Deneme Falan 2","slug":"deneme-falan-2","parent_type":"parent","parent_id":1,"created_at":"2021-12-18T21:42:34.000000Z","updated_at":"2021-12-18T21:42:34.000000Z"},{"id":5,"title":"Deneme Falan 3","slug":"deneme-falan-3","parent_type":"child","parent_id":1,"created_at":"2021-12-18T21:44:23.000000Z","updated_at":"2021-12-18T21:44:23.000000Z"},{"id":6,"title":"Deneme Falan 3","slug":"deneme-falan-3","parent_type":"parent","parent_id":null,"created_at":"2021-12-18T21:45:05.000000Z","updated_at":"2021-12-18T21:45:05.000000Z"},{"id":7,"title":"eren kara","slug":"eren-kara","parent_type":"child","parent_id":2,"created_at":"2021-12-18T21:54:02.000000Z","updated_at":"2021-12-18T21:54:02.000000Z"},{"id":8,"title":"asdsssdsa","slug":"asdsssdsa","parent_type":"parent","parent_id":null,"created_at":"2021-12-18T22:07:34.000000Z","updated_at":"2021-12-18T22:07:34.000000Z"},{"id":9,"title":"sadaddda","slug":"sadaddda","parent_type":"parent","parent_id":null,"created_at":"2021-12-18T22:08:53.000000Z","updated_at":"2021-12-18T22:08:53.000000Z"},{"id":10,"title":"deneme 34","slug":"deneme-34","parent_type":"parent","parent_id":null,"created_at":"2021-12-18T22:12:37.000000Z","updated_at":"2021-12-18T22:12:37.000000Z"},{"id":11,"title":"deneme. 16","slug":"deneme-16","parent_type":"parent","parent_id":null,"created_at":"2021-12-18T22:18:27.000000Z","updated_at":"2021-12-18T22:18:27.000000Z"},{"id":12,"title":"asd 12","slug":"asd-12","parent_type":"parent","parent_id":null,"created_at":"2021-12-18T22:20:40.000000Z","updated_at":"2021-12-18T22:20:40.000000Z"},{"id":13,"title":"asd 15","slug":"asd-15","parent_type":"parent","parent_id":null,"created_at":"2021-12-18T22:25:06.000000Z","updated_at":"2021-12-18T22:25:06.000000Z"},{"id":14,"title":"baslik","slug":"baslik","parent_type":"parent","parent_id":null,"created_at":"2021-12-18T22:32:53.000000Z","updated_at":"2021-12-18T22:32:53.000000Z"},{"id":15,"title":"WebDeneme","slug":"webdeneme","parent_type":"parent","parent_id":null,"created_at":"2021-12-19T00:13:49.000000Z","updated_at":"2021-12-19T00:13:49.000000Z"},{"id":16,"title":"WebDeneme","slug":"webdeneme","parent_type":"child","parent_id":null,"created_at":"2021-12-19T00:16:51.000000Z","updated_at":"2021-12-19T15:13:38.000000Z"},{"id":17,"title":"deneme parent","slug":"deneme-parent","parent_type":"parent","parent_id":null,"created_at":"2021-12-19T15:46:40.000000Z","updated_at":"2021-12-19T15:46:40.000000Z"}]

class Result {
  Result({
    dynamic token,
    List<ConclusionCategory>? conclusion,
  }) {
    _token = token;
    _conclusion = conclusion;
  }

  Result.fromJson(dynamic json) {
    _token = json['token'];
    if (json['conclusion'] != null) {
      _conclusion = [];
      json['conclusion'].forEach((v) {
        _conclusion?.add(ConclusionCategory.fromJson(v));
      });
    }
  }

  dynamic _token;
  List<ConclusionCategory>? _conclusion;

  dynamic get token => _token;

  List<ConclusionCategory>? get conclusion => _conclusion;

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
/// title : "Genel"
/// slug : "genel"
/// parent_type : "parent"
/// parent_id : null
/// created_at : "2021-12-15T10:49:16.000000Z"
/// updated_at : "2021-12-19T15:10:53.000000Z"

class ConclusionCategory {
  ConclusionCategory({
    int? id,
    String? title,
    String? slug,
    String? parentType,
    dynamic parentId,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _title = title;
    _slug = slug;
    _parentType = parentType;
    _parentId = parentId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  ConclusionCategory.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _slug = json['slug'];
    _parentType = json['parent_type'];
    _parentId = json['parent_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  String? _title;
  String? _slug;
  String? _parentType;
  dynamic _parentId;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;

  String? get title => _title;

  String? get slug => _slug;

  String? get parentType => _parentType;

  dynamic get parentId => _parentId;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['slug'] = _slug;
    map['parent_type'] = _parentType;
    map['parent_id'] = _parentId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
