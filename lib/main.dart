import 'package:flutter/material.dart';
import 'resultpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.deepOrangeAccent,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController t1 = new TextEditingController(text: "");

  void clear(){
    t1.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Movie App",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: new Column(
        children: <Widget>[
          new Image.asset("assests/movie_theater_interior_a_l.jpg"),
          new Padding(padding: const EdgeInsets.only(top: 5)),
          new Container(
            padding: const EdgeInsets.all(20),
            child: new Column(
              children: <Widget>[
                new TextField(
                  decoration: new InputDecoration(
                    icon: new Icon(Icons.movie,size: 20,color: Colors.deepOrange,),
                    labelText: "Enter Movie Name",
                    labelStyle: TextStyle(fontSize: 20,color: Colors.deepOrange,fontWeight: FontWeight.bold),
                  ),
                  keyboardType: TextInputType.text,
                  controller: t1,
                ),
                new Padding(padding : const EdgeInsets.only(top: 15)),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new RaisedButton(
                        padding: const EdgeInsets.all(10),
                        child: new Text("Search",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ResultPage(search : t1.text)));
                        },
                      color: Colors.deepOrange,
                      shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    new RaisedButton(
                      padding: const EdgeInsets.all(10),
                      child: new Text("Clear",style: TextStyle(fontSize: 20,color: Colors.deepOrange,fontWeight: FontWeight.bold),),
                      onPressed: clear,
                      color: Colors.white,
                      shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
