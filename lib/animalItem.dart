import 'package:flutter/material.dart';

class Animal {
  String imagePath;
  String animalName;
  String kind;
  bool? flyExist = false;

  Animal( //클래스의 생성자 함수
  {required this.animalName, //required붙은 건 꼭 전달해야 하는 것들
  required this.kind,
  required this.imagePath,
  this.flyExist=false});
}