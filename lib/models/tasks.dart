class Tasks {
  int? id;
  String? nameTask;
  String? dateTask;
  String? initHour;
  String? endHour;
  int? sessions;
  int? durationSession;
  int? isTask;

  Tasks({
    this.id,
    required this.nameTask,
    required this.dateTask,
    required this.initHour,
    required this.endHour,
    required this.sessions,
    required this.durationSession,
    required this.isTask,
  });

  factory Tasks.fromJson(Map<String, dynamic> map) => Tasks(
      id: map['id'],
      nameTask: map['name'],
      dateTask: map['date'],
      initHour: map['initHour'],
      endHour: map['endHour'],
      sessions: map['sessions'],
      durationSession: map['duration'],
      isTask: map['isTask']);

  Map<String, dynamic> toJson() {
    var aux = <String, dynamic>{
      'id': id,
      'name': nameTask,
      'date': dateTask,
      'initHour': initHour,
      'endHour': endHour,
      'sessions': sessions,
      'duration': durationSession,
      'isTask': isTask,
    };
    return aux;
  }
}
