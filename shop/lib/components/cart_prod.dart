import 'package:flutter/material.dart';


class CartProducts extends StatefulWidget{
  @override
  CartProductsStates createState()=> CartProductsStates();
}

class CartProductsStates extends State<CartProducts>{
  @override
  Widget build(BuildContext context) {

    var prod_on_cart = [
      {
        "name": 'dead island',
        "picture": 'images/prod/3.jpg',
        "price": '22',
        "region": 'All',
        "count": 1
      },
      {
        "name": 'motorGp',
        "picture": 'images/prod/4.jpg',
        "price": '30',
        "region": 'All',
        "count": 1
      },
      {
        "name": 'dead stranding',
        "picture": 'images/prod/1.jpg',
        "region": 'All',
        "count": 1,
        "price": '48'
      },
      {
        "region": 'All',
        "count": 1,
        "name": 'nfs heat',
        "picture": 'images/prod/2.jpg',
        "price": '48'
      },
    ];

    return new Container(
        child: new ListView.builder(
          itemCount: prod_on_cart.length,
          itemBuilder: (context, index){
            return new SingleCartProducts(
              cart_product_count: prod_on_cart[index]["count"],
              cart_product_name: prod_on_cart[index]["name"],
              cart_product_price: prod_on_cart[index]['price'],
              cart_product_region: prod_on_cart[index]['region'],
              cart_product_pic: prod_on_cart[index]['picture'],
            );
          },
        )
    );
  }
}

class SingleCartProducts extends StatelessWidget{

  final cart_product_name;
  final cart_product_pic;
  final cart_product_price;
  final cart_product_region;
  var cart_product_count;

  SingleCartProducts({
    this.cart_product_name,
    this.cart_product_pic,
    this.cart_product_count,
    this.cart_product_region,
    this.cart_product_price});

  void add_count(){
    cart_product_count = cart_product_count + 1;
  }

  void sub_count(){
    cart_product_count = cart_product_count - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: new ListTile(
        leading: new Image.asset(cart_product_pic),
        title: new Text(cart_product_name),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
//                new Padding(
//                  child: new Text("Count :", style: new TextStyle(fontWeight: FontWeight.bold)),
//                  padding: EdgeInsets.all(0.0)
//                ),
//                new Padding(
//                    child: new Text(cart_product_count, style: new TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
//                    padding: EdgeInsets.all(4.0)
//                ),
                new Padding(
                    child: new Text("Region :", style: new TextStyle(fontWeight: FontWeight.bold)),
                    padding: EdgeInsets.all(0.0)
                ),
                new Padding(
                    child: new Text(cart_product_region, style: new TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                    padding: EdgeInsets.all(4.0)
                ),

              ],
            ),
            new Container(
                alignment: Alignment.topLeft,
                child: new Text('\$${cart_product_price}', style: new TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
            ),
          ],
        ),
      ),
    );
  }
}