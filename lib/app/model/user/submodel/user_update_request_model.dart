class UserUpdateRequestModel {
  String? name;
  String? email;
  String? password;

  UserUpdateRequestModel({this.name, this.email, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

      data['name'] = name;


    data['email'] = email;

    data['password'] = password;

    return data;
  }
}