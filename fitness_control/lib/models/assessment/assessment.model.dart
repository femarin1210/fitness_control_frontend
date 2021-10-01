class AssessmentModel {
  int id;
  String type;
  String title;
  String date;
  int height;
  int weight;
  double fatPercentage;
  int chest;
  int biceps;
  int waist;
  int hip;
  int thigh;
  int calf;
  String active;
  int idUser;

  AssessmentModel(
      {this.id,
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
      this.idUser});

  AssessmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    date = json['date'];
    height = json['height'];
    weight = json['weight'];
    fatPercentage = json['fatPercentage'];
    chest = json['chest'];
    biceps = json['biceps'];
    waist = json['waist'];
    hip = json['hip'];
    thigh = json['thigh'];
    calf = json['calf'];
    active = json['active'];
    idUser = json['idUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['title'] = this.title;
    data['date'] = this.date;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['fatPercentage'] = this.fatPercentage;
    data['chest'] = this.chest;
    data['biceps'] = this.biceps;
    data['waist'] = this.waist;
    data['hip'] = this.hip;
    data['thigh'] = this.thigh;
    data['calf'] = this.calf;
    data['active'] = this.active;
    data['idUser'] = this.idUser;
    return data;
  }
}