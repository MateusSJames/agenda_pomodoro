import 'package:agenda/factories/view/alerts.dart';
import 'package:agenda/models/tasks.dart';
import 'package:agenda/services/task_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../screens/home_screen/home_screen.dart';

part 'registration_store.g.dart';

class RegistrationStore = _RegistrationStore with _$RegistrationStore;

abstract class _RegistrationStore with Store {
  final _taskService = TaskService();

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

  @action
  void setTaskName(value) {
    nameTask = value;
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
    );
    await _taskService.insert(task);
    loadingNewTask = false;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
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
  Future<void> getTasks() async {
    loadingTasks = true;
    tasks = ObservableList.of(await _taskService.getAll());
    loadingTasks = false;
  }

  @action
  Future<void> deleteTask(int id) async {
    await _taskService.delete(id);
    getTasks();
  }
}
