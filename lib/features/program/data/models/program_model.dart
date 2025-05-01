import 'package:skeletonizer/skeletonizer.dart';

class ProgramModel {
  String? message;
  List<Data>? data;

  ProgramModel({this.message, this.data});

  ProgramModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  static ProgramModel get skeleton{
    return ProgramModel(
      data: List.generate(20, (_) => Data.skeleton)
    );
  }

  static Map<String, List<Data>> sortDays(List<Data>? dataList, List<String> daysList){
    // const List<String> weekDaysOrder = [
    //   'SUNDAY',
    //   'MONDAY',
    //   'TUESDAY',
    //   'WEDNESDAY',
    //   'THURSDAY',
    //   'FRIDAY',
    //   'SATURDAY',
    // ];

    final Map<String, List<Data>> sortedMap = {
      for(var day in daysList) day : []
    };

    for (var item in dataList!) {
      if (item.day != null && sortedMap.containsKey(item.day)) {
        sortedMap[item.day]!.add(item);
      }
    }

    return sortedMap;
  }
}

class Data {
  int? id;
  int? nthSession;
  int? sectionId;
  int? subjectId;
  int? teacherId;
  String? fromTime;
  String? toTime;
  int? isBreak;
  String? day;
  Subject? subject;

  Data(
      {this.id,
        this.nthSession,
        this.sectionId,
        this.subjectId,
        this.teacherId,
        this.fromTime,
        this.toTime,
        this.isBreak,
        this.day,
        this.subject});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nthSession = json['nth_session'];
    sectionId = json['section_id'];
    subjectId = json['subject_id'];
    teacherId = json['teacher_id'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    isBreak = json['is_break'];
    day = json['day'];
    subject =
    json['subject'] != null ? Subject.fromJson(json['subject']) : null;
  }

  static Data get skeleton{
    return Data(
      subject: Subject.skeleton
    );
  }
}

class Subject {
  int? id;
  String? name;
  String? iconName;
  String? materialId;
  int? gradeId;
  String? pngIcon;
  String? svgIcon;

  Subject(
      {this.id,
        this.name,
        this.iconName,
        this.materialId,
        this.gradeId,
        this.pngIcon,
        this.svgIcon});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iconName = json['icon_name'];
    materialId = json['material_id'];
    gradeId = json['grade_id'];
    pngIcon = json['png_icon'];
    svgIcon = json['svg_icon'];
  }

  static Subject get skeleton{
    return Subject(
      name: BoneMock.fullName,
    );
  }
}
