import 'dart:convert';

EmployeeModel employeeModelFromJson(String str) =>
    EmployeeModel.fromJson(json.decode(str));

String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());

class EmployeeModel {
  EmployeeModel({
    this.id,
    this.name,
    this.email,
    this.mobileNo,
    this.teamId,
    this.employeeCode,
    this.designation,
    this.hq,
    this.managerEmployeeCode,
    this.doj,
    this.dob,
    this.createdAt,
    this.updatedAt,
    this.teamName,
    this.team,
  });

  int? id;
  String? name;
  String? email;
  String? mobileNo;
  int? teamId;
  String? employeeCode;
  String? designation;
  String? hq;
  dynamic managerEmployeeCode;
  DateTime? doj;
  DateTime? dob;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? teamName;
  Team? team;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobileNo: json["mobile_no"],
        teamId: json["team_id"],
        employeeCode: json["employee_code"],
        designation: json["designation"],
        hq: json["hq"],
        managerEmployeeCode: json["manager_employee_code"],
        doj: DateTime.parse(json["doj"]),
        dob: DateTime.parse(json["dob"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        teamName: json["team_name"],
        team: Team.fromJson(json["team"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile_no": mobileNo,
        "team_id": teamId,
        "employee_code": employeeCode,
        "designation": designation,
        "hq": hq,
        "manager_employee_code": managerEmployeeCode,
        "doj":
            "${doj!.year.toString().padLeft(4, '0')}-${doj!.month.toString().padLeft(2, '0')}-${doj!.day.toString().padLeft(2, '0')}",
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "team_name": teamName,
        "team": team!.toJson(),
      };
}

class Team {
  Team({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
