import 'package:agenda/connections/db_connection.dart';
import 'package:agenda/factories/view/alerts.dart';
import 'package:agenda/models/tasks.dart';
import 'package:agenda/services/task_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../screens/home_screen/home_screen.dart';

part 'registration_store.g.dart';

class RegistrationStore = _RegistrationStore with _$RegistrationStore;

abstract class _RegistrationStore with Store {
  final _taskService = TaskService(SqfliteConnection());

  @observable
  ObservableList<Tasks> tasks = ObservableList.of([]);

  @observable
  String nameTask = '';

  @observable
  String dateTask = '';

  @observable
  String initHourTask = '';

  @observable
  String endHourTask = '';

  @observable
  double session = 1;

  @observable
  double duration = 1;

  @observable
  bool loadingNewTask = false;

  @observable
  bool loadingTasks = false;

  @observable
  bool isTask = false;

  @action
  void setTaskName(value) {
    nameTask = value;
  }

  @action
  void setIsTask() {
    isTask = !isTask;
  }

  @action
  void setTaskDate(value) {
    dateTask = value;
  }

  @action
  void setTaskInitHour(value) {
    initHourTask = value;
  }

  @action
  void setTaskEndHour(value) {
    endHourTask = value;
  }

  @action
  void setSessions(value) {
    session = value;
  }

  @action
  void setDuration(value) {
    duration = value;
  }

  @action
  Future<void> insertTask(BuildContext context) async {
    loadingNewTask = true;
    final task = Tasks(
      nameTask: nameTask,
      dateTask: dateTask,
      initHour: initHourTask,
      endHour: endHourTask,
      sessions: session.round(),
      durationSession: duration.round(),
      isTask: isTask ? 1 : 0,
    );
    await _taskService.insert(task);
    loadingNewTask = false;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
      (Route<dynamic> route) => false,
    );
    nameTask = '';
    dateTask = '';
    initHourTask = '';

    endHourTask = '';

    session = 1;
    duration = 1;
    AlertAbstract('Tarefa cadastrada', 'A tarefa foi cadastrada com sucesso')
        .create(context);
  }

  @action
  Future<void> updateTask(BuildContext context, Tasks task) async {
    loadingNewTask = true;
    print(task.toJson());
    await _taskService.update(task, SqfliteConnection().idTask);
    loadingNewTask = false;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
      (Route<dynamic> route) => false,
    );
    nameTask = '';
    dateTask = '';
    initHourTask = '';

    endHourTask = '';

    session = 1;
    duration = 1;
    AlertAbstract('Lembrete atualizado',
            'As informações foram atualizadas com sucesso')
        .create(context);
  }

  @action
  Future<void> getTasksToday() async {
    loadingTasks = true;
    tasks = ObservableList.of(await _taskService.getByValue(
        DateFormat('dd/MM/yyyy').format(DateTime.now()),
        SqfliteConnection().dateTask));
    loadingTasks = false;
  }

  @action
  Future<void> getTasks() async {
    loadingTasks = true;
    tasks = ObservableList.of(await _taskService.getAll());
    loadingTasks = false;
  }

  @action
  Future<void> deleteTask(int id) async {
    await _taskService.delete(id, SqfliteConnection().idTask);
    getTasks();
  }
}
