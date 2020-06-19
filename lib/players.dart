
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'dart:convert' as convert;
class Players {
  int ID;
  String CATEGORY_NAME;

  Players({

    this.ID,
    this.CATEGORY_NAME
  });

  factory Players.fromJson(Map<String, dynamic> parsedJson) {
    return Players(
        ID: parsedJson['ID'],
        CATEGORY_NAME: parsedJson['CATEGORY_NAME'] as String,
    );
  }
}

class PlayersViewModel {
  static List<Players> players;

  static Future loadPlayers() async {
    try {
      players = new List<Players>();


  var url = 'http://192.168.1.103:8081/tracker/register/liscategoryexpense';
List<dynamic> lst = List();
  List<dynamic> categoryJson2 = List();

  List<dynamic> categoryJson = List();
  
    var response = await http.get(url);
print(response);

    categoryJson2.add(convert.jsonDecode(response.body));

 print(categoryJson2);
      categoryJson = categoryJson2[0];



      // String jsonString = await rootBundle.loadString('assets/players.json');
      // Map parsedJson = json.decode(jsonString);
      // var categoryJson = parsedJson as List;
      for (int i = 0; i < categoryJson.length; i++) {
        players.add(new Players.fromJson(categoryJson[i]));
      }
    } catch (e) {
      print(e);
    }
  }
}