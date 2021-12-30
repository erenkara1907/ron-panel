class RegisterRequestModel {
  String? name;
  String? email;
  String? password;

  RegisterRequestModel({this.name, this.email, this.password});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}