class CartItemModel{
  String productId ;
  String title ;
  double? price ;
  String? image ;
  int quantity ;
  String variationId ;
  String? brandName ;
  Map<String, String>? selectedVariation ;


  CartItemModel({
    required this.productId ,
    required this.quantity ,
     this.variationId = '' ,
     this.image ,
     this.price = 0.0  ,
     this.title='' ,
     this.brandName ,
     this.selectedVariation ,
}) ;

  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0) ;

  Map<String , dynamic> toJson(){
    return {
      'ProductId' : productId ,
      'Title' : title ,
      'Price' : price ,
      'Image' : image ,
      'Quantity' : quantity ,
      'VariationId' : variationId ,
      'BrandName' : brandName ,
      'SelectedVariation' : selectedVariation ,
    };
  }

  factory CartItemModel.fromJson(Map<String , dynamic> json) {
    return CartItemModel(
        productId: json['ProductId'],
      title: json['Title'] ,
      price: json['Price'] ,
      quantity: json['Quantity'] ,
      image: json['Image'] ,
      variationId: json['VariationId'] ,
      brandName: json['BrandName'] ,
      selectedVariation: json['SelectedVariation'] ,
    );
  }


}