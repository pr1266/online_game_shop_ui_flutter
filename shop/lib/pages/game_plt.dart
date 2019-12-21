import 'package:shop/services/games.dart';
import 'package:flutter/material.dart';
import 'package:shop/models/models.dart';
import 'package:shop/pages/product_details.dart';

class GridViewState extends StatefulWidget{

  final header;
  final plt;

  GridViewState({this.plt, this.header});

  @override
  State<StatefulWidget> createState() {
    return MyGridView();
  }
}

class MyGridView extends State<GridViewState>{


  List<Games> games = [];

  getData() async {
    var token = await(GetToken().token({"username": "admin", "password": "admin"}));
    print(token['token']);
    var header = {
      'Authorization' : 'JWT ${token['token']}'
    };
    print('widget plt');
    print(widget.plt);
    var response = await (GamePlatform().GetGamePlt(widget.plt, header));
    setState(() {
      games.addAll(response['games']);
      print(games);
    });
  }

  @override
  void initState() {
    super.initState();
    print('header');
    print(widget.header);
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        title: new Text(widget.plt),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),

      body: new ListView(
        children: <Widget>[
          new Container(
            color: Colors.indigo,
            height: MediaQuery.of(context).size.height * .3,
            child: new Image.asset('assets/ps4_.png'),
          ),
          new GridView.builder(
              physics: ScrollPhysics(),
              itemCount: games.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height/1.4),
                //childAspectRatio: .5
              ),
              itemBuilder: (context,index){
                print('fuck');
                return new Container(
//                  decoration: new BoxDecoration(
//                      borderRadius: BorderRadius.all(Radius.circular(10))
//                  ),
                  child: new Card(
                    child: new GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new Directionality(textDirection: TextDirection.rtl, child: ProductDetails(prod_id: games[index].id.toString(), header: widget.header,))));
                      },
                      child: new Wrap(
                        children: <Widget>[
                          new Container(
//                            decoration: new BoxDecoration(
//                                borderRadius: BorderRadius.all(Radius.circular(10))
//                            ),
                            height: MediaQuery.of(context).size.height * .25,
                            //color: Colors.white,
                            child : Image.network(
                              'http://10.0.2.2:8000' + games[index].picture,
                              headers: widget.header,
                            ),
                            alignment: Alignment.center,
                          ),
                          new Container(
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  color: Colors.indigo,
                                  width: 5
                              ),
                            ),
                            //color: Colors.deepPurple,
                            child: new Container(
                              color: Colors.indigo,
                              child: ListTile(
                                title: new Container(
//                                color: Colors.black,
                                  child: new FittedBox(
                                    child: Text(games[index].name, textDirection: TextDirection.ltr,style: new TextStyle(color: Colors.white)),
                                  ),
                                  alignment: Alignment.center,
                                ),
//                          subtitle: new Container(
//                            child: new Text(games[index].price, textDirection: TextDirection.ltr, style: new TextStyle(color: Colors.white),),
//                            alignment: Alignment.bottomCenter,
//                          ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  padding: EdgeInsets.all(5),
                );
              }
          ),
        ],
      )
);
}

}