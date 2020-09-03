class SongModel {
  String name;
  String note;

  SongModel({this.name, this.note});

  SongModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    checkNull(name);
    note = json['Note'];
    checkNull(note);
  }

  String checkNull(String string){
    if (string == null) {
      return '';
    } else {
      return string;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Note'] = this.note;
    return data;
  }
}

