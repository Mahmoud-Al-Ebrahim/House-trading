class Parking {
  String leased;
  int spaces;
  String description;

  Parking({this.leased, this.spaces, this.description});

  Parking.fromJson(Map<String, dynamic> json) {
    leased = json['leased'];
    spaces = json['spaces'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leased'] = this.leased;
    data['spaces'] = this.spaces;
    data['description'] = this.description;
    return data;
  }
}