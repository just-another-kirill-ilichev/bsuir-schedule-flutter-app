import 'package:bsuir_schedule_app/services/schedule_service.dart';
import 'package:bsuir_schedule_app/widgets/schedule_card.dart';
import 'package:bsuir_schedule_app/widgets/square_card_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bsuir schedule',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline5: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Widget _buildGroupSelector() {
    return Row(
      children: [
        Text(
          '860801',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Icon(
          Icons.arrow_drop_down,
          color: Theme.of(context).textTheme.subtitle1.color,
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Расписание',
                style: Theme.of(context).textTheme.headline5,
              ),
              _buildGroupSelector()
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          Icon(
            Icons.settings,
            color: Colors.grey[600],
          ),
        ],
      ),
    );
  }

  Widget _buildActionCards() {
    return Table(
      children: [
        TableRow(children: [
          SquareCardButton(
            title: 'Календарь',
            subtitle: 'Просмотр занятий по дате',
            icon: FaIcon(
              FontAwesomeIcons.calendarAlt,
            ),
            onTap: () async {
              ScheduleService.instance.getGroupSchedule('860801');
            },
          ),
          SquareCardButton(
            title: 'Экзамены',
            subtitle: 'Просмотр списка экзаменов',
            icon: FaIcon(
              FontAwesomeIcons.tasks,
            ),
          ),
        ]),
        TableRow(children: [
          SquareCardButton(
            title: 'Инфо',
            subtitle: 'Данные о приложении',
            icon: FaIcon(
              FontAwesomeIcons.infoCircle,
            ),
          ),
          SizedBox(),
        ]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildHeader(),
                SizedBox(height: 8),
                ScheduleCard(title: Text('Сегодня')),
                _buildActionCards(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
