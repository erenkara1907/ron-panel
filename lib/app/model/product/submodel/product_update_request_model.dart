class ProductUpdateRequestModel {
  String? title;
  int? categoryId;
  String? price;
  String? serialNumber;

  ProductUpdateRequestModel(
      {this.title, this.categoryId, this.price, this.serialNumber});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['title'] = title;
    if(data['category_id'] != null){
      data['category_id'] = categoryId;
    }
    if(data['price'] != null){
      data['price'] = price;
    }
    if(data['serial_number'] != null){
      data['serial_number'] = serialNumber;
    }
    return data;
  }
}
