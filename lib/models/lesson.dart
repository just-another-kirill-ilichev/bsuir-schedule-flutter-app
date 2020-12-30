import 'package:bsuir_schedule_app/models/employee.dart';

class Lesson {
  final List<int> weekNumber;
  final List<String> studentGroup;
  final int numSubgroup;
  final List<String> auditory;

  final String lessonTime;
  final String startLessonTime;
  final String endLessonTime;
  final String subject;
  final String note;
  final String lessonType;

  final List<Employee> employee;
  final bool zaoch;

  Lesson(
      {this.weekNumber,
      this.studentGroup,
      this.numSubgroup,
      this.auditory,
      this.lessonTime,
      this.startLessonTime,
      this.endLessonTime,
      this.subject,
      this.note,
      this.lessonType,
      this.employee,
      this.zaoch});

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      weekNumber: List<int>.from(json['weekNumber']),
      studentGroup: List<String>.from(json['studentGroup']),
      numSubgroup: json['numSubgroup'],
      auditory: List<String>.from(json['auditory']),
      lessonTime: json['lessonTime'],
      startLessonTime: json['startLessonTime'],
      endLessonTime: json['endLessonTime'],
      subject: json['subject'],
      note: json['note'],
      lessonType: json['lessonType'],
      employee:
          json['employee'].map<Employee>((e) => Employee.fromJson(e)).toList(),
      zaoch: json['zaoch'],
    );
  }
}
