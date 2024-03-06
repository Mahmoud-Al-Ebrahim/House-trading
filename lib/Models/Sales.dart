import 'package:task_bloc_map_provider/Models/Agent.dart';
import 'package:task_bloc_map_provider/Models/Office.dart';

class Sales {
  String closeDate;
  Office office;
  int closePrice;
  Agent agent;
  String contractDate;

  Sales(
      {this.closeDate,
        this.office,
        this.closePrice,
        this.agent,
        this.contractDate});

  Sales.fromJson(Map<String, dynamic> json) {
    closeDate = json['closeDate'];
    office =
    json['office'] != null ? new Office.fromJson(json['office']) : null;
    closePrice = json['closePrice'];
    agent = json['agent'] != null ? new Agent.fromJson(json['agent']) : null;
    contractDate = json['contractDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['closeDate'] = this.closeDate;
    if (this.office != null) {
      data['office'] = this.office.toJson();
    }
    data['closePrice'] = this.closePrice;
    if (this.agent != null) {
      data['agent'] = this.agent.toJson();
    }
    data['contractDate'] = this.contractDate;
    return data;
  }
}