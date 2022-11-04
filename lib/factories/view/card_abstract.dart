import 'package:flutter/material.dart';

import '../../comum/consts.dart';

class CardTaskAbstract {
  String? name;
  String? initHour;
  String? endHour;
  Object? value;
  void Function(DismissDirection)? onDismissed;

  CardTaskAbstract(
    this.name,
    this.initHour,
    this.endHour,
    this.value,
    this.onDismissed,
  );

  Widget create(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 5.0,
      ),
      child: Dismissible(
        key: ObjectKey(value),
        onDismissed: onDismissed,
        background: Container(
          alignment: Alignment.centerRight,
          color: Colors.red,
          child: const Icon(
            Icons.delete_forever,
            color: Colors.white,
            size: 30,
          ),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.12,
          child: Card(
            color: colorAppBar,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                //vertical: 10.0,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.schedule,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 12.0,
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
                        Text(
                          '$initHour - $endHour',
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
      ),
    );
  }
}
