class StatusGroupRequestModel {
  String? title;
  String? options;

  StatusGroupRequestModel({this.title, this.options});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};

    data['title'] = title;
    data['options'] = options;
    return data;
  }
}