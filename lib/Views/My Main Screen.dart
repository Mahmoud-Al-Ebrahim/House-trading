import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:task_bloc_map_provider/Fetch%20Data%20Bloc/Fetch%20Data%20Event.dart';
import '../Fetch%20Data%20Bloc/Fetch%20Data%20Bloc.dart';
import '../Fetch%20Data%20Bloc/Fetch%20Data%20States.dart';
import '../Provider/Favorite%20Provider.dart';
import '../Views/Favorites.dart';
import '../Views/My%20Map.dart';
import '../Views/Places.dart';

class MyMainScreen extends StatefulWidget {
  static const routeName = '/MyMainScreen';

  @override
  _MyMainScreenState createState() => _MyMainScreenState();
}

class _MyMainScreenState extends State<MyMainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => FetchDataBloc()..add(FetchDataEvent()),
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Favorites.routeName);
                  },
                ),
              ],
              title: Text('My Sweat Home',
                  style: Theme.of(context).textTheme.headline1),
              centerTitle: true,
              backgroundColor: Theme.of(context).backgroundColor,
              bottom: TabBar(
                tabs: [
                  Tab(
                    child: Text('Places',
                        style: Theme.of(context).textTheme.headline1),
                  ),
                  Tab(
                      child: Text('Map',
                          style: Theme.of(context).textTheme.headline1)),
                ],
              ),
            ),
            body: BlocBuilder<FetchDataBloc, FetchDataState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).accentColor),
                    ),
                  );
                } else if (state is LoadingDataSuccessfulState) {
                  return Provider.of<FavoriteProvider>(context).favorites !=
                          null
                      ? TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            RefreshIndicator(
                                color: Theme.of(context).accentColor,
                                displacement: 100,
                                strokeWidth: 3,
                                backgroundColor: Colors.white,
                                onRefresh: () {
                                  context
                                      .read<FetchDataBloc>()
                                      .add(FetchDataEvent());
                                  return;
                                },
                                child: PlacesScreen(state.places)),
                            RefreshIndicator(
                              color: Theme.of(context).accentColor,
                              displacement: 100,
                              strokeWidth: 3,
                              backgroundColor: Colors.white,
                              onRefresh: () {
                                context
                                    .read<FetchDataBloc>()
                                    .add(FetchDataEvent());
                                return;
                              },
                              child: MyMap(state.places),
                            )
                          ],
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).accentColor),
                          ),
                        );
                } else if (state is ErrorState) {
                  return RefreshIndicator(
                      color: Theme.of(context).accentColor,
                      displacement: 100,
                      strokeWidth: 3,
                      backgroundColor: Colors.white,
                      onRefresh: () {
                        context.read<FetchDataBloc>().add(FetchDataEvent());
                        return;
                      },
                      child: ListView());
                } else
                  return RefreshIndicator(
                      color: Theme.of(context).accentColor,
                      displacement: 200,
                      strokeWidth: 3,
                      backgroundColor: Colors.white,
                      onRefresh: () {
                        context.read<FetchDataBloc>().add(FetchDataEvent());
                        return;
                      },
                      child: ListView());
              },
            ),
          ),
        ));
  }
}
