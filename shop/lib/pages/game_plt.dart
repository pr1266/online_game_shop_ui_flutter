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
      backgroundColor: Colors.white,
      body: new ListView(
        children: <Widget>[
          new Container(
            height: MediaQuery.of(context).size.height * .02,
          ),
          new Container(
            height: MediaQuery.of(context).size.height * .3,
              margin: EdgeInsets.only(left: 7, right: 7),
              decoration: new BoxDecoration(
                color: widget.plt == 'ps4' ? Colors.indigo : widget.plt == 'xbox' ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      width: 1,
                      color: Colors.transparent
                  )
              ),
                //color: Colors.indigo,
                child: new Image.asset(widget.plt == 'ps4' ? 'assets/ps4_.png' : widget.plt == 'xbox' ? 'assets/xbox_.png' : 'assets/nintendo.png'),
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
                            height: MediaQuery.of(context).size.height * .27,

                            //color: Colors.white,
                            child : new FittedBox(
                              child : Image.network(
                                'http://10.0.2.2:8000' + games[index].picture,
                                headers: widget.header,
                                fit: BoxFit.fitWidth,
//                              width: MediaQuery.of(context).size.width * .7,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          new Container(
                            decoration: new BoxDecoration(
                              //borderRadius: BorderRadius.all(Radius.circular(10)),
//                              border: Border.all(
//                                  color: Colors.indigo,
//                                  width: 5
//                              ),
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