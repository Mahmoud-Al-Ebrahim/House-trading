class Geo {
  String county;
  double lat;
  double lng;
  String marketArea;
  String directions;

  Geo({this.county, this.lat, this.lng, this.marketArea, this.directions});

  Geo.fromJson(Map<String, dynamic> json) {
    county = json['county'];
    lat = json['lat'];
    lng = json['lng'];
    marketArea = json['marketArea'];
    directions = json['directions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['county'] = this.county;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['marketArea'] = this.marketArea;
    data['directions'] = this.directions;
    return data;
  }
}