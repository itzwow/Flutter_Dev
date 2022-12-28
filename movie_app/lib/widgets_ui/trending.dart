import 'package:flutter/material.dart';
import 'package:movie_app/screens/description.dart';
import 'package:movie_app/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            custom_text(
              text: "Trending Movies",
              size: 26,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 270,
              child: ListView.builder(
                  itemCount: trending.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Description(
                          movieName: trending[index]['title'],
                          releaseDate: trending[index]
                          ['release_date'],
                          votes: trending[index]['vote_average']
                              .toString(),
                          bannerurl:
                          'https://image.tmdb.org/t/p/w500' +
                              trending[index]['backdrop_path'],
                          posterurl:
                          'https://image.tmdb.org/t/p/w500' +
                              trending[index]['poster_path'],
                          description: trending[index]['overview'],


                        )));
                      },
                      child: trending[index]['title']!=null? Container(
                        width: 155,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      width: 0, color: Colors.transparent),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500/' +
                                              trending[index]['poster_path']))),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  trending[index]['original_title'] != null
                                      ? trending[index]['original_title']
                                      : "Movie Name",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ):Container(),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
