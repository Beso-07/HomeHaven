class ProductModel {
  int? id;
  String? name;
  String? description;
  double? price;
  int? categoryId;
  String? image;
  int? stock;
  double? rating;
  int? reviews;
  String? brand;
  String? createdAt;

  ProductModel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.categoryId,
      this.image,
      this.stock,
      this.rating,
      this.reviews,
      this.brand,
      this.createdAt});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    categoryId = json['categoryId'];
    image = json['image'];
    stock = json['stock'];
    rating = json['rating'];
    reviews = json['reviews'];
    brand = json['brand'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['categoryId'] = this.categoryId;
    data['image'] = this.image;
    data['stock'] = this.stock;
    data['rating'] = this.rating;
    data['reviews'] = this.reviews;
    data['brand'] = this.brand;
    data['createdAt'] = this.createdAt;
    return data;
  }
}