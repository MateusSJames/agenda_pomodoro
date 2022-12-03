import 'package:agenda/comum/styles/consts.dart';
import 'package:agenda/factories/view/card_abstract.dart';
import 'package:agenda/screens/new_task_screen/new_task_screen.dart';
import 'package:agenda/screens/stopwatch_screen.dart/stopwatch_screen.dart';
import 'package:agenda/stores/registration_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../calendar_screen/calendar_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _registrationStore = RegistrationStore();
  @override
  void initState() {
    _registrationStore.getTasksToday();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: const [
            Text(
              'Olá, seja bem-vindo',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Hoje é um novo dia',
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const CalendarScreen()),
                (Route<dynamic> route) => false,
              );
            },
            tooltip: 'Visualizar calendário',
            icon: const Icon(Icons.calendar_month),
          ),
        ],
        elevation: 0,
        backgroundColor: colorAppBar,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Column(
          children: [
            Observer(builder: (_) {
              if (_registrationStore.loadingTasks) {
                return CircularProgressIndicator(
                  color: colorAppBar,
                );
              } else {
                if (_registrationStore.tasks.isEmpty) {
                  return Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Icon(
                        Icons.fact_check,
                        color: Colors.grey[300],
                        size: MediaQuery.of(context).size.height * 0.25,
                      ),
                      const Text(
                        'Você não tem nenhuma tarefa \npara hoje',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Uau, você não tem nenhuma tarefa prevista para hoje, mas você pode cadastrar novas agora mesmo.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: _registrationStore.tasks.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => StopWatchScreen(
                                    task: _registrationStore.tasks[index],
                                  ),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            },
                            child: CardTaskAbstract(
                              _registrationStore.tasks[index].nameTask!,
                              _registrationStore.tasks[index].initHour,
                              _registrationStore.tasks[index].endHour,
                              _registrationStore.tasks[index],
                              (value) {
                                _registrationStore.deleteTask(
                                    _registrationStore.tasks[index].id!);
                              },
                            ).create(context),
                          );
                          //return Text(_registrationStore.tasks[index].nameTask!);
                        }),
                  );
                }
              }
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const NewTaskScreen()),
            (Route<dynamic> route) => false,
          );
        },
        backgroundColor: colorAppBar,
        child: const Icon(Icons.add),
      ),
    );
  }
}
