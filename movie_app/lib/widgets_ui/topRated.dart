import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import '../screens/description.dart';

class TopRatedMovies extends StatelessWidget {

  final List  topRated;

  const TopRatedMovies({Key? key, required this.topRated}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      // padding: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            custom_text(text: "Top Rated Movies", size: 26,),
            SizedBox(height: 15,),
            Container(
              height: 250,
              child: ListView.builder(
                  itemCount: topRated.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return InkWell(

                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Description(
                          movieName: topRated[index]['title'],
                          releaseDate: topRated[index]
                          ['release_date'],
                          votes: topRated[index]['vote_average']
                              .toString(),
                          bannerurl:
                          'https://image.tmdb.org/t/p/w500' +
                              topRated[index]['backdrop_path'],
                          posterurl:
                          'https://image.tmdb.org/t/p/w500' +
                              topRated[index]['poster_path'],
                          description: topRated[index]['overview'],


                        )));
                      },
                      child: Container(

                        width: 155,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [

                              Container(
                                height:200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(width: 0, color: Colors.transparent),
                                    image: DecorationImage(image: NetworkImage('https://image.tmdb.org/t/p/w500/'+ topRated[index]['poster_path']))
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(topRated[index]['original_title']!=null?topRated[index]['original_title']:"Loading",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
