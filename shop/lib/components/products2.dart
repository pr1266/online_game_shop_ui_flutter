import 'package:flutter/material.dart';



class Products extends StatefulWidget{
  @override
  ProductState createState() => ProductState();
}

class ProductState extends State<Products>{

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
    {
      "name": 'COD MW',
      "picture": 'images/prod/5.jpg',
      "old_price": '80',
      "price": '65'
    },
    {
      "name": 'Ghost Recon',
      "picture": 'images/prod/6.jpg',
      "old_price": '70',
      "price": '45'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        color: Colors.red,
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: new ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: product_list.length,
          itemBuilder: (BuildContext context, int index) {
            return SingleProd(
              product_name: product_list[index]['name'],
              product_pic: product_list[index]['picture'],
              product_old_price: product_list[index]['old_price'],
              product_price: product_list[index]['price'],
            );
          },
        )
    );
  }
}

class SingleProd extends StatelessWidget{

  final product_name;
  final product_pic;
  final product_old_price;
  final product_price;

  SingleProd({
    this.product_name,
    this.product_pic,
    this.product_old_price,
    this.product_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black45,
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Hero(
        tag: product_name,
        child: Material(
            child: InkWell(
              onTap: (){},
              child: GridTile(
                footer: new Container(
                  height: 20,
                  color: Colors.white70,
                  child: new ListTile(
                    leading: new Text(product_name, style: TextStyle(fontWeight: FontWeight.bold)),
                    title: new Text(product_price, style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),),
                    subtitle: new Text(product_old_price, style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.black, fontWeight: FontWeight.w400),),
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
