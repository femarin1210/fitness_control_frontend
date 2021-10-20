import 'dart:convert';

class WorkoutSequenceModel {
  int id;
  String title;
  String workout;
  int sequence;
  String status;
  int idWorkout;
  int idUser;
  bool busy;
  WorkoutSequenceModel({
    this.id,
    this.title,
    this.workout,
    this.sequence,
    this.status,
    this.idWorkout,
    this.idUser,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'workout': workout,
      'sequence': sequence,
      'status': status,
      'idWorkout': idWorkout,
      'idUser': idUser,
    };
  }

  factory WorkoutSequenceModel.fromMap(Map<String, dynamic> map) {
    return WorkoutSequenceModel(
      id: map['id'],
      title: map['title'],
      workout: map['workout'],
      sequence: map['sequence'],
      status: map['status'],
      idWorkout: map['idWorkout'],
      idUser: map['idUser'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkoutSequenceModel.fromJson(String source) => WorkoutSequenceModel.fromMap(json.decode(source));
}
