import 'package:bsuir_schedule_app/widgets/schedule_list.dart';
import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final Widget title;

  ScheduleCard({Key key, @required this.title}) : super(key: key);

  Widget _buildTitle(BuildContext context) {
    var style = DefaultTextStyle.of(context).style.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        );

    return DefaultTextStyle(
      child: title,
      style: style,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 300),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 16.0,
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(context),
              SizedBox(height: 16.0),
              Expanded(
                child: ScheduleList(
                  groupName: '860801',
                  date: DateTime.now(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
