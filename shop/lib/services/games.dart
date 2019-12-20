import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shop/models/models.dart';

// TODO get basic information of officer
class GetToken{
  Future<Map> token(Map body) async{
    final response = await http.post('http://10.0.2.2:8000/api-token-auth/', body: body);
    var responsebody = json.decode(response.body);
    print(responsebody);
    return responsebody;
  }
}

// TODO Get the School have at least 'one' uncompleted practical exam session
class GetListOfGames{
  Future<Map> GetGames(Map<String, String> Header) async{
    final response = await http.get('http://10.0.2.2:8000/game/', headers : Header);
    var responsebody = json.decode(response.body);
    List<Games> sch = [];
    responsebody.forEach((item){
      sch.add(Games.fromJson(item));
    });
    return {
      'games': sch
    };
  }
}

class GameDetails{
  Future<Map> GetGame(String GameID, Map<String, String> Header) async{
    final response = await http.get('http://10.0.2.2:8000/game/${GameID}', headers : Header);
    var responsebody = json.decode(response.body);

    return {
      'games': responsebody
    };
  }
}


