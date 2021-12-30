// To parse this JSON data, do
//
//     final userCreateResponseModel = userCreateResponseModelFromJson(jsonString);

import 'dart:convert';

class UserCreateResponseModel {
  UserCreateResponseModel({
    this.code,
    this.message,
    this.result,
    this.options,
  });

  int? code;
  String? message;
  Result? result;
  Options? options;

  factory UserCreateResponseModel.fromRawJson(String str) => UserCreateResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserCreateResponseModel.fromJson(Map<String, dynamic> json) => UserCreateResponseModel(
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
    this.form,
    this.docUrl,
  });

  List<dynamic>? form;
  String? docUrl;

  factory Options.fromRawJson(String str) => Options.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Options.fromJson(Map<String, dynamic> json) => Options(
    form: List<dynamic>.from(json["form"].map((x) => x)),
    docUrl: json["doc_url"],
  );

  Map<String, dynamic> toJson() => {
    "form": List<dynamic>.from(form!.map((x) => x)),
    "doc_url": docUrl,
  };
}

class Result {
  Result({
    this.token,
    this.conclusion,
  });

  String? token;
  Conclusion? conclusion;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    token: json["token"],
    conclusion: Conclusion.fromJson(json["conclusion"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "conclusion": conclusion!.toJson(),
  };
}

class Conclusion {
  Conclusion({
    this.id,
  });

  int? id;

  factory Conclusion.fromRawJson(String str) => Conclusion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Conclusion.fromJson(Map<String, dynamic> json) => Conclusion(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}
