// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stopwatch_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StopWatchStore on _StopWatchStore, Store {
  Computed<String>? _$hoursComputed;

  @override
  String get hours => (_$hoursComputed ??=
          Computed<String>(() => super.hours, name: '_StopWatchStore.hours'))
      .value;
  Computed<String>? _$minutesComputed;

  @override
  String get minutes =>
      (_$minutesComputed ??= Computed<String>(() => super.minutes,
              name: '_StopWatchStore.minutes'))
          .value;
  Computed<String>? _$secondsComputed;

  @override
  String get seconds =>
      (_$secondsComputed ??= Computed<String>(() => super.seconds,
              name: '_StopWatchStore.seconds'))
          .value;
  Computed<String>? _$nameButtonComputed;

  @override
  String get nameButton =>
      (_$nameButtonComputed ??= Computed<String>(() => super.nameButton,
              name: '_StopWatchStore.nameButton'))
          .value;

  late final _$isRunningAtom =
      Atom(name: '_StopWatchStore.isRunning', context: context);

  @override
  bool get isRunning {
    _$isRunningAtom.reportRead();
    return super.isRunning;
  }

  @override
  set isRunning(bool value) {
    _$isRunningAtom.reportWrite(value, super.isRunning, () {
      super.isRunning = value;
    });
  }

  late final _$isBreakAtom =
      Atom(name: '_StopWatchStore.isBreak', context: context);

  @override
  bool get isBreak {
    _$isBreakAtom.reportRead();
    return super.isBreak;
  }

  @override
  set isBreak(bool value) {
    _$isBreakAtom.reportWrite(value, super.isBreak, () {
      super.isBreak = value;
    });
  }

  late final _$durationAtom =
      Atom(name: '_StopWatchStore.duration', context: context);

  @override
  Duration get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(Duration value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  late final _$_StopWatchStoreActionController =
      ActionController(name: '_StopWatchStore', context: context);

  @override
  void addTime() {
    final _$actionInfo = _$_StopWatchStoreActionController.startAction(
        name: '_StopWatchStore.addTime');
    try {
      return super.addTime();
    } finally {
      _$_StopWatchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startTime({bool resets = true}) {
    final _$actionInfo = _$_StopWatchStoreActionController.startAction(
        name: '_StopWatchStore.startTime');
    try {
      return super.startTime(resets: resets);
    } finally {
      _$_StopWatchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$_StopWatchStoreActionController.startAction(
        name: '_StopWatchStore.reset');
    try {
      return super.reset();
    } finally {
      _$_StopWatchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsRunning() {
    final _$actionInfo = _$_StopWatchStoreActionController.startAction(
        name: '_StopWatchStore.setIsRunning');
    try {
      return super.setIsRunning();
    } finally {
      _$_StopWatchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopTime({bool resets = true}) {
    final _$actionInfo = _$_StopWatchStoreActionController.startAction(
        name: '_StopWatchStore.stopTime');
    try {
      return super.stopTime(resets: resets);
    } finally {
      _$_StopWatchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String twoDigits(int n) {
    final _$actionInfo = _$_StopWatchStoreActionController.startAction(
        name: '_StopWatchStore.twoDigits');
    try {
      return super.twoDigits(n);
    } finally {
      _$_StopWatchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isRunning: ${isRunning},
isBreak: ${isBreak},
duration: ${duration},
hours: ${hours},
minutes: ${minutes},
seconds: ${seconds},
nameButton: ${nameButton}
    ''';
  }
}
