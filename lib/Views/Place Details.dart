import 'package:flutter/material.dart';
import '../Models/Data.dart';

class PlaceDetails extends StatelessWidget {
  static String routeName = '/PlaceDetails';
  Data place;

  @override
  Widget build(BuildContext context) {
    Map<String, Data> data = ModalRoute.of(context).settings.arguments;
    place = data['place'];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            snap: true,
            floating: true,
            backgroundColor: Colors.brown,
            flexibleSpace: Stack(children: [
              Positioned.fill(
                child: Image.network(
                  place.photos[0],
                  fit: BoxFit.cover,
                ),
              )
            ]),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverFillRemaining(
              child: buildContent(context),
            ),
          )
        ],
      ),
    );
  }

  buildContent(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Roof: ' + place.property.roof,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.brown, fontSize: 25),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Private Remarks:',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.brown, fontSize: 25),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            place.privateRemarks,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Price: ' + place.sales.closePrice.toString() + '\$',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.brown, fontSize: 25),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Style: ' + place.property.style,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.brown, fontSize: 25),
          ),
        ),
      ],
    );
  }
}
