class Tasks {
  String? nameTask;
  String? dateTask;
  String? initHour;
  String? endHour;
  int? sessions;
  int? durationSession;

  Tasks({
    required this.nameTask,
    required this.dateTask,
    required this.initHour,
    required this.endHour,
    required this.sessions,
    required this.durationSession,
  });

  factory Tasks.fromJson(Map<String, dynamic> map) => Tasks(
        nameTask: map['name'],
        dateTask: map['date'],
        initHour: map['initHour'],
        endHour: map['endHour'],
        sessions: map['sessions'],
        durationSession: map['duration'],
      );

  Map<String, dynamic> toJson() {
    var aux = <String, dynamic>{
      'name': nameTask,
      'date': dateTask,
      'initHour': initHour,
      'endHour': endHour,
      'sessions': sessions,
      'duration': durationSession,
    };
    return aux;
  }
}
