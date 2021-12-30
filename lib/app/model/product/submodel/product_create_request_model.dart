class ProductCreateRequestModel {
  String? title;
  int? categoryId;
  String? price;
  String? serialNumber;

  ProductCreateRequestModel(
      {this.title, this.categoryId, this.price, this.serialNumber});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['title'] = title;
    data['category_id'] = categoryId;
    data['price'] = price;
    data['serial_number'] = serialNumber;
    return data;
  }
}
