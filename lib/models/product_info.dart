import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.id,
    this.productName,
    this.productUniqueness,
    this.cartonImage,
    this.stripImage,
    this.tabletImage,
    this.logoImage,
    this.labelClaim,
    this.top,
    this.tcp,
    this.targetDoctors,
    this.patientsProfile,
    this.cpa,
    this.others,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? productName;
  String? productUniqueness;
  String? cartonImage;
  String? stripImage;
  String? tabletImage;
  String? logoImage;
  String? labelClaim;
  String? top;
  String? tcp;
  String? targetDoctors;
  String? patientsProfile;
  String? cpa;
  String? others;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        productName: json["product_name"],
        productUniqueness: json["product_uniqueness"],
        cartonImage: json["carton_image"],
        stripImage: json["strip_image"],
        tabletImage: json["tablet_image"],
        logoImage: json["logo_image"],
        labelClaim: json["label_claim"],
        top: json["top"],
        tcp: json["tcp"],
        targetDoctors: json["target_doctors"],
        patientsProfile: json["patients_profile"],
        cpa: json["cpa"],
        others: json["others"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "product_uniqueness": productUniqueness,
        "carton_image": cartonImage,
        "strip_image": stripImage,
        "tablet_image": tabletImage,
        "logo_image": logoImage,
        "label_claim": labelClaim,
        "top": top,
        "tcp": tcp,
        "target_doctors": targetDoctors,
        "patients_profile": patientsProfile,
        "cpa": cpa,
        "others": others,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
