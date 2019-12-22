import 'package:flutter/material.dart';
import 'package:shop/pages/game_plt.dart';
import 'package:shop/services/games.dart';

class HorizontalList_ extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height * .4,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> new GridViewState(plt: 'ps4',)));
            },
            child: new Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
//            color: Colors.blue,
                width: 300,
                height: MediaQuery.of(context).size.height * .4,
                child : new Container(
                    width: 20,
                    height: 100,
                    child:new Image.asset('assets/ps4_.png',)
                )
            ),
          ),
          new GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> new GridViewState(plt: 'xbox',)));
              },
            child : new Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),
  //            color: Colors.blue,
                width: 300,
                height: MediaQuery.of(context).size.height * .4,
                child : new Container(
                    width: 20,
                    height: 100,
                    child:new Image.asset('assets/xbox_.png',)
                ),
            ),
          ),
            new GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new GridViewState(plt: 'nintendo',)));
              },
              child : new Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),
  //            color: Colors.blue,
                width: 300,
                height: MediaQuery.of(context).size.height * .4,
                child : new Container(
                    width: 20,
                    height: 100,
                    child:new Image.asset('assets/nintendo.png',)
                )
            ),
          )
        ],
      )
    );
  }
}

class HorizontalList extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Container(
      height: 70.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'images/pics/3.png',
            image_caption: 'اکشن',
          ),
          Category(
            image_location: 'images/pics/2.png',
            image_caption: 'مسابقه ای',
          ),
          Category(
            image_location: 'images/pics/1.png',
            image_caption: 'ماجراجویی',
          ),
          Category(
            image_location: 'images/pics/5.png',
            image_caption: 'ورزشی',
          ),
          Category(
            image_location: 'images/pics/5.png',
            image_caption: 'نقش آفرینی',
          ),
        ],
      ),
    );
  }
}


class Category extends StatelessWidget{

  final String image_location;
  final String image_caption;

  Category({
    this.image_location, this.image_caption
  });

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(7.0),
        child: new Container(
          decoration: new BoxDecoration(
            color: Colors.deepPurple,
              gradient: new LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1,0.9],
                colors: [
//                  Color(0xcc2b5e),
//                  Color(0xcc2b5e),
//                  Color(0x753a88),
//                  Color(0x753a88),
                  Color.fromRGBO(202, 43, 95 , 1),
                  Color.fromRGBO(118, 58, 136 , 1),
//                  Colors.deepPurple[700],
//                  Colors.green[600],

                ],
              ),
            borderRadius: BorderRadius.all(
                Radius.circular(15.0) //         <--- border radius here
            ),
          ),
          width: 120.0,
            child: new SizedBox(
            child : new Container(
                alignment: Alignment.center,
                child: new FittedBox(
                  alignment: Alignment.center,
                  child: new Text(image_caption, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0, color: Colors.white),),
              )
            ),
          ),
        ),
    );
  }
}