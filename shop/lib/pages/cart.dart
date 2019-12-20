import 'package:flutter/material.dart';
import 'package:shop/components/cart_prod.dart';

class Cart extends StatefulWidget{
  @override
  CartState createState()=> CartState();
}

class CartState extends State<Cart>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: new InkWell(
          onTap: (){},
          child: new Text('Shopping Cart'),
        ),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search, color: Colors.white), onPressed: null),
        ],
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: ListTile(
                title: new Text('Total Amount :', style: new TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                subtitle: new Text('\$230', style: new TextStyle(fontWeight: FontWeight.bold),),
              ),
            ),
            new Expanded(
              child: new MaterialButton(
                onPressed: (){},
                child: new Text('check out', style: new TextStyle(color: Colors.white),),
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
      body: new CartProducts(),
    );
  }
}