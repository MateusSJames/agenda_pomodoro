import 'package:flutter/material.dart';

class DurationCountDown {
  String time;
  DurationCountDown({
    required this.time,
  });
  Widget create() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        time,
        style: const TextStyle(
          fontSize: 72.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
