import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Description extends StatelessWidget {
  final String? movieName,
      description,
      bannerurl,
      posterurl,
      releaseDate,
      votes;

  const Description(
      {super.key,
      this.movieName,
      this.description,
      this.bannerurl,
      this.posterurl,
      this.releaseDate,
      this.votes});
  // const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent.withOpacity(0.2),
      //   elevation:0,
      //   leading: IconButton(onPressed: (){
      //     Navigator.of(context).pop(context);
      //   }, icon: Icon(Icons.arrow_back_ios)),
      // ),
      body: Container(

        child: ListView(children: [
          Container(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(child: IconButton(onPressed: (){
              Navigator.of(context).pop(context);
            }, icon: Icon(Icons.arrow_back_ios)),)
              ])),
          // SizedBox(height: 15),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),

                height: 220,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Image.network(posterurl!,
                  fit: BoxFit.contain,
                ),
              ),
              Flexible(child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        movieName != null ? movieName! : 'Not Loaded',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24 ),
                      )),
                  Column(

                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 10),
                          child: custom_text(
                              text: 'Release Date - ' + releaseDate!, size: 14),alignment: Alignment.topLeft),

                      SizedBox(height: 10,),
                      Container(
                      padding: EdgeInsets.only(left: 10),
                          child: custom_text(text: 'Average Rating - ' + votes!), alignment: Alignment.topLeft),
                    ],
                  ),

                ],
              ), )
            ],
          ),

          Row(
            children: [
              // Container(
              //   height: 200,
              //   width: 100,
              //   child: Image.network(posterurl!),
              // ),
              Flexible(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(child: Text("Overview", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, )), alignment: Alignment.topLeft,),
                        SizedBox(height:10),
                        custom_text(text: description, size: 14),
                      ],
                    )),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
