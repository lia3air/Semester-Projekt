import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vegan/Pages/home.dart';

void main (){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home()
  ));
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
}