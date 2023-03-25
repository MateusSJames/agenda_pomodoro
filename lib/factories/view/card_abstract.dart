import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../comum/styles/consts.dart';

class CardTaskAbstract {
  String? name;
  String? initHour;
  String? endHour;
  Object? value;
  int? isTask;
  void Function()? onDismissed;

  CardTaskAbstract(
    this.name,
    this.initHour,
    this.endHour,
    this.value,
    this.isTask,
    this.onDismissed,
  );

  Widget create(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 5.0,
      ),
      child: SizedBox(
        width: 100.w,
        height: 20.h,
        child: Card(
          color: colorAppBar,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              //vertical: 10.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isTask == 0
                    ? const Icon(
                        Icons.schedule,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                      ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 2.vmax,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        name!,
                        style: const TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      isTask == 0
                          ? Text(
                              '$initHour - $endHour',
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              'Horário: $initHour',
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
