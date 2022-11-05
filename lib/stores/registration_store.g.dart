// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegistrationStore on _RegistrationStore, Store {
  late final _$tasksAtom =
      Atom(name: '_RegistrationStore.tasks', context: context);

  @override
  ObservableList<Tasks> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<Tasks> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$nameTaskAtom =
      Atom(name: '_RegistrationStore.nameTask', context: context);

  @override
  String get nameTask {
    _$nameTaskAtom.reportRead();
    return super.nameTask;
  }

  @override
  set nameTask(String value) {
    _$nameTaskAtom.reportWrite(value, super.nameTask, () {
      super.nameTask = value;
    });
  }

  late final _$dateTaskAtom =
      Atom(name: '_RegistrationStore.dateTask', context: context);

  @override
  String get dateTask {
    _$dateTaskAtom.reportRead();
    return super.dateTask;
  }

  @override
  set dateTask(String value) {
    _$dateTaskAtom.reportWrite(value, super.dateTask, () {
      super.dateTask = value;
    });
  }

  late final _$initHourTaskAtom =
      Atom(name: '_RegistrationStore.initHourTask', context: context);

  @override
  String get initHourTask {
    _$initHourTaskAtom.reportRead();
    return super.initHourTask;
  }

  @override
  set initHourTask(String value) {
    _$initHourTaskAtom.reportWrite(value, super.initHourTask, () {
      super.initHourTask = value;
    });
  }

  late final _$endHourTaskAtom =
      Atom(name: '_RegistrationStore.endHourTask', context: context);

  @override
  String get endHourTask {
    _$endHourTaskAtom.reportRead();
    return super.endHourTask;
  }

  @override
  set endHourTask(String value) {
    _$endHourTaskAtom.reportWrite(value, super.endHourTask, () {
      super.endHourTask = value;
    });
  }

  late final _$sessionAtom =
      Atom(name: '_RegistrationStore.session', context: context);

  @override
  double get session {
    _$sessionAtom.reportRead();
    return super.session;
  }

  @override
  set session(double value) {
    _$sessionAtom.reportWrite(value, super.session, () {
      super.session = value;
    });
  }

  late final _$durationAtom =
      Atom(name: '_RegistrationStore.duration', context: context);

  @override
  double get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(double value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  late final _$loadingNewTaskAtom =
      Atom(name: '_RegistrationStore.loadingNewTask', context: context);

  @override
  bool get loadingNewTask {
    _$loadingNewTaskAtom.reportRead();
    return super.loadingNewTask;
  }

  @override
  set loadingNewTask(bool value) {
    _$loadingNewTaskAtom.reportWrite(value, super.loadingNewTask, () {
      super.loadingNewTask = value;
    });
  }

  late final _$loadingTasksAtom =
      Atom(name: '_RegistrationStore.loadingTasks', context: context);

  @override
  bool get loadingTasks {
    _$loadingTasksAtom.reportRead();
    return super.loadingTasks;
  }

  @override
  set loadingTasks(bool value) {
    _$loadingTasksAtom.reportWrite(value, super.loadingTasks, () {
      super.loadingTasks = value;
    });
  }

  late final _$insertTaskAsyncAction =
      AsyncAction('_RegistrationStore.insertTask', context: context);

  @override
  Future<void> insertTask(BuildContext context) {
    return _$insertTaskAsyncAction.run(() => super.insertTask(context));
  }

  late final _$getTasksTodayAsyncAction =
      AsyncAction('_RegistrationStore.getTasksToday', context: context);

  @override
  Future<void> getTasksToday() {
    return _$getTasksTodayAsyncAction.run(() => super.getTasksToday());
  }

  late final _$getTasksAsyncAction =
      AsyncAction('_RegistrationStore.getTasks', context: context);

  @override
  Future<void> getTasks() {
    return _$getTasksAsyncAction.run(() => super.getTasks());
  }

  late final _$deleteTaskAsyncAction =
      AsyncAction('_RegistrationStore.deleteTask', context: context);

  @override
  Future<void> deleteTask(int id) {
    return _$deleteTaskAsyncAction.run(() => super.deleteTask(id));
  }

  late final _$_RegistrationStoreActionController =
      ActionController(name: '_RegistrationStore', context: context);

  @override
  void setTaskName(dynamic value) {
    final _$actionInfo = _$_RegistrationStoreActionController.startAction(
        name: '_RegistrationStore.setTaskName');
    try {
      return super.setTaskName(value);
    } finally {
      _$_RegistrationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTaskDate(dynamic value) {
    final _$actionInfo = _$_RegistrationStoreActionController.startAction(
        name: '_RegistrationStore.setTaskDate');
    try {
      return super.setTaskDate(value);
    } finally {
      _$_RegistrationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTaskInitHour(dynamic value) {
    final _$actionInfo = _$_RegistrationStoreActionController.startAction(
        name: '_RegistrationStore.setTaskInitHour');
    try {
      return super.setTaskInitHour(value);
    } finally {
      _$_RegistrationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTaskEndHour(dynamic value) {
    final _$actionInfo = _$_RegistrationStoreActionController.startAction(
        name: '_RegistrationStore.setTaskEndHour');
    try {
      return super.setTaskEndHour(value);
    } finally {
      _$_RegistrationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSessions(dynamic value) {
    final _$actionInfo = _$_RegistrationStoreActionController.startAction(
        name: '_RegistrationStore.setSessions');
    try {
      return super.setSessions(value);
    } finally {
      _$_RegistrationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDuration(dynamic value) {
    final _$actionInfo = _$_RegistrationStoreActionController.startAction(
        name: '_RegistrationStore.setDuration');
    try {
      return super.setDuration(value);
    } finally {
      _$_RegistrationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks},
nameTask: ${nameTask},
dateTask: ${dateTask},
initHourTask: ${initHourTask},
endHourTask: ${endHourTask},
session: ${session},
duration: ${duration},
loadingNewTask: ${loadingNewTask},
loadingTasks: ${loadingTasks}
    ''';
  }
}
