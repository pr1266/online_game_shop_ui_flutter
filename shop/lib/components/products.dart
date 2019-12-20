import 'package:flutter/material.dart';
import 'package:shop/pages/product_details.dart';
import 'package:shop/main.dart';
import 'package:shop/services/games.dart';
import 'package:shop/models/models.dart';

class Products extends StatefulWidget{
  @override
  ProductState createState() => ProductState();
}

class ProductState extends State<Products>{
  var Header;
  getData() async{
    var token = await(GetToken().token({"username": "admin", "password": "admin"}));
    print(token['token']);
    var header = {
      'Authorization' : 'JWT ${token['token']}'
    };
    Header = header;
    print('widget header ');
    print(Header);
    var response = await(GetListOfGames().GetGames(header));
    print(response);
    setState(() {
      print('1');
      product_list.addAll(response['games']);
      print(response['games']);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  List<Games> product_list = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(top: 2),
        itemCount: product_list.length,
        itemBuilder: (BuildContext context, int index){
          return SingleProd(
            product_id: product_list[index].id,
            product_name: product_list[index].name,
            product_pic: product_list[index].picture,
            product_price: product_list[index].price,
            header: this.Header,
          );
        });
  }
}

class SingleProd extends StatelessWidget{

  final product_name;
  final product_pic;
  final product_id;
  final product_price;
  final header;

  SingleProd({
    this.header,
    this.product_name,
    this.product_pic,
    this.product_id,
    this.product_price});

  @override
  Widget build(BuildContext context) {
    print('this.header');
    print(product_pic);
    return new Container(

      height: MediaQuery.of(context).size.height * .2,
      decoration: BoxDecoration(
          border: Border.all(
              width: 5,
              color: Colors.deepPurple
          ),
          borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 1.0),
      child: new Card(
        //color: Colors.amberAccent,
        child: new Wrap(
          children: <Widget>[
              Image.asset(
                '',
//                  headers: this.header,
              ),
            ListTile(
              title: new Container(
                child: new Text(this.product_name, textDirection: TextDirection.ltr,),
                alignment: Alignment.bottomCenter,
              ),
              subtitle: new Container(
                child: new Text(this.product_price, textDirection: TextDirection.ltr),
                alignment: Alignment.bottomCenter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}