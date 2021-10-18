import 'dart:convert';

class WorkoutSequenceModel {
  int id;
  String title;
  int sequence;
  String status;
  int idworkout;
  int idUser;
  bool busy;
  WorkoutSequenceModel({
    this.id,
    this.title,
    this.sequence,
    this.status,
    this.idworkout,
    this.idUser,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'sequence': sequence,
      'status': status,
      'idworkout': idworkout,
      'idUser': idUser,
    };
  }

  factory WorkoutSequenceModel.fromMap(Map<String, dynamic> map) {
    return WorkoutSequenceModel(
      id: map['id'],
      title: map['title'],
      sequence: map['sequence'],
      status: map['status'],
      idworkout: map['idworkout'],
      idUser: map['idUser'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkoutSequenceModel.fromJson(String source) => WorkoutSequenceModel.fromMap(json.decode(source));
}
