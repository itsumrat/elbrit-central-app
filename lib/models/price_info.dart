class PriceModel {


  List<Data>? data;
  PriceModel({this.data});
  PriceModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? brandName;
  String? productName;
  String? pack;
  String? mrp;
  String? ptr;
  String? pts;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Data(
      {this.id,
        this.brandName,
        this.productName,
        this.pack,
        this.mrp,
        this.ptr,
        this.pts,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brand_name'];
    productName = json['product_name'];
    pack = json['pack'];
    mrp = json['mrp'].toString();
    ptr = json['ptr'];
    pts = json['pts'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand_name'] = this.brandName;
    data['product_name'] = this.productName;
    data['pack'] = this.pack;
    data['mrp'] = this.mrp;
    data['ptr'] = this.ptr;
    data['pts'] = this.pts;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? teamId;
  int? priceId;

  Pivot({this.teamId, this.priceId});

  Pivot.fromJson(Map<String, dynamic> json) {
    teamId = json['team_id'];
    priceId = json['price_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['team_id'] = this.teamId;
    data['price_id'] = this.priceId;
    return data;
  }
}
//
// import 'dart:convert';
//
// PriceModel priceModelFromJson(String str) =>
//     PriceModel.fromJson(json.decode(str));
//
// String priceModelToJson(PriceModel data) => json.encode(data.toJson());
//
// class PriceModel {
//   PriceModel({
//     this.id,
//     this.brandName,
//     this.productName,
//     this.pack,
//     this.mrp,
//     this.ptr,
//     this.pts,
//     this.createdAt,
//     this.updatedAt,
//     // this.pivot,
//   });
//
//   int? id;
//   String? brandName;
//   String? productName;
//   String? pack;
//   int? mrp;
//   String? ptr;
//   String? pts;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   // Pivot? pivot;
//
//   factory PriceModel.fromJson(Map<String, dynamic> json) => PriceModel(
//         id: json["id"],
//         brandName: json["brand_name"],
//         productName: json["product_name"],
//         pack: json["pack"],
//         mrp: json["mrp"],
//         ptr: json["ptr"],
//         pts: json["pts"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         // pivot: Pivot.fromJson(json["pivot"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "brand_name": brandName,
//         "product_name": productName,
//         "pack": pack,
//         "mrp": mrp,
//         "ptr": ptr,
//         "pts": pts,
//         "created_at": createdAt!.toIso8601String(),
//         "updated_at": updatedAt!.toIso8601String(),
//         // "pivot": pivot!.toJson(),
//       };
// }
//
// // class Pivot {
// //   Pivot({
// //     this.teamId,
// //     this.priceId,
// //   });
//
// //   String? teamId;
// //   String? priceId;
//
// //   factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
// //         teamId: json["team_id"],
// //         priceId: json["price_id"],
// //       );
//
// //   Map<String, dynamic> toJson() => {
// //         "team_id": teamId,
// //         "price_id": priceId,
// //       };
// // }
//
