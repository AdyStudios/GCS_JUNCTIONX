import 'package:flutter/material.dart';

class User{
  int points=69420;
  String name="Fúú Kara Ádám";
  String phone="+36304862489";
  User(this.points,this.name,this.phone);
  int getPoints(){return points;}
  String getName(){return name;}
  String getPhoneNum(){return phone;}
}