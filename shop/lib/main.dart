import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shop/components/horizontal_listview.dart';
import 'package:shop/components/products.dart';
import 'package:shop/pages/cart.dart';
//import 'package:shop/components/products_2.dart';



void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
        home: new Directionality(textDirection: TextDirection.rtl, child: HomePage())
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    Widget image_carousal = new Container(
        padding: EdgeInsets.only(top: 4),
        height: 200.0,
        child: new Carousel(
          boxFit: BoxFit.cover,
          images: [
            Image.asset('assets/1.jpg'),
            Image.asset('assets/2.png'),
            Image.asset('assets/3.jpg'),
          ],
          autoplay: true,
          dotSize: 5.0,
          dotColor: Colors.deepPurple,
          indicatorBgPadding: 2.0,
          dotBgColor: Colors.transparent,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: new Duration(milliseconds: 1000),
        )
    );

    return Scaffold(
        appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: Colors.deepPurple,
          centerTitle: true,

          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.search, color: Colors.white), onPressed: null),
            new IconButton(icon: new Icon(Icons.shopping_cart, color: Colors.white), onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
            })
          ],
        ),
        drawer: new Drawer(
            child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: new Text('pr1266'),
                  accountEmail: new Text('pour.pourya@gmail.com'),
                  currentAccountPicture: GestureDetector(
                    child: new CircleAvatar(
                        backgroundColor: Colors.greenAccent,
                        child: Icon(Icons.person, color: Colors.white)
                    ),
                  ),
                  decoration: new BoxDecoration(
                      color: Colors.deepPurple
                  ),
                ),
                InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text('Home Page'),
                      leading: Icon(Icons.home, color: Colors.deepPurple),
                    )
                ),
                InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text('My Account'),
                      leading: Icon(Icons.person, color: Colors.deepPurple),
                    )
                ),
                InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text('My Orders'),
                      leading: Icon(Icons.shopping_basket, color: Colors.deepPurple),
                    )
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));},
                  child: ListTile(
                    title: Text('Shopping Cart'),
                    leading: Icon(Icons.shopping_cart, color: Colors.deepPurple),
                  ),
                ),
                InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text('favorites'),
                      leading: Icon(Icons.favorite, color: Colors.deepPurple),
                    )
                ),
                Divider(),
                InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text('Settings'),
                      leading: Icon(Icons.settings, color: Colors.black45),
                    )
                ),
                InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text('About'),
                      leading: Icon(Icons.help, color: Colors.blue),
                    )
                ),
              ],
            )
        ),
        body: new ListView(
          children: <Widget>[
            image_carousal,
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text('دسته بندی ها', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 25),),
            ),
            HorizontalList(),
            HorizontalList_(),
            new Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Text('محصولات اخیر', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 25),),
            ),
            new Container(
              color: Colors.white70,
              height: MediaQuery.of(context).size.height * .3,
              child: new Products(),
            ),
            new Padding(
                padding: const EdgeInsets.symmetric(vertical: 10)
            ),
            new Container(
              height: 60,
              color: Colors.black87,
              child: new Center(
                child:new Column(
                    children: <Widget>[
                      new Container(
                        height: 15,
                      ),
                      new Text(
                          'Designed and Created by Pr1266',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                      new Text('2019 Fall', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),),
                    ]
                ),
              ),
            )
          ],
        )
    );
  }
}