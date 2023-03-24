import 'package:agenda/components/box/index.dart';
import 'package:agenda/screens/home_screen/widgets/calendar_day_item.dart';
import 'package:agenda/utils/capitalize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Calendar extends StatefulWidget {
  const Calendar({
    Key? key,
  }) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  String month =
      capitalize(DateFormat(DateFormat.MONTH, 'pt_BR').format(DateTime.now()));
  String year = DateFormat(DateFormat.YEAR, 'pt_BR').format(DateTime.now());
  String day = DateFormat(DateFormat.DAY, 'pt_BR').format(DateTime.now());
  List<String> datesOfWeek = [];

  @override
  void initState() {
    super.initState();
    String initWeek = DateFormat(DateFormat.DAY, 'pt_BR').format(
        DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)));
    String finalWeek = DateFormat(DateFormat.DAY, 'pt_BR').format(DateTime.now()
        .add(Duration(days: DateTime.daysPerWeek - DateTime.now().weekday)));
    datesOfWeek.add(initWeek);
    for (int i = 1; i < 6; i++) {
      String aux = DateFormat(DateFormat.DAY, 'pt_BR').format(DateTime.now()
          .subtract(Duration(days: DateTime.now().weekday - 1))
          .add(Duration(days: i)));

      datesOfWeek.add(aux);
    }
    datesOfWeek.add(finalWeek);
  }

  Color? getCalendarDayItemColor(int index, Color firstColor, Color lastColor) {
    return day == datesOfWeek[index] ? firstColor : lastColor;
  }

  bool isCurrentDay(int index) {
    return day == datesOfWeek[index];
  }

  @override
  Widget build(BuildContext context) {
    return Box(
      width: 90.w,
      height: 18.h,
      margin: EdgeInsets.only(bottom: 4.vmax, top: 4.vmax),
      decoration: BoxDecoration(
        color: const Color(0xfff3f3f3),
        borderRadius: BorderRadius.all(
          Radius.circular(2.vmax),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(bottom: 1.2.vmax),
            child: Text(
              '$month, $year',
              style: GoogleFonts.getFont(
                'Montserrat',
                fontSize: 2.4.vmax,
                fontWeight: FontWeight.w500,
                color: const Color(0xff1f2e36),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CalendarDayItem(
                text: 'SEG',
                date: datesOfWeek[0],
                textColor: getCalendarDayItemColor(
                  0,
                  Colors.white,
                  const Color(0xff8B9296),
                ),
                dateColor: getCalendarDayItemColor(
                  0,
                  Colors.white,
                  Colors.black,
                ),
                isCurrentDay: isCurrentDay(0),
              ),
              CalendarDayItem(
                text: 'TER',
                date: datesOfWeek[1],
                textColor: getCalendarDayItemColor(
                  1,
                  Colors.white,
                  const Color(0xff8B9296),
                ),
                dateColor: getCalendarDayItemColor(
                  1,
                  Colors.white,
                  Colors.black,
                ),
                isCurrentDay: isCurrentDay(1),
              ),
              CalendarDayItem(
                text: 'QUA',
                date: datesOfWeek[2],
                textColor: getCalendarDayItemColor(
                  2,
                  Colors.white,
                  const Color(0xff8B9296),
                ),
                dateColor: getCalendarDayItemColor(
                  2,
                  Colors.white,
                  Colors.black,
                ),
                isCurrentDay: isCurrentDay(2),
              ),
              CalendarDayItem(
                text: 'QUI',
                date: datesOfWeek[3],
                textColor: getCalendarDayItemColor(
                  3,
                  Colors.white,
                  const Color(0xff8B9296),
                ),
                dateColor: getCalendarDayItemColor(
                  3,
                  Colors.white,
                  Colors.black,
                ),
                isCurrentDay: isCurrentDay(3),
              ),
              CalendarDayItem(
                text: 'SEX',
                date: datesOfWeek[4],
                textColor: getCalendarDayItemColor(
                  4,
                  Colors.white,
                  const Color(0xff8B9296),
                ),
                dateColor: getCalendarDayItemColor(
                  4,
                  Colors.white,
                  Colors.black,
                ),
                isCurrentDay: isCurrentDay(4),
              ),
              CalendarDayItem(
                text: 'SÁB',
                date: datesOfWeek[5],
                textColor: getCalendarDayItemColor(
                  5,
                  Colors.white,
                  const Color(0xff8B9296),
                ),
                dateColor: getCalendarDayItemColor(
                  5,
                  Colors.white,
                  Colors.black,
                ),
                isCurrentDay: isCurrentDay(5),
              ),
              CalendarDayItem(
                text: 'DOM',
                date: datesOfWeek[6],
                textColor: getCalendarDayItemColor(
                  6,
                  Colors.white,
                  const Color(0xff8B9296),
                ),
                dateColor: getCalendarDayItemColor(
                  6,
                  Colors.white,
                  Colors.black,
                ),
                isCurrentDay: isCurrentDay(6),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
