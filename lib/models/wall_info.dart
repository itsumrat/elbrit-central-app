import 'dart:convert';

WallModel wallModelFromJson(String str) => WallModel.fromJson(json.decode(str));

String wallModelToJson(WallModel data) => json.encode(data.toJson());

class WallModel {
  WallModel({
    this.id,
    this.details,
    this.pinPost,
    this.image,
    this.video,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? details;
  String? pinPost;
  List<String>? image;
  dynamic video;
  dynamic publishedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory WallModel.fromJson(Map<String, dynamic> json) => WallModel(
        id: json["id"],
        details: json["details"],
        pinPost: json["pin_post"],
        image: List<String>.from(json["image"].map((x) => x)),
        video: json["video"],
        publishedAt: json["published_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "details": details,
        "pin_post": pinPost,
        "image": List<dynamic>.from(image!.map((x) => x)),
        "video": video,
        "published_at": publishedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
