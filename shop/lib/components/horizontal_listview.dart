import 'package:flutter/material.dart';

class HorizontalList_ extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height * .4,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
//            color: Colors.blue,
            width: 350,
            height: MediaQuery.of(context).size.height * .4,
                child : new Container(
                    width: 20,
                    height: 100,
                    child:new Image.asset('assets/ps4_.png',)
                )
          ),
          new Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
//            color: Colors.blue,
              width: 350,
              height: MediaQuery.of(context).size.height * .4,
              child : new Container(
                  width: 20,
                  height: 100,
                  child:new Image.asset('assets/xbox_.png',)
              )
          ),
        ],
      ),

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
      padding: const EdgeInsets.all(2.0),
        child: new Container(

          decoration: new BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.all(
                Radius.circular(5.0) //         <--- border radius here
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