import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_bloc_map_provider/Views/My%20Main%20Screen.dart';
import 'Provider/Favorite Provider.dart';
import 'Views/Authentication.dart';
import 'Views/Favorites.dart';
import 'Views/Place Details.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    ChangeNotifierProvider.value(
        value: FavoriteProvider(), child: MainScreen(sharedPreferences.get('email')!=null)),
  );
}
class MainScreen extends StatefulWidget {
  bool isLogin;
  MainScreen(this.isLogin);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState(){
    Provider.of<FavoriteProvider>(context,listen: false).uploadDataFromShared();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: widget.isLogin?MyMainScreen():AuthScreen(),
      theme: ThemeData(
          backgroundColor: Colors.deepPurple,
          accentColor: Colors.orange,
          textTheme: TextTheme(
            headline1: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w600),
            headline2: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500),
            headline3: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 25),
            headline4: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18),
          )),
      routes: {
        Favorites.routeName:(context)=>Favorites(),
        PlaceDetails.routeName:(context)=>PlaceDetails(),
        AuthScreen.routeName:(context)=>AuthScreen(),
        MyMainScreen.routeName:(context)=>MyMainScreen(),
      },
    );
  }
}
