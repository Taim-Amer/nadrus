import 'package:skeletonizer/skeletonizer.dart';

class SubjectsModel {
  String? message;
  List<Data>? data;

  SubjectsModel({this.message, this.data});

  SubjectsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  static SubjectsModel get skeleton{
    return SubjectsModel(
      data: List.generate(20, (_) => Data(
        name: BoneMock.fullName,
      ))
    );
  }
}

class Data {
  int? id;
  String? name;
  String? iconName;
  String? materialId;
  int? gradeId;
  int? lessonsCount;
  String? pngIcon;
  String? svgIcon;
  Grade? grade;

  Data(
      {this.id,
        this.name,
        this.iconName,
        this.materialId,
        this.gradeId,
        this.lessonsCount,
        this.pngIcon,
        this.svgIcon,
        this.grade});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iconName = json['icon_name'];
    materialId = json['material_id'];
    gradeId = json['grade_id'];
    lessonsCount = json['lessons_count'];
    pngIcon = json['png_icon'];
    svgIcon = json['svg_icon'];
    grade = json['grade'] != null ? Grade.fromJson(json['grade']) : null;
  }
}

class Grade {
  int? id;
  int? nthGrade;
  String? type;
  String? name;

  Grade({this.id, this.nthGrade, this.type, this.name});

  Grade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nthGrade = json['nth_grade'];
    type = json['type'];
    name = json['name'];
  }
}
