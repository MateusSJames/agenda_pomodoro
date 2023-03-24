import 'package:agenda/comum/styles/consts.dart';
import 'package:agenda/connections/db_connection.dart';
import 'package:agenda/factories/view/alerts.dart';
import 'package:agenda/factories/view/button_abstract.dart';
import 'package:agenda/factories/view/duration_abstract.dart';
import 'package:agenda/models/tasks.dart';
import 'package:agenda/screens/home_screen/home_screen.dart';
import 'package:agenda/services/task_service.dart';
import 'package:agenda/stores/stopwatch_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StopWatchScreen extends StatefulWidget {
  final Tasks task;
  const StopWatchScreen({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  final _stopWatchStore = StopWatchStore();
  final _taskService = TaskService(SqfliteConnection());

  @override
  void initState() {
    // widget.task.durationSession
    _stopWatchStore.setDuration(1);
    _stopWatchStore.setSessions(widget.task.sessions);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){
              showDialog(
                context: context, 
                builder: (context) {
                  return SimpleDialog(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(2.vmax),
                        child: Column(
                          children: [
                            Text(
                              'Tem certeza de que gostaria de excluir essa tarefa ?',
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                textStyle: TextStyle(
                                fontSize: 2.vmax,
                                color: const Color(0xff000000),
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 2.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    _taskService.delete(widget.task.id!, SqfliteConnection().idTask);
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) => const HomeScreen(),
                                      ),
                                      (Route<dynamic> route) => false,
                                    );
                                  },
                                  child: Text(
                                    'Sim',
                                    style: GoogleFonts.getFont(
                                      'Montserrat',
                                      textStyle: TextStyle(
                                      fontSize: 2.vmax,
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                TextButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  }, 
                                  child: Text(
                                    'Não',
                                    style: GoogleFonts.getFont(
                                      'Montserrat',
                                      textStyle: TextStyle(
                                      fontSize: 2.vmax,
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              );
            }, 
            icon: const Icon(Icons.clear, color: Colors.white,),
          )
        ],
        leading: IconButton(
          onPressed: () {
            if(_stopWatchStore.sessions > 0) {
              final task = Tasks(
                id: widget.task.id,
                nameTask: widget.task.nameTask, 
                dateTask: widget.task.dateTask, 
                initHour: widget.task.initHour, 
                endHour: widget.task.endHour, 
                sessions: _stopWatchStore.sessions, 
                durationSession: widget.task.durationSession,
              );
              _taskService.update(task, SqfliteConnection().idTask);
            } else {
              _taskService.delete(widget.task.id!, SqfliteConnection().idTask);
            }
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (Route<dynamic> route) => false,
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: backgroundColorStopWatchScreen,
      ),
      backgroundColor: backgroundColorStopWatchScreen,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Observer(builder: (_) {
                return Column(
                  children: [
                    Text(
                      'Atividade: ${widget.task.nameTask}',
                      style: GoogleFonts.getFont(
                         'Montserrat',
                         textStyle: TextStyle(
                         fontSize: 2.5.vmax,
                         fontWeight: FontWeight.bold,
                         color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                    Text(
                      'Horário: ${widget.task.initHour} - ${widget.task.endHour}',
                      style: GoogleFonts.getFont(
                         'Montserrat',
                         textStyle: TextStyle(
                         fontSize: 2.5.vmax,
                         fontWeight: FontWeight.bold,
                         color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                    Text(
                      'Sessões ativas: ${_stopWatchStore.sessions}',
                      style: GoogleFonts.getFont(
                         'Montserrat',
                         textStyle: TextStyle(
                         fontSize: 2.5.vmax,
                         fontWeight: FontWeight.bold,
                         color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ],
                );
              }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
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
                              _stopWatchStore.stopTime(value: 1);
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
                        if (_stopWatchStore.sessions == 0) {
                          AlertAbstract('Tarefa finalizada',
                                  'Todas as sessões dessa tarefa foram concluídas com sucesso')
                              .create(context);
                        } else {
                          _stopWatchStore.startTime(value: 1);
                        }
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
