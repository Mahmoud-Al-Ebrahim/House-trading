import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/Favorite Provider.dart';
import 'Discount Price Widget.dart';
import '../Models/Data.dart';
import 'Place Details.dart';

class PlacesScreen extends StatefulWidget {
  List<Data> places;

  PlacesScreen(this.places);

  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 1.2,
        children: List.generate(widget.places.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, PlaceDetails.routeName,
                  arguments: {'place': widget.places[index]});
            },
            child: SizedBox(
              width: deviceSize.width * 0.48,
              height: deviceSize.height * 0.2,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Image.network(
                        widget.places[index].photos[0],
                        width: deviceSize.width * 0.48,
                        height: deviceSize.height * 0.2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2, right: 2, top: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              widget.places[index].property.roof,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          Column(
                            children: [
                              DiscountProduct(
                                  widget.places[index].listPrice.toString()),
                              Text(
                                widget.places[index].sales.closePrice
                                        .toString() +
                                    '\$',
                                style: Theme.of(context).textTheme.headline2,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: IconButton(
                          icon: Icon(Icons.favorite),
                          onPressed: () {
                            Provider.of<FavoriteProvider>(context,
                                    listen: false)
                                .changeFromToFavorite(widget.places[index]);
                          },
                          color: Provider.of<FavoriteProvider>(context)
                                  .favorites
                                  .any((element) => (element.listingId ==
                                      widget.places[index].listingId))
                              ? Theme.of(context).accentColor
                              : Colors.grey,
                        ))
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
