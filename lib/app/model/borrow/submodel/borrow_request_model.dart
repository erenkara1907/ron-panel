class BorrowRequestModel {
  int? userId;
  int? productId;
  String? description;
  String? startDate;
  String? endDate;

  BorrowRequestModel({
    this.userId,
    this.productId,
    this.description,
    this.startDate,
    this.endDate,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['description'] = description;
    data['start_date'] = startDate;
    if(data['end_date'] != null){
      data['end_date'] = endDate;
    }
    return data;
  }
}
