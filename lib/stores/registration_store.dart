import 'package:agenda/models/tasks.dart';
import 'package:agenda/services/task_service.dart';
import 'package:mobx/mobx.dart';

part 'registration_store.g.dart';

class RegistrationStore = _RegistrationStore with _$RegistrationStore;

abstract class _RegistrationStore with Store {
  final _taskService = TaskService();

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
  Future<void> insertTask() async {
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
  } 
}
