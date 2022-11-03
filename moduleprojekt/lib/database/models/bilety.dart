import 'package:flutter/material.dart';

class Bilet{
  final int id;
  final String rodzaj;
  final int numer;
  Bilet({
    this.id,
    this.rodzaj,
    this.numer
})
  factory Bilet.fromMap(
      Map<String,dynamic>map)=>new Bilet(
        "id":id,
        "rodzaj":rodzaj,
        "numer":numer
      );
}