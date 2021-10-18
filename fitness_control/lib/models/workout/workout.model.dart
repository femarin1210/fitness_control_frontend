import 'dart:convert';

class WorkoutModel {
  int id;
  String title;
  String dateStart;
  String dateFinal;
  int idUser;
  String status;
  int qtyWorkoutsWeek;
  bool busy;
  WorkoutModel({
    this.id,
    this.title,
    this.dateStart,
    this.dateFinal,
    this.idUser,
    this.status,
    this.qtyWorkoutsWeek,
    this.busy,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'dateStart': dateStart,
      'dateFinal': dateFinal,
      'idUser': idUser,
      'status': status,
      'qtyWorkoutsWeek': qtyWorkoutsWeek,
    };
  }

  factory WorkoutModel.fromMap(Map<String, dynamic> map) {
    return WorkoutModel(
      id: map['id'],
      title: map['title'],
      dateStart: map['dateStart'],
      dateFinal: map['dateFinal'],
      idUser: map['idUser'],
      status: map['status'],
      qtyWorkoutsWeek: map['qtyWorkoutsWeek'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkoutModel.fromJson(String source) => WorkoutModel.fromMap(json.decode(source));
}
