import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Fetch%20Data%20Bloc/Fetch%20Data%20Bloc.dart';
import '../Fetch%20Data%20Bloc/Fetch%20Data%20States.dart';
import '../Models/Data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MyMap extends StatefulWidget {
  List<Data> places;

  MyMap(this.places);

  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  Completer<GoogleMapController> _controller = Completer();
  static List<Marker> myMarkers = [];

  @override
  void initState() {
    setMapList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchDataBloc, FetchDataState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
            ),
          );
        } else if (state is ErrorState) {
          return Center(
            child: Text(state.messageError,
                style: Theme.of(context).textTheme.headline3),
          );
        } else if (state is LoadingDataSuccessfulState) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
                target:
                    LatLng(state.places[0].geo.lat, state.places[0].geo.lng),
                zoom: 9),
            onMapCreated: (GoogleMapController controller) async {
              String style = await DefaultAssetBundle.of(context)
                  .loadString('assets/map_style.json');
              controller.setMapStyle(style);
              _controller.complete(controller);
            },
            mapType: MapType.normal,
            markers: Set.from(myMarkers),
          );
        } else
          return null;
      },
    );
  }
  void setMapList() {
    for (int i = 1; i < widget.places.length; i++) {
      myMarkers.add(Marker(
          position: LatLng(widget.places[i].geo.lat, widget.places[i].geo.lng),
          markerId: MarkerId(
              LatLng(widget.places[i].geo.lat, widget.places[i].geo.lng)
                  .toString())));
    }
  }
}
