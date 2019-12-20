import 'package:flutter/material.dart';
import 'dart:convert';

class Games{
  int id;
  String name;
  String price;
  String picture;

  Games.fromJson(Map<String, dynamic> parsedJson){
    name    = utf8.decode(parsedJson['name'].toString().codeUnits);
    id      = parsedJson['id'];
    price   = parsedJson['price'].toString();
    picture = parsedJson['picture'];
  }
}

class TheoryTeacherClasses{
  int id;
  String start;
  String end;
  String type;
  int school_id;

  TheoryTeacherClasses.fromJson(Map<String, dynamic> parsedJson){
    id        = parsedJson['id'];
    start     = parsedJson['start_time'];
    end       = parsedJson['end_time'];
    type      = parsedJson['class_type'];
    school_id = parsedJson['school']['id'];
  }
}