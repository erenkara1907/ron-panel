class UserCreateRequestModel {
  String? name;
  String? email;
  String? password;

  UserCreateRequestModel({this.name, this.email, this.password});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();

      data['name'] = name;


      data['email'] = email;



      data['password'] = password;

    return data;
  }
}