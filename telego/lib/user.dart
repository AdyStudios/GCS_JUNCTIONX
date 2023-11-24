import 'package:flutter/material.dart';

class User{
  int points=0;
  String name="";
  String phone="";
  User(this.points,this.name,this.phone);
  int getPoints(){return points;}
  String getName(){return name;}
  String getPhoneNum(){return phone;}
}