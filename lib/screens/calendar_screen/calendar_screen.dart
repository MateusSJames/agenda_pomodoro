import 'package:agenda/services/tasks_source.dart';
import 'package:agenda/stores/registration_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../comum/styles/consts.dart';
import '../home_screen/home_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  //final _taskService = TaskService();
  final _registrationStore = RegistrationStore();

  @override
  void initState() {
    _registrationStore.getTasks();
    // TaskSource([]).getCalendarDataSource().then((value) {
    //   print(value);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: colorAppBar,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (Route<dynamic> route) => false,
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Observer(
        builder: (_) {
          return SfCalendar(
            view: CalendarView.schedule,
            dataSource:
                TaskSource([]).getCalendarDataSource(_registrationStore.tasks),
            cellBorderColor: colorAppBar,
            todayHighlightColor: colorAppBar,
            initialSelectedDate: DateTime.now(),
          );
        },
      ),
    );
  }
}
