import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detailspage.dart';

class ResultPage extends StatefulWidget {

  final String search;
  ResultPage({this.search});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  Map movieData;
  fetchMovie() async {
    http.Response response = await http.get("http://www.omdbapi.com/?apikey={YOUR API_KEY}&s="+widget.search);
    setState(() {
      movieData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    fetchMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Your Movie",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: movieData == null ? new Center(
        child: new CircularProgressIndicator(),
      ) : new ListView.builder(
          itemCount: movieData.length,
          itemBuilder: (context , index ) =>
          new Column(
            children: <Widget>[
              new GestureDetector(
                child: new Card(
                  color: Color(0x000080),
                  shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: new Row(
                    children: <Widget>[
                      new Image.network(movieData["Search"][index]["Poster"],width: 150,height: 200,fit: BoxFit.cover,),
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(movieData["Search"][index]["Title"],style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text("Year : ",style: TextStyle(fontSize: 20,color: Colors.grey[800],fontWeight: FontWeight.bold),),
                              new Text(movieData["Search"][index]["Year"],style: TextStyle(fontSize: 20,color: Colors.grey[800],fontWeight: FontWeight.bold),),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DetailsPage(moviename: movieData["Search"][index]["imdbID"],)));
                },
              )
            ],
          )
      ),
    );
  }
}
