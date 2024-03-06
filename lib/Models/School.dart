class School {
  String middleSchool;
  String highSchool;
  String elementarySchool;
  String district;

  School(
      {this.middleSchool,
        this.highSchool,
        this.elementarySchool,
        this.district});

  School.fromJson(Map<String, dynamic> json) {
    middleSchool = json['middleSchool'];
    highSchool = json['highSchool'];
    elementarySchool = json['elementarySchool'];
    district = json['district'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['middleSchool'] = this.middleSchool;
    data['highSchool'] = this.highSchool;
    data['elementarySchool'] = this.elementarySchool;
    data['district'] = this.district;
    return data;
  }
}