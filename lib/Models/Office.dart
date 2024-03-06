import 'package:task_bloc_map_provider/Models/Contact.dart';

class Office {
  Contact contact;
  String name;
  String servingName;
  String brokerid;

  Office({this.contact, this.name, this.servingName, this.brokerid});

  Office.fromJson(Map<String, dynamic> json) {
    contact = (json['contact'] != null ? new Contact.fromJson(json['contact']) : null) ;
    name = json['name'];
    servingName = json['servingName'];
    brokerid = json['brokerid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact'] = this.contact;
    data['name'] = this.name;
    data['servingName'] = this.servingName;
    data['brokerid'] = this.brokerid;
    return data;
  }
}