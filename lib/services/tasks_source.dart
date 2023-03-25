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
      DateTime dateInit = DateFormat('dd/MM/yyyy HH:mm:ss')
          .parse('${tasks[i].dateTask} ${tasks[i].initHour}:00');
      String dateInitFormatUS =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(dateInit);
      if (tasks[i].isTask == 0) {
        DateTime dateEnd = DateFormat('dd/MM/yyyy HH:mm:ss')
            .parse('${tasks[i].dateTask} ${tasks[i].endHour}:00');
        String dateEndFormatUS =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(dateEnd);
        appointments.add(
          Appointment(
            startTime: DateTime.parse(dateInitFormatUS),
            endTime: DateTime.parse(dateEndFormatUS),
            subject: tasks[i].nameTask!,
          ),
        );
      } else {
        DateTime endOfDay = DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 23, 59, 59);
        appointments.add(
          Appointment(
            startTime: DateTime.parse(dateInitFormatUS),
            endTime: endOfDay,
            subject: tasks[i].nameTask!,
          ),
        );
      }
    }
    return TaskSource(appointments);
  }
}
