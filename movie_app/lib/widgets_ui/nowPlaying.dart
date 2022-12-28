import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import '../screens/description.dart';

class NowPlaying extends StatelessWidget {

  final List  nowPlaying;

  const NowPlaying({Key? key, required this.nowPlaying}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      // padding: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            custom_text(text: "Now Playing", size: 26,),
            SizedBox(height: 10,),
            Container(
              height: 270,
              child: ListView.builder(
                  itemCount: nowPlaying.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return InkWell(

                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Description(
                          movieName: nowPlaying[index]['title'],
                          releaseDate: nowPlaying[index]
                          ['release_date'],
                          votes: nowPlaying[index]['vote_average']
                              .toString(),
                          bannerurl:
                          'https://image.tmdb.org/t/p/w500' +
                              nowPlaying[index]['backdrop_path'],
                          posterurl:
                          'https://image.tmdb.org/t/p/w500' +
                              nowPlaying[index]['poster_path'],
                          description: nowPlaying[index]['overview'],


                        )));
                      },
                      child: Container(

                        width: 155,
                        child: Column(
                          children: [

                            Container(
                              height:200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(width: 0, color: Colors.transparent),
                                  image: DecorationImage(image: NetworkImage('https://image.tmdb.org/t/p/w500/'+ nowPlaying[index]['poster_path']))
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(nowPlaying[index]['original_title']!=null?nowPlaying[index]['original_title']:"Loading",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
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
