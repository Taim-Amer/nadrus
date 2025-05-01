import 'package:skeletonizer/skeletonizer.dart';

class HomeworksModel {
  String? message;
  List<Data>? data;

  HomeworksModel({this.message, this.data});

  HomeworksModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  static HomeworksModel get skeleton {
    return HomeworksModel(
      data: List.generate(20, (_) => Data.skeleton),
    );
  }
}

class Data {
  int? id;
  int? sessionId;
  String? content;
  String? deadlineDate;
  bool? checked;
  String? createdAt;
  String? updatedAt;
  List<AssignmentStatuses>? assignmentStatuses;
  Session? session;

  Data(
      {this.id,
        this.sessionId,
        this.content,
        this.deadlineDate,
        this.checked,
        this.createdAt,
        this.updatedAt,
        this.assignmentStatuses,
        this.session});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sessionId = json['session_id'];
    content = json['content'];
    deadlineDate = json['deadline_date'];
    checked = json['checked'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['assignment_statuses'] != null) {
      assignmentStatuses = <AssignmentStatuses>[];
      json['assignment_statuses'].forEach((v) {
        assignmentStatuses!.add(AssignmentStatuses.fromJson(v));
      });
    }
    session =
    json['session'] != null ? Session.fromJson(json['session']) : null;
  }

  static Data get skeleton{
    return Data(
      content: BoneMock.fullName,
    );
  }
}

class AssignmentStatuses {
  int? id;
  int? assignmentId;
  int? studentId;
  int? done;

  AssignmentStatuses({this.id, this.assignmentId, this.studentId, this.done});

  AssignmentStatuses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assignmentId = json['assignment_id'];
    studentId = json['student_id'];
    done = json['done'];
  }
}

class Session {
  int? id;
  int? sectionId;
  int? teacherId;
  int? lessonId;
  int? weeklyScheduleId;
  String? date;
  int? nthSession;
  String? teacherNote;
  String? entryTime;
  Lesson? lesson;

  Session(
      {this.id,
        this.sectionId,
        this.teacherId,
        this.lessonId,
        this.weeklyScheduleId,
        this.date,
        this.nthSession,
        this.teacherNote,
        this.entryTime,
        this.lesson});

  Session.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionId = json['section_id'];
    teacherId = json['teacher_id'];
    lessonId = json['lesson_id'];
    weeklyScheduleId = json['weekly_schedule_id'];
    date = json['date'];
    nthSession = json['nth_session'];
    teacherNote = json['teacher_note'];
    entryTime = json['entry_time'];
    lesson =
    json['lesson'] != null ? Lesson.fromJson(json['lesson']) : null;
  }
}

class Lesson {
  int? id;
  String? name;
  String? description;
  int? order;
  int? unitId;
  Unit? unit;

  Lesson(
      {this.id,
        this.name,
        this.description,
        this.order,
        this.unitId,
        this.unit});

  Lesson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    order = json['order'];
    unitId = json['unit_id'];
    unit = json['unit'] != null ? Unit.fromJson(json['unit']) : null;
  }
}

class Unit {
  int? id;
  int? nthUnit;
  String? name;
  int? subjectId;
  Subject? subject;

  Unit({this.id, this.nthUnit, this.name, this.subjectId, this.subject});

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nthUnit = json['nth_unit'];
    name = json['name'];
    subjectId = json['subject_id'];
    subject =
    json['subject'] != null ? Subject.fromJson(json['subject']) : null;
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
}
