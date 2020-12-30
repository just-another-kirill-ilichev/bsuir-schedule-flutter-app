import 'package:bsuir_schedule_app/models/employee.dart';
import 'package:bsuir_schedule_app/models/lesson.dart';
import 'package:bsuir_schedule_app/models/student_group.dart';
import 'package:intl/intl.dart';

class Schedule {
  final Employee employee;
  final StudentGroup studentGroup;
  final List<DailySchedule> schedules;
  final List<DailySchedule> examSchedules;
  final DateTime todayDate;
  final List<Lesson> todaySchedules;
  final DateTime tomorrowDate;
  final List<Lesson> tomorrowSchedules;
  final int currentWeekNumber;

  Schedule(
      {this.employee,
      this.studentGroup,
      this.schedules,
      this.examSchedules,
      this.todayDate,
      this.todaySchedules,
      this.tomorrowDate,
      this.tomorrowSchedules,
      this.currentWeekNumber});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      employee: Employee.fromJson(json['employee']),
      studentGroup: StudentGroup.fromJson(json['studentGroup']),
      schedules: json['schedules']
          .map<DailySchedule>((e) => DailySchedule.fromJson(e))
          .toList(),
      examSchedules: json['schedules']
          .map<DailySchedule>((e) => DailySchedule.fromJson(e))
          .toList(),
      todayDate: DateFormat('dd.MM.yyyy').parse(json['todayDate']),
      todaySchedules: json['todaySchedules']
          .map<Lesson>((e) => Lesson.fromJson(e))
          .toList(),
      tomorrowDate: DateFormat('dd.MM.yyyy').parse(json['tomorrowDate']),
      tomorrowSchedules: json['tomorrowSchedules']
          .map<Lesson>((e) => Lesson.fromJson(e))
          .toList(),
      currentWeekNumber: json['currentWeekNumber'],
    );
  }
}

class DailySchedule {
  final String weekDay;
  final List<Lesson> schedule;

  DailySchedule({this.weekDay, this.schedule});

  factory DailySchedule.fromJson(Map<String, dynamic> json) {
    return DailySchedule(
      weekDay: json['weekDay'],
      schedule:
          json['schedule'].map<Lesson>((e) => Lesson.fromJson(e)).toList(),
    );
  }
}
