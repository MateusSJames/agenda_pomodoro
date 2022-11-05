import 'package:agenda/models/tasks.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TaskSource extends CalendarDataSource {
  TaskSource(List<Appointment> source) {
    appointments = source;
  }

  TaskSource getCalendarDataSource(List<Tasks> tasks) {
    List<Appointment> appointments = <Appointment>[];
    for (int i = 0; i < tasks.length; i++) {
      // print(DateTime.now());
      // DateTime timeInit = DateFormat('yyyy-MM-dd HH:mm:ss').parse(
      //     '${tasks[i].dateTask!.replaceAll('/', '-')} ${tasks[i].initHour}:00');
      // print(timeInit);
      // DateTime endTime =
      //     DateTime.parse('${tasks[i].dateTask} ${tasks[i].endHour}');
      appointments.add(
        Appointment(
          startTime: DateTime.now(),
          endTime: DateTime.now(),
          subject: tasks[i].nameTask!,
        ),
      );
    }
    return TaskSource(appointments);
  }
}
