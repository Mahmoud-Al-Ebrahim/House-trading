class Address {
  String crossStreet;
  String state;
  String country;
  String postalCode;
  String streetName;
  String streetNumberText;
  String city;
  int streetNumber;
  String full;
  String unit;

  Address(
      {this.crossStreet,
        this.state,
        this.country,
        this.postalCode,
        this.streetName,
        this.streetNumberText,
        this.city,
        this.streetNumber,
        this.full,
        this.unit});

  Address.fromJson(Map<String, dynamic> json) {
    crossStreet = json['crossStreet'];
    state = json['state'];
    country = json['country'];
    postalCode = json['postalCode'];
    streetName = json['streetName'];
    streetNumberText = json['streetNumberText'];
    city = json['city'];
    streetNumber = json['streetNumber'];
    full = json['full'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['crossStreet'] = this.crossStreet;
    data['state'] = this.state;
    data['country'] = this.country;
    data['postalCode'] = this.postalCode;
    data['streetName'] = this.streetName;
    data['streetNumberText'] = this.streetNumberText;
    data['city'] = this.city;
    data['streetNumber'] = this.streetNumber;
    data['full'] = this.full;
    data['unit'] = this.unit;
    return data;
  }
}