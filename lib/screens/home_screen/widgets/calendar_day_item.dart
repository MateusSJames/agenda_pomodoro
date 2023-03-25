import 'package:agenda/components/box/index.dart';
import 'package:agenda/comum/styles/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CalendarDayItem extends StatelessWidget {
  final String text;
  final String date;
  final Color? textColor;
  final Color? dateColor;
  final bool isCurrentDay;

  const CalendarDayItem({
    Key? key,
    required this.text,
    required this.date,
    this.textColor = const Color(0xff8B9296),
    this.dateColor = Colors.black,
    this.isCurrentDay = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Box(
        width: 10.w,
        height: 7.h,
        padding: EdgeInsets.only(right: 0.2.vmax, left: 0.2.vmax),
        decoration: BoxDecoration(
          color: isCurrentDay ? colorAppBar : const Color(0xfff3f3f3),
          borderRadius: BorderRadius.circular(2.vmax),
          boxShadow: isCurrentDay
              ? const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.5), //(x,y)
                    blurRadius: 5.0,
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.getFont(
                'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 1.4.vmax,
                color: textColor,
              ),
            ),
            Text(
              date,
              style: GoogleFonts.getFont(
                'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 1.6.vmax,
                color: dateColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
