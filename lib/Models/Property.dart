import 'package:task_bloc_map_provider/Models/Parking.dart';

class Property {
  String roof;
  String cooling;
  String style;
  int area;
  int bathsFull;
  int bathsHalf;
  int stories;
  int fireplaces;
  String flooring;
  String heating;
  String bathrooms;
  String foundation;
  String laundryFeatures;
  String occupantName;
  String ownerName;
  String lotDescription;
  String pool;
  String subType;
  int bedrooms;
  String interiorFeatures;
  String lotSize;
  String areaSource;
  String maintenanceExpense;
  String additionalRooms;
  String exteriorFeatures;
  String water;
  String view;
  String lotSizeArea;
  String subdivision;
  String construction;
  Parking parking;
  String lotSizeAreaUnits;
  String type;
  double garageSpaces;
  String bathsThreeQuarter;
  String accessibility;
  String acres;
  String occupantType;
  String subTypeText;
  int yearBuilt;

  Property(
      {this.roof,
        this.cooling,
        this.style,
        this.area,
        this.bathsFull,
        this.bathsHalf,
        this.stories,
        this.fireplaces,
        this.flooring,
        this.heating,
        this.bathrooms,
        this.foundation,
        this.laundryFeatures,
        this.occupantName,
        this.ownerName,
        this.lotDescription,
        this.pool,
        this.subType,
        this.bedrooms,
        this.interiorFeatures,
        this.lotSize,
        this.areaSource,
        this.maintenanceExpense,
        this.additionalRooms,
        this.exteriorFeatures,
        this.water,
        this.view,
        this.lotSizeArea,
        this.subdivision,
        this.construction,
        this.parking,
        this.lotSizeAreaUnits,
        this.type,
        this.garageSpaces,
        this.bathsThreeQuarter,
        this.accessibility,
        this.acres,
        this.occupantType,
        this.subTypeText,
        this.yearBuilt});

  Property.fromJson(Map<String, dynamic> json) {
    roof = json['roof'];
    cooling = json['cooling'];
    style = json['style'];
    area = json['area'];
    bathsFull = json['bathsFull'];
    bathsHalf = json['bathsHalf'];
    stories = json['stories'];
    fireplaces = json['fireplaces'];
    flooring = json['flooring'];
    heating = json['heating'];
    bathrooms = json['bathrooms'];
    foundation = json['foundation'];
    laundryFeatures = json['laundryFeatures'];
    occupantName = json['occupantName'];
    ownerName = json['ownerName'];
    lotDescription = json['lotDescription'];
    pool = json['pool'];
    subType = json['subType'];
    bedrooms = json['bedrooms'];
    interiorFeatures = json['interiorFeatures'];
    lotSize = json['lotSize'];
    areaSource = json['areaSource'];
    maintenanceExpense = json['maintenanceExpense'];
    additionalRooms = json['additionalRooms'];
    exteriorFeatures = json['exteriorFeatures'];
    water = json['water'];
    view = json['view'];
    lotSizeArea = json['lotSizeArea'];
    subdivision = json['subdivision'];
    construction = json['construction'];
    parking =
    json['parking'] != null ? new Parking.fromJson(json['parking']) : null;
    lotSizeAreaUnits = json['lotSizeAreaUnits'];
    type = json['type'];
    garageSpaces = json['garageSpaces'];
    bathsThreeQuarter = json['bathsThreeQuarter'];
    accessibility = json['accessibility'];
    acres = json['acres'];
    occupantType = json['occupantType'];
    subTypeText = json['subTypeText'];
    yearBuilt = json['yearBuilt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roof'] = this.roof;
    data['cooling'] = this.cooling;
    data['style'] = this.style;
    data['area'] = this.area;
    data['bathsFull'] = this.bathsFull;
    data['bathsHalf'] = this.bathsHalf;
    data['stories'] = this.stories;
    data['fireplaces'] = this.fireplaces;
    data['flooring'] = this.flooring;
    data['heating'] = this.heating;
    data['bathrooms'] = this.bathrooms;
    data['foundation'] = this.foundation;
    data['laundryFeatures'] = this.laundryFeatures;
    data['occupantName'] = this.occupantName;
    data['ownerName'] = this.ownerName;
    data['lotDescription'] = this.lotDescription;
    data['pool'] = this.pool;
    data['subType'] = this.subType;
    data['bedrooms'] = this.bedrooms;
    data['interiorFeatures'] = this.interiorFeatures;
    data['lotSize'] = this.lotSize;
    data['areaSource'] = this.areaSource;
    data['maintenanceExpense'] = this.maintenanceExpense;
    data['additionalRooms'] = this.additionalRooms;
    data['exteriorFeatures'] = this.exteriorFeatures;
    data['water'] = this.water;
    data['view'] = this.view;
    data['lotSizeArea'] = this.lotSizeArea;
    data['subdivision'] = this.subdivision;
    data['construction'] = this.construction;
    if (this.parking != null) {
      data['parking'] = this.parking.toJson();
    }
    data['lotSizeAreaUnits'] = this.lotSizeAreaUnits;
    data['type'] = this.type;
    data['garageSpaces'] = this.garageSpaces;
    data['bathsThreeQuarter'] = this.bathsThreeQuarter;
    data['accessibility'] = this.accessibility;
    data['acres'] = this.acres;
    data['occupantType'] = this.occupantType;
    data['subTypeText'] = this.subTypeText;
    data['yearBuilt'] = this.yearBuilt;
    return data;
  }
}