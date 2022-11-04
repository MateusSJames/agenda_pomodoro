import 'package:flutter/material.dart';

class AlertAbstract {
  String? title;
  String? description;

  AlertAbstract(
    this.title,
    this.description,
  );

  Future create(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(
              title!,
              textAlign: TextAlign.center,
            ),
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.15,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Column(
                  children: [
                    Flexible(
                      child: Text(
                        description!,
                        style: const TextStyle(
                          fontSize: 17.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
