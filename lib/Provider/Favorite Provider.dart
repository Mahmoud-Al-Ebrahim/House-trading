import 'dart:convert' as convert;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/Data.dart';
class FavoriteProvider with ChangeNotifier{
  List<Data> favorites;
  changeFromToFavorite(Data place)async
  {
    int size=favorites.length;
    for(int i=0;i<favorites.length;i++)
      if(favorites[i].listingId ==place.listingId) {
        favorites.remove(favorites[i]);
        uploadDataToShared();
        break;
      }
if(size ==favorites.length){
  favorites.add(place);
  uploadDataToShared();
}
notifyListeners();
  }
  uploadDataFromShared()async
  {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    var data=prefs.getStringList('favorites');
    if(data==null) {
      favorites = [];
      prefs.setStringList('favorites',[]);
    }
    else {
      if(data.isEmpty)
        {
          favorites=[];
        }
      else{
        favorites=[];
        favorites= List<Data>.from(data.map((place)=>Data.fromJson(json.decode(place))));
      }
    }
    notifyListeners();
  }
  void uploadDataToShared()async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
   if(favorites.isEmpty)
     prefs.setStringList('favorites', []);
   else{
     prefs.setStringList('favorites', (favorites.map((favorite) =>(json.encode(favorite.toJson()))).toList()));
   }
  }
}
