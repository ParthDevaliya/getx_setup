// To parse this JSON data, do
//
//     final myPropertiesModel = myPropertiesModelFromJson(jsonString);

import 'dart:convert';

MyPropertiesModel myPropertiesModelFromJson(String str) => MyPropertiesModel.fromJson(json.decode(str));

String myPropertiesModelToJson(MyPropertiesModel data) => json.encode(data.toJson());

class MyPropertiesModel {
  final String? id;
  final String? name;
  final List<Myproperty>? myproperties;
  final String? message;
  final String? type;

  MyPropertiesModel({
    this.id,
    this.name,
    this.myproperties,
    this.message,
    this.type,
  });

  factory MyPropertiesModel.fromJson(Map<String, dynamic> json) => MyPropertiesModel(
      id: json["id"],
      name: json["name"],
      myproperties: json["myproperties"] == null ? [] : List<Myproperty>.from(json["myproperties"]!.map((x) => Myproperty.fromJson(x))),
  message: json["Message"],
  type: json["Type"],
  );

  Map<String, dynamic> toJson() => {
  "id": id,
  "name": name,
  "myproperties": myproperties == null ? [] : List<dynamic>.from(myproperties!.map((x) => x.toJson())),
  "Message": message,
  "Type": type,
};
}

class Myproperty {
  final String? cpId;
  final String? cpProjectName;
  final String? cpBuildName;
  final String? cpUnit;
  final String? cpSaleId;
  final String? cpCId;
  final String? cpStatus;
  final DateTime? cpCreatedAt;

  Myproperty({
    this.cpId,
    this.cpProjectName,
    this.cpBuildName,
    this.cpUnit,
    this.cpSaleId,
    this.cpCId,
    this.cpStatus,
    this.cpCreatedAt,
  });

  factory Myproperty.fromJson(Map<String, dynamic> json) => Myproperty(
    cpId: json["cp_id"],
    cpProjectName: json["cp_project_name"],
    cpBuildName: json["cp_build_name"],
    cpUnit: json["cp_unit"],
    cpSaleId: json["cp_sale_id"],
    cpCId: json["cp_c_id"],
    cpStatus: json["cp_status"],
    cpCreatedAt: json["cp_created_at"] == null ? null : DateTime.parse(json["cp_created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "cp_id": cpId,
    "cp_project_name": cpProjectName,
    "cp_build_name": cpBuildName,
    "cp_unit": cpUnit,
    "cp_sale_id": cpSaleId,
    "cp_c_id": cpCId,
    "cp_status": cpStatus,
    "cp_created_at": cpCreatedAt?.toIso8601String(),
  };
}
