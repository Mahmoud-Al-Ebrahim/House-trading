import 'package:task_bloc_map_provider/Models/Contact.dart';

class Agent {
  String officeMlsId;
  String lastName;
  Contact contact;
  String address;
  String firstName;
  String id;
  Agent(
      {this.officeMlsId,
        this.lastName,
        this.contact,
        this.address,
        this.firstName,
        this.id});

  Agent.fromJson(Map<String, dynamic> json) {
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