import 'dart:convert';
import 'package:bsuir_schedule_app/models/schedule.dart';
import 'package:bsuir_schedule_app/models/lesson.dart';
import 'package:http/http.dart' as http;

class ScheduleService {
  static final ScheduleService _instance =
      ScheduleService._privateConstructor();
  static ScheduleService get instance => _instance;

  ScheduleService._privateConstructor();

  Future<Schedule> getGroupSchedule(String groupName) async {
    var response = await http.get(
        'https://journal.bsuir.by/api/v1/studentGroup/schedule?studentGroup=$groupName');

    if (response.statusCode == 200) {
      return Schedule.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<List<Lesson>> getScheduleForDate(
      String groupName, DateTime date) async {
    var schedule = await getGroupSchedule(groupName);

    return schedule.tomorrowSchedules; // TODO
  }
}
