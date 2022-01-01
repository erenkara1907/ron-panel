class StatusRequestModel {
  String? title;
  int? group_id;
  String? settings;

  StatusRequestModel({this.title, this.settings, this.group_id});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;

    if(data['settings'] != null){
      data['settings'] = settings;
    }
    data['group_id'] = group_id;

    return data;
  }
}
