class Mls {
  String status;
  String area;
  int daysOnMarket;
  String originalEntryTimestamp;
  String originatingSystemName;
  String statusText;
  String areaMinor;

  Mls(
      {this.status,
        this.area,
        this.daysOnMarket,
        this.originalEntryTimestamp,
        this.originatingSystemName,
        this.statusText,
        this.areaMinor});

  Mls.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    area = json['area'];
    daysOnMarket = json['daysOnMarket'];
    originalEntryTimestamp = json['originalEntryTimestamp'];
    originatingSystemName = json['originatingSystemName'];
    statusText = json['statusText'];
    areaMinor = json['areaMinor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['area'] = this.area;
    data['daysOnMarket'] = this.daysOnMarket;
    data['originalEntryTimestamp'] = this.originalEntryTimestamp;
    data['originatingSystemName'] = this.originatingSystemName;
    data['statusText'] = this.statusText;
    data['areaMinor'] = this.areaMinor;
    return data;
  }
}