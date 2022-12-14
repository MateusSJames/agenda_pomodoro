import 'dart:async';

import 'package:mobx/mobx.dart';

part 'stopwatch_store.g.dart';

class StopWatchStore = _StopWatchStore with _$StopWatchStore;

abstract class _StopWatchStore with Store {
  Timer? timer;

  @observable
  bool isRunning = false;

  @observable
  bool isBreak = false;

  @observable
  int sessions = 0;

  @observable
  Duration duration = const Duration();

  @action
  void setDuration(value) {
    duration = Duration(minutes: value);
  }

  @action
  void setSessions(value) {
    sessions = value;
  }

  @action
  void addTime() {
    const addSeconds = -1;
    final seconds = addSeconds + duration.inSeconds;
    if (seconds == 0) {
      stopTime(value: duration.inMinutes);
      setSessions(sessions - 1);
    }
    if (seconds < 0) {
      timer!.cancel();
    } else {
      duration = Duration(seconds: seconds);
    }
  }

  @action
  void startTime({bool resets = true, int? value}) {
    if (resets) {
      reset(value!);
    }
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => addTime(),
    );
    isRunning = timer == null ? false : timer!.isActive;
  }

  @action
  void reset(int value) {
    duration = Duration(minutes: value);
  }

  @action
  void setIsRunning() {
    isBreak = !isBreak;
  }

  @action
  void stopTime({bool resets = true, int? value}) {
    if (resets) {
      reset(value!);
      isRunning = false;
    }
    timer?.cancel();
  }

  // @action
  // void startTime() {
  //   timer = Timer.periodic(
  //     const Duration(seconds: 1),
  //     (_) => addTime(),
  //   );
  // }

  @action
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  @computed
  String get hours => twoDigits(duration.inHours.remainder(60));

  @computed
  String get minutes => twoDigits(duration.inMinutes.remainder(60));

  @computed
  String get seconds => twoDigits(duration.inSeconds.remainder(60));

  @computed
  String get nameButton => isRunning && timer!.isActive ? 'Parar' : 'Retornar';
}
