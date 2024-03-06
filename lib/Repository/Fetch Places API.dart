
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:task_bloc_map_provider/Models/Data.dart';

class FetchPlacesAPI{
   String url='https://api.simplyrets.com/properties';
  FetchData()async{
    List<Data>posts=[];
    var response= await http.get(url,headers: {
      HttpHeaders.authorizationHeader: 'Basic c2ltcGx5cmV0czpzaW1wbHlyZXRz'
    });
    if(response.statusCode==200)
    {
      var data=json.decode(response.body) as List;
      data.map((palce)=>posts.add(Data.fromJson(palce))).toList();
      return posts;
    }
  }
}