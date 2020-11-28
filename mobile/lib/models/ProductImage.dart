class ProductImage {
  String id;
  String dir;

  ProductImage({this.id, this.dir});

  static ProductImage fromJson(Map<String, dynamic> json){
    return ProductImage(
      id : json['_id'],
      dir : json['dir']
    );
  }

  static List<ProductImage> listFromJson(List json){
    List<ProductImage> ingredients = [];
    json.forEach((element) {
       ingredients.add(ProductImage.fromJson(element));
     });
    return ingredients;
  }
}