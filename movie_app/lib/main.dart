import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/screens/login.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginScreen(),
      home: LoginScreen(),
      theme: ThemeData(

          brightness: Brightness.dark,
          primaryColor: Colors.green
      ),

    );
  }
}


// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
