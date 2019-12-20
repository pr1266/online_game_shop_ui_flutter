import 'package:flutter/material.dart';
import 'package:shop/main.dart';

class ProductDetails extends StatefulWidget{
  final product_detail_name;
  final product_detail_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_price,
    this.product_detail_old_price,
    this.product_detail_picture
  });

  @override
  ProductDetailsState createState()=> ProductDetailsState();
}


class ProductDetailsState extends State<ProductDetails>{
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
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
                  child: new Image.asset(widget.product_detail_picture)
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(widget.product_detail_name, style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                  title: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Text(widget.product_detail_old_price, style: new TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough, fontWeight: FontWeight.bold, fontSize: 16.0),),
                      ),
                      new Expanded(
                        child: new Text(widget.product_detail_price, style: new TextStyle(color: Colors.red, decoration: TextDecoration.lineThrough, fontWeight: FontWeight.bold, fontSize: 16.0),),
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
                            title: new Text('Count'),
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
                          child: new Text('count', style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
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
                          child: new Text('region', style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
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
                      color: Colors.red,
                      elevation: 0.2,
                      textColor: Colors.white,
                      child: new Text('Buy Now !', style: TextStyle(fontWeight: FontWeight.bold))
                  )
              ),
              new IconButton(icon : Icon(Icons.add_shopping_cart, color: Colors.red,), onPressed: (){}),
              new IconButton(icon : Icon(Icons.favorite_border, color: Colors.red,), onPressed: (){})
            ],
          ),
          new Divider(
              color: Colors.red
          ),
          new ListTile(
            title: new Text('Product Details'),
            subtitle: new Text(" is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"),
          ),
          new Divider(
              color: Colors.red
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text('Product Name', style: TextStyle(color: Colors.grey),),
              ),
              new Padding(
                  padding: EdgeInsets.all(5.0),
                  child: new Text(widget.product_detail_name)
              )
            ],
          ),


          new Row(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text('Product Brand', style: TextStyle(color: Colors.grey),),
              ),
              new Padding(
                  padding: EdgeInsets.all(5.0),
                  child: new Text('ubisoft')
              )
            ],
          ),

          new Row(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text('Product Condition', style: TextStyle(color: Colors.grey),),
              ),
              new Padding(
                  padding: EdgeInsets.all(5.0),
                  child: new Text('in Stock')
              )
            ],
          ),
          new Divider(
              color: Colors.red
          ),
          new Text('Similar Products', style: new TextStyle(color: Colors.red),),
          new Container(
            height: 220,
            child: SimilarProducts(),
          ),
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
                  product_detail_name: product_name,
                  product_detail_old_price: product_old_price,
                  product_detail_picture: product_pic,
                  product_detail_price: product_price,
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