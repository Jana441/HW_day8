
class Product {
 final int? id;
  final String? title;
   final double? price;
  final String? thumbnail;
  final String? category;

Product({
  this.id, 
  this.title, 
  this.price, 
  this.thumbnail, 
  this.category});






  factory Product.fromJson(Map <String,dynamic>json){
    return Product(
      id: json["id"],
      title: json["title"],
     price: json["price"],
     thumbnail :json["thumbnail"],
      category :json["category"],
    );
  } }