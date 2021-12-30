class DepartmentRequestModel {
  String? title;
  String? parentType;
  int? parentId;
  int? adminId;

  DepartmentRequestModel(
      {this.title, this.parentType, this.parentId, this.adminId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['parent_type'] = parentType;
    if (data['parent_type'] == 'child') {
      data['parent_id'] = parentId;
    }
    data['admin_id'] = adminId;
    return data;
  }
}
