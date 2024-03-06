class Association {
  String frequency;
  int fee;
  String name;
  String amenities;

  Association({this.frequency, this.fee, this.name, this.amenities});

  Association.fromJson(Map<String, dynamic> json) {
    frequency = json['frequency'];
    fee = json['fee'];
    name = json['name'];
    amenities = json['amenities'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['frequency'] = this.frequency;
    data['fee'] = this.fee;
    data['name'] = this.name;
    data['amenities'] = this.amenities;
    return data;
  }
}