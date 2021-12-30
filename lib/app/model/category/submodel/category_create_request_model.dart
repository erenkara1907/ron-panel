class CategoryCreateRequestModel {
  String? title;
  String? parentType;
  int? parentId;

  CategoryCreateRequestModel({this.title, this.parentType, this.parentId});

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
      data['title'] = title;
      data['parent_type'] = parentType;
    if(data['parent_type'] == 'child'){
      data['parent_id'] = parentId;
    }
    return data;
  }
}