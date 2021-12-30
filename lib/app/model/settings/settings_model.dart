// To parse this JSON data, do
//
//     final settingsModel = settingsModelFromJson(jsonString);

import 'dart:convert';

class SettingsModel {
  SettingsModel({
    this.sidebar,
    this.userInfo,
  });

  List<SidebarItem>? sidebar;
  UserInfo? userInfo;

  factory SettingsModel.fromRawJson(String str) => SettingsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
    sidebar: List<SidebarItem>.from(json["sidebar"]!.map((x) => SidebarItem.fromJson(x))),
    userInfo: UserInfo.fromJson(json["user_info"]),
  );

  Map<String, dynamic> toJson() => {
    "sidebar": List<dynamic>.from(sidebar!.map((x) => x.toJson())),
    "user_info": userInfo!.toJson(),
  };
}

class SidebarItem {
  SidebarItem({
    this.title,
    this.icon,
    this.route,
    this.child,
  });

  String? title;
  dynamic icon;
  String? route;
  List<Child>? child;

  factory SidebarItem.fromRawJson(String str) => SidebarItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SidebarItem.fromJson(Map<String, dynamic> json) => SidebarItem(
    title: json["title"],
    icon: json["icon"],
    route: json["route"] == null ? null : json["route"],
    child: List<Child>.from(json["child"].map((x) => Child.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "icon": icon,
    "route": route == null ? null : route,
    "child": List<dynamic>.from(child!.map((x) => x.toJson())),
  };
}

class Child {
  Child({
    this.title,
    this.route,
  });

  String? title;
  String? route;

  factory Child.fromRawJson(String str) => Child.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Child.fromJson(Map<String, dynamic> json) => Child(
    title: json["title"],
    route: json["route"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "route": route,
  };
}

class UserInfo {
  UserInfo({
    this.name,
    this.email,
    this.permission,
    this.id,
  });

  int? id;
  String? name;
  String? email;
  String? permission;

  factory UserInfo.fromRawJson(String str) => UserInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json['id'],
    name: json["name"],
    email: json["email"],
    permission: json["permission"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "permission": permission,
  };
}
