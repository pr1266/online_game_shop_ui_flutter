import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shop/main.dart';
import 'package:shop/services/games.dart';

class ProductDetails extends StatefulWidget{
  final header;
  final prod_id;

  ProductDetails({
    this.header,
    this.prod_id,
  });

  @override
  ProductDetailsState createState()=> ProductDetailsState();
}

class ProductDetailsState extends State<ProductDetails>{

  var picture;
  var desc;
  var name;
  var price;
  var plt;
  var cat;
  var describ;

  getData() async{
    var id_ = widget.prod_id;
    var response = await (GameDetails().GetGame(id_.toString(), widget.header));
    print(response);
    var detail = response['games'];
    picture = detail['picture'];
    name = detail['name'];
    price = detail['price'];
    cat = detail['gameCat']['c_name'];
    plt = detail['gamePlt']['name'];
    describ = detail['describ'];
    print('data : ');
    print(name);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.deepPurple,
        title: new InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));},
            child: new Text('1266 GameShop')
        ),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search, color: Colors.white), onPressed: null),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: new Container(
                  color: Colors.white70,
                  child: new Image.network(picture, headers: widget.header)
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text('قیمت : ', style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                  title: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Text(this.price.toString(), style: new TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 16.0),),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                  child: MaterialButton(
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: new Text('تعداد'),
                            content: new Text('please set the count'),
                            actions: <Widget>[
                              new MaterialButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: new Text('Close')
                              )
                            ],
                          );
                        },
                      );
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Text('تعداد', style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                        ),
                        new Expanded(
                          child: new Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),
                  )
              ),
              new Expanded(
                  child: MaterialButton(
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: new Text('Region'),
                            content: new Text('please set the Region'),
                            actions: <Widget>[
                              new MaterialButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: new Text('Close')
                              )
                            ],
                          );
                        },
                      );
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new Text('ریجن', style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                        ),
                        new Expanded(
                          child: new Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),
                  )
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                  child: MaterialButton(
                      onPressed: (){},
                      color: Colors.deepPurple,
                      elevation: 0.2,
                      textColor: Colors.white,
                      child: new Text('اضافه کردن به سبد', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                  )
              ),
              new IconButton(icon : Icon(Icons.add_shopping_cart, color: Colors.deepPurple,), onPressed: (){}),
              new IconButton(icon : Icon(Icons.favorite_border, color: Colors.deepPurple,), onPressed: (){})
            ],
          ),
          new Divider(
              color: Colors.deepPurple
          ),
          new ListTile(
            title: new Text('نام بازی : ${name}'),
            subtitle: new Text(utf8.decode(describ.toString().codeUnits), style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
          ),
          new Divider(
              color: Colors.deepPurple
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text('نام محصول', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
              ),
              new Padding(
                  padding: EdgeInsets.all(5.0),
                  child: new Text(this.name, style : new TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20))
              )
            ],
          ),


          new Row(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text('پلتفرم :', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
              ),
              new Padding(
                  padding: EdgeInsets.all(5.0),
                  child: new Text(plt, style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20))
              )
            ],
          ),

          new Row(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text('موجودی :', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
              ),
              new Padding(
                  padding: EdgeInsets.all(5.0),
                  child: new Text('در انبار', style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20))
              )
            ],
          ),
          new Divider(
              color: Colors.deepPurple
          ),
          new Text('محصولات مشابه', style: new TextStyle(color: Colors.deepPurple),),
//          new Container(
//            height: 220,
//            child: SimilarProducts(),
//          ),
        ],
      ),
    );
  }
}


class SimilarProducts extends StatefulWidget{
  @override
  SimilarProductsState createState()=> SimilarProductsState();
}

class SimilarProductsState extends State<SimilarProducts>{
  var product_list = [
    {
      "name": 'dead stranding',
      "picture": 'images/prod/1.jpg',
      "old_price": '60',
      "price": '48'
    },
    {
      "name": 'nfs heat',
      "picture": 'images/prod/2.jpg',
      "old_price": '56',
      "price": '48'
    },
    {
      "name": 'dead island',
      "picture": 'images/prod/3.jpg',
      "old_price": '35',
      "price": '22'
    },
    {
      "name": 'motorGp',
      "picture": 'images/prod/4.jpg',
      "old_price": '40',
      "price": '30'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(top: 10),
        itemCount: product_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
        ),
        itemBuilder: (BuildContext context, int index){
          return SimilarSingleProd(
            product_name: product_list[index]['name'],
            product_pic: product_list[index]['picture'],
            product_old_price: product_list[index]['old_price'],
            product_price: product_list[index]['price'],
          );
        });
  }
}


class SimilarSingleProd extends StatelessWidget{

  final product_name;
  final product_pic;
  final product_old_price;
  final product_price;

  SimilarSingleProd({
    this.product_name,
    this.product_pic,
    this.product_old_price,
    this.product_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      child: Hero(
        tag: new Text(product_name),
        child: Material(
            child: InkWell(
              onTap: (){
                return Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ProductDetails(
//                  product_detail_name: product_name,
//                  product_detail_old_price: product_old_price,
//                  product_detail_picture: product_pic,
//                  product_detail_price: product_price,
                )));
              },
              child: GridTile(
                footer: new Container(
                  color: Colors.white,
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Text(product_name, style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                      ),
                      new Text("\$${product_price}", style: new TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                child: Image.asset(
                  product_pic,
                  fit: BoxFit.cover,
                ),
              ),
            )
        ),
      ),
    );
  }
}