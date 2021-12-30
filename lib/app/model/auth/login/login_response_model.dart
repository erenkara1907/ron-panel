// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

class LoginResponseModel {
  LoginResponseModel({
    this.code,
    this.message,
    this.result,
    this.options,
  });

  int? code;
  String? message;
  Result? result;
  Options? options;

  factory LoginResponseModel.fromRawJson(String str) => LoginResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    code: json["code"],
    message: json["message"],
    result: Result.fromJson(json["result"]),
    options: Options.fromJson(json["options"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "result": result!.toJson(),
    "options": options!.toJson(),
  };
}

class Options {
  Options({
    this.columns,
    this.docUrl,
  });

  List<dynamic>? columns;
  String? docUrl;

  factory Options.fromRawJson(String str) => Options.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Options.fromJson(Map<String, dynamic> json) => Options(
    columns: List<dynamic>.from(json["columns"].map((x) => x)),
    docUrl: json["doc_url"],
  );

  Map<String, dynamic> toJson() => {
    "columns": List<dynamic>.from(columns!.map((x) => x)),
    "doc_url": docUrl,
  };
}

class Result {
  Result({
    this.token,
    this.conclusion,
  });

  String? token;
  bool? conclusion;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    token: json["token"],
    conclusion: json["conclusion"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "conclusion": conclusion,
  };
}
