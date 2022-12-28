import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/screens/login.dart';
import 'package:movie_app/screens/sidemenu.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets_ui/nowPlaying.dart';
import 'package:movie_app/widgets_ui/topRated.dart';
import 'package:movie_app/widgets_ui/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Moviescreen extends StatefulWidget {
  const Moviescreen({Key? key}) : super(key: key);

  @override
  State<Moviescreen> createState() => _MoviescreenState();
}

class _MoviescreenState extends State<Moviescreen> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List nowPlaying = [];
  final String apiKey = dotenv.get("API_KEY");
  final String readaccesstoken = dotenv.get("READ_ACCESS_TOKEN");

  @override
  void initState(){
    loadmovies();
    super.initState();
  }

  loadmovies()async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readaccesstoken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map trendingResults = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedResults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map nowResults = await  tmdbWithCustomLogs.v3.movies.getNowPlaying();

    setState(() {
      trendingMovies = trendingResults['results'];
      topRatedMovies = topratedResults['results'];
      nowPlaying = nowResults['results'];
    });
    // print(trendingMovies);
    // print(nowPlaying);
    print(topRatedMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255,30,38,50),
      appBar: AppBar(
        // leading: IconButton(icon: Icon(Icons.logout_outlined), onPressed: ()async{
        //   await FirebaseAuth.instance.signOut().then((value) => {
        //     Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen() ))
        //   });
        // }),
        backgroundColor: Colors.transparent,
        title: custom_text(text: 'Movie App'),
      ),
      drawer: MenuDrawer(),
      body: ListView(

        children: [
          TopRatedMovies(topRated: topRatedMovies,),
          TrendingMovies(trending: trendingMovies,),
          NowPlaying(nowPlaying: nowPlaying,)
        ],
      ),
    );
  }
}
