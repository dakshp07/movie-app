import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailsPage extends StatefulWidget {

  final String moviename;
  DetailsPage({this.moviename});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  Map movieDetails;
  fetchMovieDetails() async{
    http.Response response = await http.get("http://www.omdbapi.com/?apikey={YOUR API_KEY}&i="+widget.moviename);
    setState(() {
      movieDetails = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchMovieDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(movieDetails["Title"],style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: movieDetails == null ? new Center(
        child: new CircularProgressIndicator(),
      ) : new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Padding(padding: const EdgeInsets.symmetric(horizontal: 1000)),
            new Image.network(movieDetails["Poster"],height: 400,width: 300,fit: BoxFit.fill,),
            new Padding(padding: const EdgeInsets.only(top: 5)),
            new Text(movieDetails["Title"],style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
            new Padding(padding: const EdgeInsets.only(bottom: 5)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(padding: const EdgeInsets.symmetric(horizontal: 5)),
                new Text("Year : "+movieDetails["Year"],style: TextStyle(fontSize: 20,color: Colors.grey[700],fontWeight: FontWeight.bold),),
                new Padding(padding: const EdgeInsets.symmetric(horizontal: 10)),
                new Text("Rated : "+movieDetails["Rated"],style: TextStyle(fontSize: 20,color: Colors.grey[700],fontWeight: FontWeight.bold),),
              ],
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 10)),
                new Padding(padding: const EdgeInsets.symmetric(horizontal: 190)),
                new Text("Runtime : "+movieDetails["Runtime"],style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                new Padding(padding: const EdgeInsets.only(top: 5)),
                new Text("Genre : "+movieDetails["Genre"],style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                new Padding(padding: const EdgeInsets.only(top: 5)),
                new Text("Box Office Collection : "+movieDetails["BoxOffice"],style: TextStyle(fontSize: 20,color: Colors.green[800],fontWeight: FontWeight.bold),),
                new Padding(padding: const EdgeInsets.only(top: 5)),
                new Text("IMDB : "+movieDetails["imdbRating"]+"/10",style: TextStyle(fontSize: 20,color: Colors.yellow[800],fontWeight: FontWeight.bold),),
                new Padding(padding: const EdgeInsets.only(top: 5)),
                new Text("Rotten Tomatoes : "+movieDetails["Ratings"][1]["Value"],style: TextStyle(fontSize: 20,color: Colors.red[800],fontWeight: FontWeight.bold),),
                new Padding(padding: const EdgeInsets.only(top: 5)),
                new Text("Awards & Nomination : "+movieDetails["Awards"],style: TextStyle(fontSize: 20,color: Colors.deepOrange[400],fontWeight: FontWeight.bold),),
                new Padding(padding: const EdgeInsets.only(top: 5)),
                new Text("Country : "+movieDetails["Country"],style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                new Padding(padding: const EdgeInsets.only(top: 5)),
                new Text("Language : "+movieDetails["Language"],style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                new Padding(padding: const EdgeInsets.only(top: 5)),
                new Text("Production : "+movieDetails["Production"],style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
            new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 20)),
                new Text("Director : "+movieDetails["Director"],style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                new Padding(padding: const EdgeInsets.only(top: 20)),
                new Text("Actors : "+movieDetails["Actors"],style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.justify,),
                new Padding(padding: const EdgeInsets.only(top: 20)),
                new Text("Plot : "+movieDetails["Plot"],style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.justify,)

              ],
            )
          ],
        ),
      )
    );
  }
}
