import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/moviescreen.dart';
import 'package:movie_app/screens/login.dart';
import 'package:movie_app/utils/helper/sharedprefhelp.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets_ui/nowPlaying.dart';
import 'package:movie_app/widgets_ui/topRated.dart';
import 'package:movie_app/widgets_ui/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus()async{
    await SharedprefFunction.getUserLoggedInStatus().then((value){
        if(value!=null){
          setState(() {
            _isLoggedIn = value;
          });
        }
    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginScreen(),
      home:_isLoggedIn?const Moviescreen():const LoginScreen(),
      theme: ThemeData(

          brightness: Brightness.dark,
          primaryColor: Colors.green
      ),

    );
  }
}


