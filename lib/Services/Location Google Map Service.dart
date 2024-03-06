
import 'package:location/location.dart';

class LocationService{

  Future<LocationData> getLocation()async{
    Location _location=Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled=await _location.serviceEnabled();
    if(!_serviceEnabled){
      _serviceEnabled=await _location.requestService();
    }

    if(!_serviceEnabled){
      throw Exception();
    }
    _permissionGranted=await _location.hasPermission();
    if(_permissionGranted==PermissionStatus.denied)
    {
      _permissionGranted=await _location.requestPermission();
    }
    if(_permissionGranted!=PermissionStatus.granted)
    {
      throw Exception();
    }
    _locationData=await _location.getLocation();
    return _locationData;
  }
}