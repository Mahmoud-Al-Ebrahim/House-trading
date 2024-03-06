import 'package:task_bloc_map_provider/Models/Contact.dart';

class CoAgent {
  Null officeMlsId;
  Null lastName;
  Contact contact;
  Null address;
  Null firstName;
  String id;

  CoAgent(
      {this.officeMlsId,
        this.lastName,
        this.contact,
        this.address,
        this.firstName,
        this.id});

  CoAgent.fromJson(Map<String, dynamic> json) {
    officeMlsId = json['officeMlsId'];
    lastName = json['lastName'];
    contact = (json['contact'] != null ? new Contact.fromJson(json['contact']) : null) ;
    address = json['address'];
    firstName = json['firstName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['officeMlsId'] = this.officeMlsId;
    data['lastName'] = this.lastName;
    data['contact'] = this.contact;
    data['address'] = this.address;
    data['firstName'] = this.firstName;
    data['id'] = this.id;
    return data;
  }
}