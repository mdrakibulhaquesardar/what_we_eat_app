import 'dart:convert';

class GetProductByCategoryIdModel {
  String? message;
  int? total;
  List<Product>? products;

  GetProductByCategoryIdModel({
    this.message,
    this.total,
    this.products,
  });

  GetProductByCategoryIdModel copyWith({
    String? message,
    int? total,
    List<Product>? products,
  }) =>
      GetProductByCategoryIdModel(
        message: message ?? this.message,
        total: total ?? this.total,
        products: products ?? this.products,
      );

  factory GetProductByCategoryIdModel.fromJson(String str) => GetProductByCategoryIdModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetProductByCategoryIdModel.fromMap(Map<String, dynamic> json) => GetProductByCategoryIdModel(
    message: json["message"],
    total: json["total"],
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "total": total,
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toMap())),
  };
}

class Product {
  int? id;
  String? name;
  String? slug;
  String? displayName;
  String? unit_size;
  String? unit_type;
  String? Product_Category;
  String? Product_Sub_Category;
  String? barCode;
  String? description;
  String? price;
  String? imageUrl;
  String? ingredients;
  int? categoryId;
  String? categoryName;
  String? countryName;
  String? brandName;
  Nutrition? nutrition;

  Product({
    this.id,
    this.name,
    this.slug,
    this.displayName,
    this.unit_size,
    this.unit_type,
    this.Product_Category,
    this.Product_Sub_Category,
    this.barCode,
    this.description,
    this.price,
    this.imageUrl,
    this.ingredients,
    this.categoryId,
    this.categoryName,
    this.countryName,
    this.brandName,
    this.nutrition,
  });

  Product copyWith({
    int? id,
    String? name,
    String? slug,
    String? displayName,
    String? unit_size,
    String? unit_type,
    String? Product_Category,
    String? Product_Sub_Category,
    String? barCode,
    String? description,
    String? price,
    String? imageUrl,
    String? ingredients,
    int? categoryId,
    String? categoryName,
    String? countryName,
    String? brandName,
    Nutrition? nutrition,
  }) =>
      Product(
        id: id ?? this.id,
        slug: slug ?? this.slug,
        name: name ?? this.name,
        displayName: displayName ?? this.displayName,
        unit_size: unit_size ?? this.unit_size,
        unit_type: unit_type?? this.unit_type,
        Product_Category: Product_Category ?? this.Product_Category,
        Product_Sub_Category: Product_Sub_Category ?? this.Product_Sub_Category,
        barCode: barCode ?? this.barCode,
        description: description ?? this.description,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl,
        ingredients: ingredients ?? this.ingredients,
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        countryName: countryName ?? this.countryName,
        brandName: brandName ?? this.brandName,
        nutrition: nutrition ?? this.nutrition,
      );

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    displayName: json["display_name"],
    barCode: json["bar_code"],
    unit_size: json["unit_size"],
    unit_type: json["unit_type"],
    Product_Category: json["Product_Category"],
    Product_Sub_Category: json["Product_Sub_Category"],
    description: json["description"],
    price: json["price"],
    imageUrl: json["image_url"],
    ingredients: json["ingredients"],
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    countryName: json["country_name"],
    brandName: json["brand_name"],
    nutrition: json["nutrition"] == null ? null : Nutrition.fromMap(json["nutrition"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "slug":slug,
    "display_name": displayName,
    "unit_size":unit_size,
    "unit_type":unit_type,
    "Product_Category":Product_Category,
    "Product_Sub_Category":Product_Sub_Category,
    "bar_code": barCode,
    "description": description,
    "price": price,
    "image_url": imageUrl,
    "ingredients": ingredients,
    "category_id": categoryId,
    "category_name": categoryName,
    "country_name": countryName,
    "brand_name": brandName,
    "nutrition": nutrition?.toMap(),
  };
}

class Nutrition {
  String? calories;
  String? fat;
  String? protein;
  String? carbohydrates;

  Nutrition({
    this.calories,
    this.fat,
    this.protein,
    this.carbohydrates,
  });

  Nutrition copyWith({
    String? calories,
    String? fat,
    String? protein,
    String? carbohydrates,
  }) =>
      Nutrition(
        calories: calories ?? this.calories,
        fat: fat ?? this.fat,
        protein: protein ?? this.protein,
        carbohydrates: carbohydrates ?? this.carbohydrates,
      );

  factory Nutrition.fromJson(String str) => Nutrition.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Nutrition.fromMap(Map<String, dynamic> json) => Nutrition(
    calories: json["calories"],
    fat: json["fat"],
    protein: json["protein"],
    carbohydrates: json["carbohydrates"],
  );

  Map<String, dynamic> toMap() => {
    "calories": calories,
    "fat": fat,
    "protein": protein,
    "carbohydrates": carbohydrates,
  };
}
