import 'dart:convert';

class AssessmentModel {
  int id;
  String type;
  String title;
  String date;
  num height;
  num weight;
  num fatPercentage;
  int chest;
  int biceps;
  int waist;
  int hip;
  int thigh;
  int calf;
  String active;
  int idUser;
  bool busy;
  AssessmentModel({
    this.id,
    this.type,
    this.title,
    this.date,
    this.height,
    this.weight,
    this.fatPercentage,
    this.chest,
    this.biceps,
    this.waist,
    this.hip,
    this.thigh,
    this.calf,
    this.active,
    this.idUser,
    this.busy,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'date': date,
      'height': height,
      'weight': weight,
      'fatPercentage': fatPercentage,
      'chest': chest,
      'biceps': biceps,
      'waist': waist,
      'hip': hip,
      'thigh': thigh,
      'calf': calf,
      'active': active,
      'idUser': idUser,
    };
  }

  factory AssessmentModel.fromMap(Map<String, dynamic> map) {
    return AssessmentModel(
      id: map['id'],
      type: map['type'],
      title: map['title'],
      date: map['date'],
      height: map['height'],
      weight: map['weight'],
      fatPercentage: map['fatPercentage'],
      chest: map['chest'],
      biceps: map['biceps'],
      waist: map['waist'],
      hip: map['hip'],
      thigh: map['thigh'],
      calf: map['calf'],
      active: map['active'],
      idUser: map['idUser'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AssessmentModel.fromJson(String source) => AssessmentModel.fromMap(json.decode(source));
}
