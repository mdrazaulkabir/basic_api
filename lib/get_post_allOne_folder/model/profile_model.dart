class ProfileModel {
  final String id;
  final String productName;
  double productCode;
  final String image;
  double productQty;
  double productPrice;
  double TotalPrice;
  MoreInfo? moreInfo;

  ProfileModel({
    required this.id,
    required this.productName,
    required this.productCode,
    required this.image,
    required this.productQty,
    required this.productPrice,
    required this.TotalPrice,
    this.moreInfo,
  });
  factory ProfileModel.fromJson(Map<String, dynamic> json){
    return ProfileModel(
        id: json['_id'] ?? 'Null',
        productName: json['ProductName'] ?? 'Null',
        productCode: json['ProductCode'] ?? 0.toDouble(),
        image: json['Img'] ?? 'Null',
        productQty: json['Qty'] ?? 0.toDouble(),
        productPrice: json['UnitPrice'] ?? 0.toDouble(),
        TotalPrice: json['TotalPrice'] ?? 0.toDouble(),
        moreInfo: MoreInfo.formJson(json['moreInfo']), //when need to nested list
    );
  }
}

class MoreInfo {
  final String name;
  final String name1;
  final String name2;

  MoreInfo({required this.name, required this.name1, required this.name2});

  factory MoreInfo.formJson(Map<String, dynamic>json){
    return MoreInfo(
        name: json['name'], name1: json['name1'], name2: json['name2']);
  }

}
