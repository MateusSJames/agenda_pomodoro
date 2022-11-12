import 'package:agenda/factories/view/button_abstract.dart';
import 'package:agenda/factories/view/duration_abstract.dart';
import 'package:agenda/stores/stopwatch_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({Key? key}) : super(key: key);

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  final _stopWatchStore = StopWatchStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(238, 190, 147, 247),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Observer(builder: (_) {
                    return DurationCountDown(time: _stopWatchStore.hours)
                        .create();
                  }),
                  const SizedBox(
                    width: 8,
                  ),
                  Observer(builder: (_) {
                    return DurationCountDown(time: _stopWatchStore.minutes)
                        .create();
                  }),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Observer(builder: (_) {
                    return DurationCountDown(time: _stopWatchStore.seconds)
                        .create();
                  }),
                ],
              ),
              Observer(builder: (_) {
                if (_stopWatchStore.isRunning) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 50,
                          child: ButtonAbstract(
                            nameButton: _stopWatchStore.nameButton,
                            color: Colors.white,
                            colorText: Colors.black,
                            onPressed: () {
                              if (_stopWatchStore.timer!.isActive) {
                                _stopWatchStore.stopTime(resets: false);
                              } else {
                                _stopWatchStore.startTime(resets: false);
                              }
                            },
                          ).create(),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 50,
                          child: ButtonAbstract(
                            nameButton: 'Cancelar',
                            color: Colors.white,
                            colorText: Colors.black,
                            onPressed: () {
                              _stopWatchStore.stopTime();
                            },
                          ).create(),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.3),
                    child: ButtonAbstract(
                      nameButton: 'Iniciar Tarefa',
                      color: Colors.white,
                      colorText: Colors.black,
                      onPressed: () {
                        _stopWatchStore.startTime();
                      },
                    ).create(),
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
