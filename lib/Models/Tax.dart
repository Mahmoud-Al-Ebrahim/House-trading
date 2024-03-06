class Tax {
  int taxYear;
  int taxAnnualAmount;
  String id;

  Tax({this.taxYear, this.taxAnnualAmount, this.id});

  Tax.fromJson(Map<String, dynamic> json) {
    taxYear = json['taxYear'];
    taxAnnualAmount = json['taxAnnualAmount'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taxYear'] = this.taxYear;
    data['taxAnnualAmount'] = this.taxAnnualAmount;
    data['id'] = this.id;
    return data;
  }
}