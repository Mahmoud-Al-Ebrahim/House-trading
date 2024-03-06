class Contact {
  String email;
  String office;
  Null cell;

  Contact({this.email, this.office, this.cell});

  Contact.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    office = json['office'];
    cell = json['cell'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['office'] = this.office;
    data['cell'] = this.cell;
    return data;
  }
}