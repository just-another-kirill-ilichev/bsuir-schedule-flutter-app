import 'package:bsuir_schedule_app/models/lesson.dart';
import 'package:bsuir_schedule_app/services/schedule_service.dart';
import 'package:flutter/material.dart';

class ScheduleList extends StatefulWidget {
  final String groupName;
  final DateTime date;

  ScheduleList({Key key, @required this.groupName, @required this.date})
      : super(key: key);

  @override
  _ScheduleListState createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  final ScrollController _scrollController = ScrollController();

  Widget _buildListTile(Lesson lesson) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () => showDialog(
        context: context,
        builder: (context) => _LessonDetailsDialog(lesson: lesson),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(lesson.startLessonTime),
              Text(lesson.endLessonTime, style: TextStyle(fontSize: 12)),
            ],
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${lesson.subject} (${lesson.lessonType})',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              Text('${lesson.employee.map<String>((e) => e.fio).join()}',
                  style: TextStyle(fontSize: 12))
            ],
          ),
          Spacer(),
          Text('${lesson.auditory.join()}'),
        ],
      ),
    );
  }

  Widget _buildList(List<Lesson> lessons) {
    return Container(
      //color: Colors.red,
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: ListView.separated(
          controller: _scrollController,
          itemCount: lessons.length,
          itemBuilder: (context, index) => _buildListTile(lessons[index]),
          separatorBuilder: (context, index) => Divider(
            indent: 8,
            endIndent: 8,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Lesson>>(
      future: ScheduleService.instance
          .getScheduleForDate(widget.groupName, widget.date),
      builder: (BuildContext context, AsyncSnapshot<List<Lesson>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            !snapshot.hasData) {
          return Center(
            child: Text(
              'Ошибка загрузки данных.',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          );
        }

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.data.isEmpty) {
          return Center(
            child: Text(
              'Сегодня пар нет.',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          );
        }

        return _buildList(snapshot.data);
      },
    );
  }
}

class _LessonDetailsDialog extends StatelessWidget {
  final Lesson lesson;

  const _LessonDetailsDialog({Key key, this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('${lesson.subject} (${lesson.lessonType})'),
      content: CircleAvatar(),
    );
  }
}
