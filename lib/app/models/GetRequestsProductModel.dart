import 'dart:convert';

class GetRequestsProductModel {
  String? message;
  int? total;
  List<Datum>? data;

  GetRequestsProductModel({
    this.message,
    this.total,
    this.data,
  });

  GetRequestsProductModel copyWith({
    String? message,
    int? total,
    List<Datum>? data,
  }) =>
      GetRequestsProductModel(
        message: message ?? this.message,
        total: total ?? this.total,
        data: data ?? this.data,
      );

  factory GetRequestsProductModel.fromJson(String str) => GetRequestsProductModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetRequestsProductModel.fromMap(Map<String, dynamic> json) => GetRequestsProductModel(
    message: json["message"],
    total: json["total"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "total": total,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class Datum {
  int? id;
  int? userId;
  String? name;
  String? barCode;
  String? description;
  String? createdAt;
  String? updatedAt;

  Datum({
    this.id,
    this.userId,
    this.name,
    this.barCode,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  Datum copyWith({
    int? id,
    int? userId,
    String? name,
    String? barCode,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) =>
      Datum(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        barCode: barCode ?? this.barCode,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
    barCode: json["bar_code"],
    description: json["description"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "name": name,
    "bar_code": barCode,
    "description": description,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
