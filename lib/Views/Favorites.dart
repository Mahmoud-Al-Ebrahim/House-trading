import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/Favorite%20Provider.dart';
import '../Views/Discount%20Price%20Widget.dart';
import '../Views/Place%20Details.dart';

class Favorites extends StatelessWidget {
  static String routeName = '/Favorites_Screen';

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(
            'Favorites',
            style: Theme.of(context).textTheme.headline1,
          ),
          centerTitle: true,
        ),
        body: Provider.of<FavoriteProvider>(context).favorites.isEmpty
            ? Center(
                child: Text('There is no favorite places',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.brown,
                        fontSize: 25,
                        fontWeight: FontWeight.w600)))
            : GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 1.2,
                children: List.generate(
                    Provider.of<FavoriteProvider>(context).favorites.length,
                    (index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, PlaceDetails.routeName,
                          arguments: {
                            'place': Provider.of<FavoriteProvider>(context,
                                    listen: false)
                                .favorites[index]
                          });
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
                                Provider.of<FavoriteProvider>(context)
                                    .favorites[index]
                                    .photos[0],
                                width: deviceSize.width * 0.48,
                                height: deviceSize.height * 0.2,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 2, right: 2, top: 2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(
                                      Provider.of<FavoriteProvider>(context)
                                          .favorites[index]
                                          .property
                                          .roof,
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      DiscountProduct(
                                          Provider.of<FavoriteProvider>(context)
                                              .favorites[index]
                                              .listPrice
                                              .toString()),
                                      Text(
                                        Provider.of<FavoriteProvider>(context)
                                                .favorites[index]
                                                .sales
                                                .closePrice
                                                .toString() +
                                            '\$',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
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
                                          .changeFromToFavorite(
                                              Provider.of<FavoriteProvider>(
                                                      context,
                                                      listen: false)
                                                  .favorites[index]);
                                    },
                                    color: Theme.of(context).accentColor))
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ));
  }
}
